*** Settings ***
Documentation              Helpers

*** Keywords ***
#Keyword que encapsula o método para verificação da existência de um usuário e deleção em caso positivo
Remove User
    [Arguments]               ${user}

    #Realizando login para obtenção do token do usuário da massa de dados
    ${payload}                Create Dictionary        email=${user}[email]                password=${user}[password]
    ${response}               POST Session             ${payload}

    #Condição IF que verifica o retorno da tentativa de login para verificar se o usuário existe ou não
    IF        "200" in "${response}"
        #Caso o usuário exista, guardar o token de autenticação
        ${token}                  Set Variable             Bearer ${response.json()}[token]
        #Encerrando conta da massa de dados utilizando o token
        DELETE User               ${token}
    END
