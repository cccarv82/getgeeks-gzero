*** Settings ***
Documentation                    Geek route test suite

Resource                         ${EXECDIR}/resources/Base.robot

*** Test Cases ***
#Caso de teste para pegar um usuário e transformar em Geek utilizando a API para atualizar as informações necessárias
Be a geek
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
