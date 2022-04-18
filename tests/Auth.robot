*Settings*
Documentation           Login test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           After Test

*Test Cases*
User Login
    [Tags]                              positive                    smoke
    ${user}                             Factory User                login

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Credentials
    User Should Be Logged In            ${user}

Pass or User Invalid
    [Tags]                              negative
    [Template]                          Invalid Credentials

    carlos@email.com                    pwd123
    carlos@carlos.com                   pwd123

Incorrect email
    [Tags]                              negative
    ${user}                             Create Dictionary               email=email.com             password=pwd123

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Credentials
    Should Be Type email

Required email
    [Tags]                              negative
    ${user}                             Create Dictionary               email=${EMPTY}              password=abc123

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Credentials
    Alert Span Should Be                E-mail obrigatório

Blank password
    [Tags]                              negative
    ${user}                             Create Dictionary               email=email@email.com      password=${EMPTY}

    Go To Login Page
    Fill Credentials                    ${user}
    Submit Credentials
    Alert Span Should Be                Senha obrigatória

Required Form Fields
    [Tags]                              negative
    @{expected_alerts}                  Create List
    ...                                 E-mail obrigatório
    ...                                 Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be               ${expected_alerts}
