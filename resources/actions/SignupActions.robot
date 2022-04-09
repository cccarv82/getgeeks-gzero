*Settings*
Documentation               Signup Actions

Resource                    ${EXECDIR}/resources/Base.robot

*Keywords*
Go To Signup Form
    Go To                           ${BASE_URL}/signup
    Wait For Elements State         .signup-form        visible         5s

Fill Signup Form
    [Arguments]                     ${user}
    Fill Text                       id=name             ${user}[name]
    Fill Text                       id=lastname         ${user}[lastname]
    Fill Text                       id=email            ${user}[email]
    Fill Text                       id=password         ${user}[password]

Submit Signup Form
    Click                           .submit-button >> text=Cadastrar

User Should Be Registered
    ${expected_message}             Set Variable        p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State         ${expected_message}
    ...                             visible             5s

Alert Span Should Be
    [Arguments]                     ${expected_alert}
    ${notification}                 Set Variable                    span[class=error] >> text=${expected_alert}

    Wait For Elements State         ${notification}                 visible         5s

Alert Spans Should Be
    [Arguments]                     ${expected_alerts}
    @{got_alerts}                   Create List
    ${spans}                        Get Elements                    span[class=error]

    FOR     ${span}     IN      @{spans}

        ${text}         Get Text        ${span}
        Append To List  ${got_alerts}   ${text}

    END

    Lists Should Be Equal           ${expected_alerts}              ${got_alerts}


Signup With Short Password
    [Arguments]                                 ${spwd}

    ${user}                                     Create Dictionary
    ...                                         name=Usuário            lastname=Teste
    ...                                         email=teste@email.com   password=${spwd}

    Go To Signup Form
    Fill Signup Form                            ${user}
    Submit Signup Form
    Alert Span Should Be                        Informe uma senha com pelo menos 6 caracteres