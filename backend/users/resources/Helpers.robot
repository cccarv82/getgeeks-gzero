*** Settings ***
Documentation              Helpers

*** Keywords ***
#Keyword para obtenção do token do usuário
Get Token
    [Arguments]               ${user}

    #Realizando login para obtenção do token do usuário da massa de dados
    ${payload}                Create Dictionary        email=${user}[email]
    ...                                                password=${user}[password]
    ${response}               POST Session             ${payload}
    ${result}                 Set Variable             ${EMPTY}

    IF        "200" in "${response}"
        #Caso o usuário exista, guardar o token de autenticação
        ${result}             Set Variable             Bearer ${response.json()}[token]
    END

    [return]                  ${result}

#Keyword que encapsula o método para verificação da existência de um usuário e deleção em caso positivo
Remove User
    [Arguments]               ${user}

    #Utilização da keyword Get Token para armazenar o token de sessão do usuário
    ${token}                  Get Token                ${user}

    #Condição IF que verifica se existe um token armazenado resultante da tentativa de login na keyword Get Token
    IF        "${token}"
        #Encerrando conta da massa de dados utilizando o token
        DELETE User               ${token}
    END
