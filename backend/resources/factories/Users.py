def factory_new_user():
    return {
        'name': 'Geek Quatro',
        'email': 'geek4@email.com',
        'password': 'abc123'
    }


def factory_get_user():
    return {
        'name': 'Geek Cinco',
        'email': 'geek5@email.com',
        'password': 'abc123'
    }


def factory_remove_user():
    return {
        'name': 'Geek Seis',
        'email': 'geek6@email.com',
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


def factory_update_user():
    email = 'geek7@email.com'
    return {
        'before': {
            'name': 'Sete Geek',
            'email': email,
            'password': 'abc123'

        },
        'after': {
            'name': 'Geek Sete',
            'email': email,
            'whatsapp': '99999999999',
            'avatar': 'https://aws1.discourse-cdn.com/standard21/uploads/robotframework1/original/1X/702e61576ed30f6975fd86c11bd2a46402311868.png'
        }
    }
