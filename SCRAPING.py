import re
import requests
from bs4 import BeautifulSoup
import sqlite3
while True:
    url = input("Por favor, introduce una URL: ")
    contenido=requests.get(url)
    soup=BeautifulSoup(contenido.text,"html.parser")
    
    datos_h1 = [h1.get_text() for h1 in soup.find_all("h1")]
    datos_h2 = [h2.get_text() for h2 in soup.find_all("h2")]
    datos_h3 = [h3.get_text() for h3 in soup.find_all("h3")]
    datos_h4 = [h4.get_text() for h4 in soup.find_all("h4")]
    datos_h5 = [h5.get_text() for h5 in soup.find_all("h5")]
    datos_p = [p.get_text() for p in soup.find_all("p")]
    datos_blockquote = [blockquote.get_text() for blockquote in soup.find_all("blockquote")]
    datos_cite = [cite.get_text() for cite in soup.find_all("cite")]
    datos_a = [a.get_text() for a in soup.find_all("a")]
    datos_address = [address.get_text() for address in soup.find_all("address")]
    datos_img = [img['src'] for img in soup.find_all("img", src=True)]

    conexion = sqlite3.connect('scraping1.db')

    conexion.execute('''
    CREATE TABLE IF NOT EXISTS urls (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        url TEXT NOT NULL
    )
''')

    conexion.execute('''
        CREATE TABLE IF NOT EXISTS titulos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url_id INTEGER,
            titulo TEXT NOT NULL,
            FOREIGN KEY (url_id) REFERENCES urls (id)
        )
    ''')

    conexion.execute('''
        CREATE TABLE IF NOT EXISTS parrafos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url_id INTEGER,
            parrafo TEXT NOT NULL,
            FOREIGN KEY (url_id) REFERENCES urls (id)
        )
    ''')

    conexion.execute('''
        CREATE TABLE IF NOT EXISTS imagenes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url_id INTEGER,
            src TEXT NOT NULL,
            FOREIGN KEY (url_id) REFERENCES urls (id)
        )
    ''')

    conexion.execute('INSERT INTO urls (url) VALUES (?)', (url,))
    url_id = conexion.execute('SELECT id FROM urls WHERE url = ?', (url,)).fetchone()[0]

    for titulo in datos_h1:
        conexion.execute('INSERT INTO titulos (url_id, titulo) VALUES (?, ?)', (url_id, titulo))
    for parrafo in datos_p:
        conexion.execute('INSERT INTO parrafos (url_id, parrafo) VALUES (?, ?)', (url_id, parrafo))
    for src in datos_img:
        conexion.execute('INSERT INTO imagenes (url_id, src) VALUES (?, ?)', (url_id, src))

    conexion.commit()
    conexion.close()

    print("Datos guardados en la base de datos.")
    respuesta = input("¿Quieres introducir otra URL? (si/no): ")
    if respuesta.lower() != 'si':
        break