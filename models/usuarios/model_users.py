from config import mysql

class UserModel():
    
    def __init__(self):
        self.database = mysql.connection

    def ListUsers(self):
        with self.database.cursor() as cursor:
            sql = "SELECT p.nombre, p.apellido, p.telefono, u.usuario, u.pass, r.rol FROM usuarios u LEFT JOIN personas p ON p.idPersona = u.idPersona LEFT JOIN roles r ON r.idRol = u.idRol"

            cursor.execute(sql)
            resultados = cursor.fetchall()
            print(resultados)

        return resultados