*** Settings ***
Documentation                                     Session route test suite

Resource                                          ${EXECDIR}/resources/Base.robot


*** Variables ***
&{inv_email}        email=invalidemail.com    password=abc123
&{404_email}        email=404@email.com    password=abc123
&{empty_email}      email=${EMPTY}    password=abc123
&{wo_email}         password=abc123
&{inv_pass}         email=geek3@email.com    password=invalidpassword
&{empty_pass}       email=geek3@email.com    password=${EMPTY}
&{wo_pass}          email=geek3@email.com


*** Test Cases ***
User session
    [Tags]        smoke

    ${payload}    Factory User Session    signup
    POST User     ${payload}

    ${payload}    Factory User Session    login
    ${response}                           POST Session            ${payload}
    ${token_lenght}                       Get Length              ${response.json()}[token]

    Status Should Be                      200                     ${response}
    Should Be True                        ${token_lenght} > 0
    Should Be Equal                       10d                     ${response.json()}[expires_in]

Should Not Get Token
    [Tags]        negativo
    [Template]    Attempt POST Session

    ${inv_email}    400    Incorrect email
    ${404_email}    401    Unauthorized
    ${empty_email}    400    Required email
    ${wo_email}    400    Required email
    ${inv_pass}    401    Unauthorized
    ${empty_pass}    400    Required pass
    ${wo_pass}    400    Required pass


*** Keywords ***
Attempt POST Session
    [Arguments]    ${payload}    ${status_code}    ${error_message}
    ${response}    POST Session    ${payload}

    Status Should Be    ${status_code}    ${response}
    Should Be Equal    ${error_message}    ${response.json()}[error]

# O uso de variáveis nesse caso, ocasionou na quebra da regra que diz que deve-se usar variável quando o dado se repetir
# porém, nesse caso específico, para uso de forma elegante da funcionalidade de template, fazemos uso das variáveis
