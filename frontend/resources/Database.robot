*Settings*
Documentation           Database helpers

Library                 DatabaseLibrary
Library                 factories/Users.py

*Keywords*
Connect to Base
    Connect To Database         psycopg2
    ...                         vrtqfdjh
    ...                         vrtqfdjh
    ...                         xXaFCcqfBZhQcHXCt_PpR50-Sva7Htek
    ...                         heffalump.db.elephantsql.com
    ...                         5432

Reset Env
    Execute SQL String          DELETE from public.geeks;
    Execute SQL String          DELETE from public.users;

Insert User
    [Arguments]                 ${u}
    ${hashed_pass}              Get Hashed Pass         ${u}[password]
    ${q}                        Set Variable            INSERT into public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false)

    Execute SQL String          ${q}

#Palavra chave que recupera a lista de usuários no arquivo de massa, percorre a lista e adiciona um por um até acabar a lista
Users Seed
    ${users}                    Users To Insert DB

    FOR    ${user}    IN    @{users}
        Insert User    ${user}
    END
