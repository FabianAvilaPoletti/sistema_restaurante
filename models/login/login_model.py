from config import mysql

class LoginModel():
    def __init__(self, usuario, contrasena):
        self.usuario = usuario
        self.contrasena = contrasena
        self.myqsl = mysql.connection

    def GetUserByUserPass(self):
        with self.myqsl.cursor() as cursor:
            sql = "SELECT `idUsuario` FROM `usuarios` WHERE usuario = %s AND pass = %s"
            values = (self.usuario, self.contrasena)
            cursor.execute(sql, values)
            
            resultado = cursor.fetchone()

            return resultado
