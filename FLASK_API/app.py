from flask import Flask, render_template
 
app = Flask(__name__)
 
@app.route('/')
def principal():
    return render_template('administrador.html')
@app.route('/muestra')
def muestra():
    return render_template('muestra.html')
@app.route('/leer')
def leer():
    return render_template('leer.html')
 
 
if __name__== '__main__':
    app.run(debug=True)