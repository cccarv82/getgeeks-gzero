def factory_new_user():
    return {
        'name': 'Geek Quatro',
        'email': 'geek4@email.com',
        'password': 'abc123'
    }


def factory_user_session(target):
    name = 'Geek Três'
    email = 'geek3@email.com'
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
