from config import mysql

def validate_credentials(usuario, contrasena):
    # Esta función valida las credenciales del usuario en la base de datos
    # Utiliza el objeto 'mysql' para ejecutar consultas SQL
    
    cursor = mysql.connection.cursor()
    
    # Consulta para verificar las credenciales en la tabla 'usuarios'
    query = "SELECT `idUsuario` FROM `usuarios` WHERE usuario = %s AND pass = %s"
    cursor.execute(query, (usuario, contrasena))

    result = cursor.fetchone()  # Obtiene el resultado de la consulta
    #Este metodo obtiene la primera fila de resultados de la consulta
    
    cursor.close()
    
    if result:
        return True  # Credenciales válidas
    else:
        return False  # Credenciales inválidas
