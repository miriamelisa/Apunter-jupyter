import json
import sqlite3
from flask import Flask, jsonify, render_template, request
import pandas as pd
import requests
 
app = Flask(__name__)
BD = 'datosApi.db'
JSON_API_URL = 'http://127.0.0.1:5000/api/generar_json'

@app.route('/principal')
def principal():
    return render_template('administrador.html')

@app.route('/muestra')
def muestra():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('SELECT * FROM entradas')
        datos = cursor.fetchall()
    return render_template('muestra.html', data=datos)

def obtener_datos_desde_api():
    response = requests.get(JSON_API_URL)
    if response.status_code == 200:
        return response.json()
    else:
        return None

@app.route('/leer', methods=['GET'])
def leer():
    datosApi = obtener_datos_desde_api()
    if datosApi is not None:
        return render_template('leer.html', data=datosApi)
    else:
        return 'Error al obtener los datos'


def crear_tabla():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('CREATE TABLE IF NOT EXISTS entradas (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, entrada TEXT, descripcion TEXT, imagen TEXT)')
        conexion.commit()

crear_tabla()

@app.route('/')
def administracion():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('SELECT * FROM entradas')
        datos = cursor.fetchall()
    return render_template('administrador.html', data=datos)

@app.route('/insertar', methods=['POST'])
def insertar():
    if request.method == 'POST':
        titulo = request.form['titulo']
        entrada = request.form['entrada']
        descripcion = request.form['descripcion']
        imagen = request.form['imagen']

        with sqlite3.connect(BD) as conexion:
            cursor = conexion.cursor()
            cursor.execute('INSERT INTO entradas (titulo, entrada, descripcion, imagen) VALUES (?, ?, ?, ?)', (titulo, entrada, descripcion, imagen))
            conexion.commit()
            cursor.execute('SELECT * FROM entradas')
            datos = cursor.fetchall()
            confirmacion = '¡LOS DATOS SE HAN GUARDADO CORRECTAMENTE!'
        return render_template('administrador.html', data=datos, confirmacion=confirmacion)

@app.route('/buscar', methods=['POST'])
def buscar():
    if request.method == 'POST':
        nombre_busqueda = request.form.get('buscarNombre')
        nombre_busqueda = nombre_busqueda if nombre_busqueda is not None else ""

        with sqlite3.connect(BD) as conexion:
            cursor = conexion.cursor()
            cursor.execute('SELECT * FROM entradas WHERE titulo LIKE ? ORDER BY CASE WHEN titulo LIKE ? THEN 0 ELSE 1 END, titulo',
                           ('%' + nombre_busqueda + '%', '%' + nombre_busqueda + '%'))
            resultados = cursor.fetchall()

        return render_template('muestra.html', data=resultados)
    
@app.route('/api/generar_json', methods=['GET'])
def generar_json():
    with sqlite3.connect(BD) as conexion:
        query = 'SELECT titulo, entrada, imagen FROM entradas;'
        df = pd.read_sql_query(query, conexion)
    
    json_data = df.to_dict(orient='records')
    with open('datos.json', 'w') as json_file:
        json.dump(json_data, json_file)
    return jsonify(json_data)


if __name__== '__main__':
    app.run(debug=True)