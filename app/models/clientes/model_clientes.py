from datetime import datetime
from config import app, mysql

class ClientModel:

    # Constructor de la clase Clientes.
    def __init__(self, nombre, apellido, preferencias, condicionesEspeciales, telefono=0, idCliente=None, fechaRegistro=""):
        """
        Constructor de la clase ModelClientes.

        Args:
        - nombre: Nombre del cliente.
        - apellido: Apellido del cliente.
        - preferencias: Preferencias del cliente.
        - condicionesEspeciales: Condiciones especiales del cliente.
        - telefono (opcional): Teléfono del cliente.
        - idCliente (opcional): ID del cliente. Si no se proporciona, se establecerá como None.
        - fechaRegistro (opcional): Fecha de registro del cliente. Si no se proporciona, se establecerá como una cadena vacía.
        """

        # Asignar los valores proporcionados a los atributos correspondientes para poder acceder a ellos desde cualquier método de la clase.
        self.nombre = nombre
        self.apellido = apellido
        self.telefono = telefono
        self.preferencias = preferencias
        self.condicionesEspeciales = condicionesEspeciales
        self.fechaRegistro = fechaRegistro
        self.idCliente = idCliente
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
            sql_listar = "SELECT p.nombre, p.apellido, c.fechaRegistro, c.preferencias, c.condicionesEspeciales FROM clientes c LEFT JOIN personas p ON p.idPersona = c.idPersona"
            cursor.execute(sql_listar)

            # Guardar en la variable resultados todos los resultados devueltos por la consulta.
            resultados = cursor.fetchall()

        # Confirmar los cambios en la base de datos.
        self.database.commit()

        return resultados


    def AddClient(self):
        """
        Método para agregar un nuevo cliente a la base de datos.
        """

        # Obtener la fecha y hora actual como fecha de registro.
        self.fechaRegistro = datetime.now()

        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            # Construir la sentencia SQL de inserción en la tabla personas.
            sql_personas = "INSERT INTO personas (nombre, apellido, telefono) VALUES (%s, %s, %s)"
            values_personas = (self.nombre, self.apellido, self.telefono)

            # Ejecutar la sentencia SQL para insertar los datos en la tabla personas.
            cursor.execute(sql_personas, values_personas)

            # Obtener el ID de la última persona insertada.
            sql_persona_id = "SELECT LAST_INSERT_ID()"
            cursor.execute(sql_persona_id)
            id_persona = cursor.fetchone()[0]  # Utilizamos fetchone() para extraer el último ID.

            # Construir la sentencia SQL de inserción en la tabla clientes.
            sql_clientes = "INSERT INTO clientes (idPersona, fechaRegistro, preferencias, condicionesEspeciales) VALUES (%s, %s, %s, %s)"
            values_clientes = (id_persona, self.fechaRegistro, self.preferencias, self.condicionesEspeciales)

            # Ejecutar la sentencia SQL para insertar los datos en la tabla clientes.
            cursor.execute(sql_clientes, values_clientes)

        # Confirmar los cambios en la base de datos.
        self.database.commit()


    def UpdateClient(self):
        """
        Método para actualizar los datos de un cliente en la base de datos.
        """

        # Crear un cursor para ejecutar consultas usando el bloque with.
        with self.database.cursor() as cursor:

            # Construir la sentencia SQL de actualización en la tabla personas.
            sql_personas = "UPDATE personas SET nombre = %s, apellido = %s, telefono = %s WHERE idPersona = (SELECT idPersona FROM clientes WHERE idCliente = %s)"
            values_personas = (self.nombre, self.apellido, self.telefono, self.idCliente)

            # Ejecutar la sentencia SQL para actualizar los datos en la tabla personas.
            cursor.execute(sql_personas, values_personas)

            # Construir la sentencia SQL de actualización en la tabla clientes.
            sql_clientes = "UPDATE clientes SET preferencias = %s, condicionesEspeciales = %s WHERE idCliente = %s"
            values_clientes = (self.preferencias, self.condicionesEspeciales, self.idCliente)

            # Ejecutar la sentencia SQL para actualizar los datos en la tabla clientes.
            cursor.execute(sql_clientes, values_clientes)

        # Confirmar los cambios en la base de datos.
        self.database.commit()


    def DeleteClient(self):
        """
        Método para eliminar un cliente de la base de datos.
        """

        with self.database.cursor() as cursor:
            # Construir la sentencia SQL de eliminación en la tabla clientes.
            sql_eliminar = "DELETE FROM clientes WHERE idCliente = %s"
            cursor.execute(sql_eliminar, (self.idCliente,))

        # Confirmar los cambios en la base de datos.
        self.database.commit()
