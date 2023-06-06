from config import app, mysql
from routes import *
from controllers.login.login_controllers import login

# Register blueprints
app.register_blueprint(login_blueprint, url_prefix='/login', name='login_blueprint')



if __name__ == '__main__':
    app.run(debug=True)
