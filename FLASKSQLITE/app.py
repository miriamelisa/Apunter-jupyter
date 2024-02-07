from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

BD = 'datos.db'

def crear_tabla():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('CREATE TABLE IF NOT EXISTS ejemplo (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT)')
        conexion.commit()

crear_tabla()

@app.route('/')
def index():
    with sqlite3.connect(BD) as conexion:
        cursor = conexion.cursor()
        cursor.execute('SELECT * FROM ejemplo')
        datos = cursor.fetchall()
    return render_template('index.html', data=datos)
#### Extraer DATOS!!!

@app.route('/insertar', methods=['POST'])
def insertar():
    if request.method == 'POST':
        nombre = request.form['nombre']
        with sqlite3.connect(BD) as conexion:
            cursor = conexion.cursor()
            cursor.execute('INSERT INTO ejemplo (nombre) VALUES (?)', (nombre,))
            conexion.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)