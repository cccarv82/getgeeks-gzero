from faker import Faker
fake = Faker(['pt_BR'])

def screenshot_name():
    return fake.sha1()
