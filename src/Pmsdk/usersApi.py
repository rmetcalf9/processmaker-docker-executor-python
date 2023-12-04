from .userObj import UserObj

class UsersApi():
    apiClient = None
    def __init__(self, apiClient):
        self.apiClient = apiClient

    def get_user_by_id(self, user_id):
        return UserObj()
