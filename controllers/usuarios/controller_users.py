from models.usuarios.model_users import UserModel

class UserController():
    def __init__(self):
        self.user_model = UserModel()

    def GetUsers(self):
        list_users = self.user_model.ListUsers()
        print(list_users)
        return list_users
        
