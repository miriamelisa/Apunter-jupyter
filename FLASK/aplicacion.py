# Este es el lanzado
from flask import Flask, render_template, jsonify

app = Flask(__name__)  # vamos a hacer una aplicación de flask

# Aquí se desarrolla la app ####################################


# Vamos a hacer las rutas:
@app.route("/")  # @= Quiere decir funcion decoradora, /= ruta principal
def principal():
    return render_template("principal.html")  # renderizar un archivo html


# Otra ruta
@app.route("/contactos")
def contactos():
    return render_template("contactos.html")


@app.route("/informacion", methods=["GET"])  # Saldrá lo que vamos a poner como API
def obtenerifo():
    return jsonify(
        [
            {"nombre": "Federico Rico", "telefono": "654211023"},
            {"nombre": "Andrea", "telefono": "659844565"},
        ]
    )


####################################
if __name__ == "__main___":
    app.run(debug=True)
