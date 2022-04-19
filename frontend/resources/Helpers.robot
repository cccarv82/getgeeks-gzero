*Settings*
Documentation               Test helpers

Resource                    Base.robot

*Keywords*
Add User From Database
    [Arguments]                 ${user}

    Connect to Base
    Insert User                 ${user}
    Disconnect From Database

Do Login
    [Arguments]                 ${user}

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}
