*** Settings ***
Documentation       Session route test suite
Resource            ${EXECDIR}/users/resources/Base.robot

*** Test Cases ***
#Test Case de adição de novo usuário utilizando massa de dados específica e utilização da palavra chave Remove User
#tornando o test case de adição independente
Add new user
    #Definindo a massa de dados a ser utilizada
    ${user}                   Factory New User

    #Verificando a existência do usuário e deletando caso positivo
    Remove User               ${user}

    #Criando a conta do usuário definido na massa de dados
    ${response}               POST User                ${user}
    Status Should Be          201                      ${response}
