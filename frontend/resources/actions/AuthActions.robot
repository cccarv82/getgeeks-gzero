*Settings*
Documentation               Authentication Actions

Resource                    ${EXECDIR}/resources/Base.robot

*Variables*
${INPUT_EMAIL}              id=email
${INPUT_PASSWD}             id=password


*Keywords*
Go To Login Page
    Go To                               ${BASE_URL}
    Wait For Elements State             .login-form                 visible         5s

Fill Credentials
    [Arguments]                         ${user}

    Fill Text                           ${INPUT_EMAIL}              ${user}[email]
    Fill Text                           ${INPUT_PASSWD}             ${user}[password]
    
Submit Credentials
    Click                               .submit-button >> text=Entrar

User Should Be Logged In
    [Arguments]                         ${user}
    ${fullname}                         Set Variable                ${user}[name] ${user}[lastname]
    ${element}                          Set Variable                a[href='/profile']

    Wait For Elements State             ${element}                  visible         5s
    Get Text                            ${element}                  equal           ${fullname}


Invalid Credentials
    [Arguments]                         ${email}                    ${password}
    ${user}                             Create Dictionary           email=${email}          password=${password}

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Credentials
    Modal Content Should Be             Oops...                     Usuário e/ou senha inválidos.

Should Be Type email
    Get Property                        ${INPUT_EMAIL}              type            equal           email