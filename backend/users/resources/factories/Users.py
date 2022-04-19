from faker import Faker
fake = Faker(['pt_BR'])

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
