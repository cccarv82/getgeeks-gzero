*** Settings ***
Documentation                    Geek route test suite

Resource                         ${EXECDIR}/resources/Base.robot
Resource    ../resources/routes/UsersRoute.robot
Resource    ../resources/Helpers.robot
Resource    ../resources/routes/GeeksRoute.robot

*** Test Cases ***
#Caso de teste para pegar um usuário e transformar em Geek utilizando a API para atualizar as informações necessárias
Be a geek
    [Tags]        Smoke
    # Dado que temos um novo usuário
    ${user}                            Factory Be Geek
    Remove User                        ${user}
    POST User                          ${user}

    # E esse usuário possui um token válido
    ${token}                           Get Token                                ${user}

    # Quando faço uma requisição POST na rota /geeks
    ${response}                        POST Geek                                ${token}                ${user}[geek_profile]


    # Então deve retornar 201
    Status Should Be                   201                                      ${response}

    # E ao consultar esse usuário na API Users
    ${response}                        GET User                                 ${token}


    # Então o perfil geek deve ser retornado
    Should Be Equal As Strings         ${user}[name]                            ${response.json()}[name]
    Should Be Equal As Strings         ${user}[email]                           ${response.json()}[email]
    Should Be Equal As Strings         None                                     ${response.json()}[avatar]
    Should Be Equal As Strings         ${user}[geek_profile][whatsapp]          ${response.json()}[whatsapp]
    Should Be Equal As Strings         ${user}[geek_profile][desc]              ${response.json()}[desc]
    Should Be Equal As Numbers         ${user}[geek_profile][cost]              ${response.json()}[cost]
    Should Be Equal As Strings         ${user}[geek_profile][printer_repair]    ${response.json()}[printer_repair]
    Should Be Equal As Strings         ${user}[geek_profile][work]              ${response.json()}[work]
    Should Be Equal As Strings         True                                     ${response.json()}[is_geek]

#Test Case para buscar uma lista na API
Get Geek List
    #Pega a massa de dados específica para este caso de teste
    ${data}                            Factory Search For Geeks

    #Percorre a massa e cadastra dado a dado pra quantas massas encontrar em geeks usando os dados de geek_profile
    #Pega o token para cada usuário cadastrado
    #Transforma em geek cada usuário cadastrado
    FOR        ${geek}    IN    @{data}[geeks]
        POST User        ${geek}
        ${token}         Get Token        ${geek}
        POST Geek        ${token}         ${geek}[geek_profile]
    END

    POST User                          ${data}[user]
    ${token}                           Get Token                                ${data}[user]
    ${response}                        GET Geeks                                ${token}
    Status Should Be                   200                                      ${response}
    Log                                ${response.json()}[Geeks]
    ${total}                           Get Length                               ${response.json()}[Geeks]
    Should Be True                     ${total} > 0
