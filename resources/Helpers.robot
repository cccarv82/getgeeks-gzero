*Settings*
Documentation               Test helpers

Resource                    Base.robot

*Keywords*
Add User From Database
    [Arguments]                 ${user}

    Connect to Base
    Insert User                 ${user}
    Disconnect From Database