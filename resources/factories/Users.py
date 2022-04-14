from faker import Faker
fake = Faker(['pt_BR'])

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

def factory_user(tipo):
    data = {
        'new_user': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'abc123'
        },
        'wrong_email': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.first_name() + fake.last_name() + '#gmail.com',
            'password': 'abc123'
        },
        'login': {
            'name': 'Carlos',
            'lastname': 'Carvalho',
            'email': 'carlos@email.com',
            'password': 'abc123'
        },
        'be_geek': {
            'name': 'Geek',
            'lastname': '1',
            'email': 'geek@email.com',
            'password': 'abc123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': fake.texts(nb_texts=3, max_nb_chars=83),
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        }
    }

    return data[tipo]
