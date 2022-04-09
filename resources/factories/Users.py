from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

def factory_user():
    return {
        'name': fake.first_name(),
        'lastname': fake.last_name(),
        'email': fake.free_email(),
        'password': 'abc123'
    }

def factory_wrong_email():

    first_name = fake.first_name()
    last_name = fake.last_name()
    name = first_name + last_name

    return {
        'name': first_name,
        'lastname': last_name,
        'email': name.lower() + '#gmail.com',
        'password': 'abc123'
    }

def factory_user_login():
    return {
        'name': 'Carlos',
        'lastname': 'Carvalho',
        'email': 'carlos@email.com',
        'password': 'abc123'
    }