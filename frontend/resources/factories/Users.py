import bcrypt
from faker import Faker
fake = Faker(['pt_BR'])


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed


def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_not_an_alien'),
        factory_user('searcher')
    ]


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
            'lastname': 'Numero 1',
            'email': 'geek@email.com',
            'password': 'abc123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': fake.texts(nb_texts=3, max_nb_chars=83),
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }
        },
        'attempt_be_geek': {
            'name': 'Geek',
            'lastname': 'Numero 2',
            'email': 'geek2@email.com',
            'password': 'abc123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': fake.texts(nb_texts=3, max_nb_chars=83),
                'printer_repair': 'Não',
                'work': 'Ambos',
                'cost': '200'
            }
        },
        'searcher': {
            'name': 'Geek',
            'lastname': 'Quinze',
            'email': 'geek15@email.com',
            'password': 'abc123'
        },
        'search_alien': {
            'name': 'Geek',
            'lastname': 'Treze',
            'email': 'geek13@email.com',
            'password': 'abc123',
            'geek_profile': {
                'whatsapp': '99999991001',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_not_an_alien': {
            'name': 'Geek',
            'lastname': 'Catorze',
            'email': 'geek14@email.com',
            'password': 'abc123',
            'geek_profile': {
                'whatsapp': '99999991002',
                'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS.',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }
        }
    }

    return data[tipo]
