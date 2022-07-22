*** Settings ***
Documentation                                     Session route test suite

Resource                                          ${EXECDIR}/resources/Base.robot


*** Test Cases ***
#Test Case de adição de novo usuário utilizando massa de dados específica e utilização da palavra chave Remove User
#tornando o test case de adição independente
Add new user
    [Tags]        smoke
    #Definindo a massa de dados a ser utilizada
    ${user}       Factory New User

    #Verificando a existência do usuário e deletando caso positivo
    Remove User                           ${user}

    #Criando a conta do usuário definido na massa de dados
    ${response}                           POST User               ${user}
    ${user_id}    Set Variable            ${response.json()}[id]
    Status Should Be                      201                     ${response}
    Should Be True                        ${user_id} > 0

#Test Case de verificação dos dados realizando login com um usuário

Get user data
    ${user}       Factory Get User

    POST User     ${user}
    ${token}      Get Token               ${user}

    ${response}                           GET User                ${token}
    Status Should Be                      200                     ${response}
    #Valida dois campos transformando ambos em String e comparando
    Should Be Equal As Strings            ${user}[name]           ${response.json()}[name]
    Should Be Equal As Strings            ${user}[email]          ${response.json()}[email]
    Should Be Equal As Strings            None                    ${response.json()}[avatar]
    Should Be Equal As Strings            None                    ${response.json()}[whatsapp]
    Should Be Equal As Strings            False                   ${response.json()}[is_geek]

Remove user
    # Dado que existe um usuário no sistema
    ${user}       Factory Remove User
    POST User     ${user}
    # E tenho um token desse usuário
    ${token}      Get Token               ${user}
    #Quando faço uma solicitação de remoção deste usuário na rota /users
    ${response}                           DELETE User             ${token}
    # Então deve retornar o status code 204
    Status Should Be                      204                     ${response}
    # E quando faço outra solicitação GET na rota /users com o memso token deve retornar o status code 404
    ${response}                           GET User                ${token}
    Status Should Be                      404                     ${response}

Update user
    ${user}       Factory Update User
    POST User     ${user}[before]
    ${token}      Get Token               ${user}[before]

    ${response}                           PUT User                ${token}                ${user}[after]
    Status Should Be                      200                     ${response}

    #Validações
    ${response}                           GET User                ${token}
    Should Be Equal As Strings            ${user}[after][name]    ${response.json()}[name]
    Should Be Equal As Strings            ${user}[after][email]                           ${response.json()}[email]
    Should Be Equal As Strings            ${user}[after][avatar]                          ${response.json()}[avatar]
    Should Be Equal As Strings            ${user}[after][whatsapp]                        ${response.json()}[whatsapp]
    Should Be Equal As Strings            False                   ${response.json()}[is_geek]
