from flask import Flask, render_template
 
app = Flask(__name__)
 
@app.route('/')
def principal():
    return render_template('principal.html')
 
 
@app.route('/contactos')
def contactos():
    return render_template('contactos.html')
if __name__== '__main__':
    app.run(debug=True)