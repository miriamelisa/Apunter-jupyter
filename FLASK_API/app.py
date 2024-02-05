import sqlite3
from flask import Flask, redirect, render_template, request, url_for

app = Flask(__name__)
BD = 'datos.db'
##Creo una tabla en la BBDD
def crear_tabla():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('CREATE TABLE IF NOT EXISTS datos (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, entrada TEXT, descripcion TEXT, imagen TEXT)')
        conexion.commit()
crear_tabla()

##cambio de páginas para navegar
@app.route('/muestra')
def muestra():
    return render_template('muestra.html')

@app.route('/leer')
def leer():
    return render_template('leer.html')
##pagina administrador creo la conexion a la BBDD
@app.route('/')
def administrador():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('SELECT * FROM datos')
        datos = cursor.fetchall()
    return render_template('administrador.html', data=datos)
##GUARDO LO DATOS EN LA BBDD
@app.route('/insertar', methods=['POST'])
def insertar():
    if request.method == 'POST':
        titulo = request.form['titulo']
        entrada = request.form['entrada']
        descripcion = request.form['descripcion']
        imagen = request.form['imagen']
        with sqlite3.connect(BD) as conexion:
            cursor = conexion.cursor()
            cursor.execute('INSERT INTO datos (titulo, entrada, descripcion, imagen) VALUES (?, ?, ?, ?)', (titulo, entrada, descripcion, imagen))
            conexion.commit()
    return redirect(url_for('administrador'))

##Borrar datos de 


if __name__ == '__main__':
    app.run(debug=True)
