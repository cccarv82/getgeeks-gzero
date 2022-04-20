from faker import Faker
fake = Faker(['pt_BR'])

def factory_new_user():

    return {
        'name': 'Teste 001',
        'email': 'teste@001.com',
        'password': 'abc123'
    }

def factory_user_session(target):

    name = 'Usuário de Teste',
    email = 'usuario@teste.com',
    password = 'abc123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }
    return data[target]
