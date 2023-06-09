from models.clientes.model_clients import ClientModel

class ClientController:

    def __init__(self):
        self.client_model = ClientModel()

    def GetClients(self):
        list_clients = self.client_model.ListClients()
        return list_clients
    
    def AddClient(self, nombre, apellido, telefono, preferencias, condicionesEspeciales):
        self.client_model.AddClient(nombre, apellido, telefono, preferencias, condicionesEspeciales)

    def DeleteClient(self, idClient):
        self.client_model.DeleteClient(idClient)
        
    def get_client_by_id(self, idClient):
        client = self.client_model.get_client_by_id(idClient)
        return client

    def UpdateClient(self, id, nombre, apellido, telefono, fecha, preferencias, condicionesEspeciales):
        self.client_model.UpdateClient(id, nombre, apellido, telefono, fecha, preferencias, condicionesEspeciales)
        