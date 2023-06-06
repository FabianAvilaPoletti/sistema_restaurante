from flask import Blueprint, render_template, request, redirect, url_for, session
from config import mysql
from models.login.login_model import validate_credentials

login_blueprint = Blueprint('login', __name__)

@login_blueprint.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contrasena = request.form['contrasena']
        
        # Validación de las credenciales utilizando el modelo
        if validate_credentials(usuario, contrasena):
            session['logged_in'] = True
            return redirect(url_for('layout'))
        else:
            error = 'Credenciales inválidas. Inténtalo de nuevo.'
            return render_template('login/login.html', error=error)

    return render_template('components/layout.html')
