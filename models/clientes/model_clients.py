from datetime import datetime
from config import mysql

class ClientModel:


    # Constructor de la clase Clientes.
    def __init__(self):
        self.database = mysql.connection


    def ListClients(self):
        """
        Método para listar los clientes.

        Returns:
        - resultados: Lista de resultados devueltos por la consulta.
        """

        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            # Construir la sentencia SQL para listar los clientes.
            sql_listar = "SELECT p.nombre, p.apellido, p.telefono, c.fechaRegistro, c.preferencias, c.condicionesEspeciales, c.idCliente FROM clientes c LEFT JOIN personas p ON p.idPersona = c.idPersona"
            cursor.execute(sql_listar)

            # Guardar en la variable resultados todos los resultados devueltos por la consulta.
            resultados = cursor.fetchall()
            print(resultados)

        return resultados



    def AddClient(self, nombre, apellido, telefono, preferencias, condicionesEspeciales):
        """
        Método para agregar un nuevo cliente a la base de datos.
        """

        nombre = nombre
        apellido = apellido
        telefono = telefono
        preferencias = preferencias
        condiciones_especiales = condicionesEspeciales
        # Obtener la fecha y hora actual como fecha de registro.
        fecha_registro = datetime.now()

        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            # Construir la sentencia SQL de inserción en la tabla personas.
            sql_personas = "INSERT INTO personas (nombre, apellido, telefono) VALUES (%s, %s, %s)"
            values_personas = (nombre, apellido, telefono)

            # Ejecutar la sentencia SQL para insertar los datos en la tabla personas.
            cursor.execute(sql_personas, values_personas)

            # Obtener el ID de la última persona insertada.
            sql_persona_id = "SELECT LAST_INSERT_ID()"
            cursor.execute(sql_persona_id)
            id_persona = cursor.fetchone()[0]  # Utilizamos fetchone() para extraer el último ID.

            # Construir la sentencia SQL de inserción en la tabla clientes.
            sql_clientes = "INSERT INTO clientes (idPersona, fechaRegistro, preferencias, condicionesEspeciales) VALUES (%s, %s, %s, %s)"
            values_clientes = (id_persona, fecha_registro, preferencias, condiciones_especiales)

            # Ejecutar la sentencia SQL para insertar los datos en la tabla clientes.
            cursor.execute(sql_clientes, values_clientes)

        # Confirmar los cambios en la base de datos.
        self.database.commit()



    def DeleteClient(self, idClient):
        """
        Método para eliminar un cliente de la base de datos.
        """

        id_client = idClient

        get_persona = self.get_client_by_id(id_client)

        with self.database.cursor() as cursor:
            # Construir la sentencia SQL de eliminación en la tabla clientes.
            sql_eliminar_client = "DELETE FROM clientes WHERE idCliente = %s"
            cursor.execute(sql_eliminar_client, (id_client,))

            sql_eliminar_persona = "DELETE FROM personas WHERE idPersona = %s"
            cursor.execute(sql_eliminar_persona, (get_persona[7],)) 

        # Confirmar los cambios en la base de datos.
        self.database.commit()



    def UpdateClient(self, idClient, nombre, apellido, telefono, fechaRegistro, preferencias, condicionesEspeciales):
        """
        Método para actualizar los datos de un cliente en la base de datos.
        """
        id_client = idClient
        nombre = nombre
        apellido = apellido
        telefono = telefono
        fecha_registro = fechaRegistro
        preferencias = preferencias
        condiciones_especiales = condicionesEspeciales

        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            # Construir la sentencia SQL de actualización en la tabla personas.
            sql_personas = "UPDATE personas SET nombre = %s, apellido = %s, telefono = %s WHERE idPersona = (SELECT idPersona FROM clientes WHERE idCliente = %s)"
            values_personas = (nombre, apellido, telefono, id_client)

            # Ejecutar la sentencia SQL para actualizar los datos en la tabla personas.
            cursor.execute(sql_personas, values_personas)

            # Construir la sentencia SQL de actualización en la tabla clientes.
            sql_clientes = "UPDATE clientes SET preferencias = %s, condicionesEspeciales = %s, fechaRegistro = %s  WHERE idCliente = %s"
            values_clientes = (preferencias, condiciones_especiales, fecha_registro, id_client)

            # Ejecutar la sentencia SQL para actualizar los datos en la tabla clientes.
            cursor.execute(sql_clientes, values_clientes)

        # Confirmar los cambios en la base de datos.
        self.database.commit()



    def get_client_by_id(self, idClient):

        self.id_client = idClient

        # Aquí va la lógica para obtener los datos del cliente por su ID
        with self.database.cursor() as cursor:
            query = "SELECT p.nombre, p.apellido, p.telefono, c.fechaRegistro, c.preferencias, c.condicionesEspeciales, c.idCliente, p.idPersona FROM clientes c, personas p WHERE c.idCliente = %s and c.idPersona = p.idPersona"
            cursor.execute(query, (self.id_client,))
            client = cursor.fetchone()

        # Confirmar los cambios en la base de datos.
        self.database.commit()

        # Si el cliente no existe, devolver None
        if client is None:
            return None

        # Devolver los datos del cliente
        return client
