from functools import wraps
from flask import render_template, session, redirect, url_for
from config import app
from controllers.login.login_controllers import login_blueprint

#Importamos la función render_template de Flask para renderizar las plantillas HTML.
#Importamos la instancia app del archivo config.py, que representa nuestra aplicación Flask.
#Importamos el blueprint login_blueprint desde el módulo login_controllers dentro de la carpeta controllers/login. Este blueprint contiene las rutas y lógica relacionadas con el inicio de sesión.

app.register_blueprint(login_blueprint)
#Registramos el blueprint login_blueprint en nuestra aplicación Flask. Esto permite que las rutas y lógica definidas en el blueprint estén disponibles para la aplicación.

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not session.get('logged_in'):
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function


@app.route('/')
def login():
    return render_template('login/login.html')

#Definimos una ruta principal (/) para la función login().
#Cuando se accede a la ruta principal, se renderiza la plantilla HTML login.html ubicada en la carpeta templates/login. La función render_template toma el nombre de la plantilla como argumento y devuelve el contenido HTML correspondiente al navegador.

@app.route('/layout')
def layout():
    return render_template('components/layout.html')
