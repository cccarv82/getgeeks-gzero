*Settings*
Documentation           Login test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           Finish Session

*Test Cases*
User Login
    [Tags]                              positive
    ${user}                             Factory User Login

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