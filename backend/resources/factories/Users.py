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


def factory_be_geek():
    return {
        'name': 'Geek Oito',
        'email': 'geek8@email.com',
        'password': 'abc123',
        'geek_profile': {
            'whatsapp': '99999999999',
            'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '99.90'
        }
    }


def factory_search_for_geeks():
    return {
        'user': {
            'name': 'Geek Nove',
            'email': 'geek9@email.com',
            'password': 'abc123'
        },
        'geeks': [
            {
                'name': 'Geek Dez',
                'email': 'geek10@email.com',
                'password': 'abc123',
                'geek_profile': {
                    'whatsapp': '99999999999',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                    'printer_repair': 'Não',
                    'work': 'Presencial',
                    'cost': '100'
                }
            },
            {
                'name': 'Geek Onze',
                'email': 'geek11@email.com',
                'password': 'abc123',
                'geek_profile': {
                    'whatsapp': '99999999999',
                    'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                    'printer_repair': 'Não',
                    'work': 'Ambos',
                    'cost': '110'
                }
            },
            {
                'name': 'Geek Doze',
                'email': 'geek12@email.com',
                'password': 'abc123',
                'geek_profile': {
                    'whatsapp': '99999999999',
                    'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                    'printer_repair': 'Sim',
                    'work': 'Remoto',
                    'cost': '120'
                }
            }
        ]
    }
