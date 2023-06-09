from models.login.login_model import LoginModel

class LoginController():
    def __init__(self, usuario, contrasena):
        self.usuario = usuario
        self.contrasena = contrasena
        self.login_model = LoginModel(self.usuario, self.contrasena)

    def LoginUser(self):
            # Lógica de verificación de inicio de sesión
            user = self.login_model.GetUserByUserPass()
            
            if user: 
                return user
            else:
               return None 
