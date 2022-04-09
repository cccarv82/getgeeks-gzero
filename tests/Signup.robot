*Settings*
Documentation           Signup Test Suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           Finish Session

*Test Cases*
Register a new user
    [Tags]                                      positive
    ${user}                                     Factory User

    Go To Signup Form
    Fill Signup Form                            ${user}
    Submit Signup Form
    User Should Be Registered

Try to register a user that already exists
    [Tags]                                      negative
    ${user}                                     Factory User
    Add User From Database                      ${user}
    
    Go To Signup Form
    Fill Signup Form                            ${user}
    Submit Signup Form
    Modal Content Should Be                     Oops...                 Já temos um usuário com o e-mail informado.

Wrong email
    [Tags]                                      negative
    ${user}                                     Factory Wrong Email

    Go To Signup Form
    Fill Signup Form                            ${user}
    Submit Signup Form
    Alert Span Should Be                        O email está estranho

Required Form Fields
    [Tags]                                      negative
    @{expected_alerts}                          Create List
    ...                                         Cadê o seu nome?
    ...                                         E o sobrenome?
    ...                                         O email é importante também!
    ...                                         Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be                       ${expected_alerts}

Short password
    [Tags]                                      negative
    [Template]                                  Signup With Short Password

    1
    11
    111
    1111
    11111
    aaaaa
    aaaa
    aaa
    aa
    a
    @
    @@
    @@@
    @@@@
    @@@@@
    a1@s%
    $r6%
    f$w
    $#
    &