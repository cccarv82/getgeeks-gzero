*Settings*
Documentation               Test Suite for Users route

Resource                    ${EXECDIR}/users/resources/Base.robot

*Test Cases*
Add New User
    ${user}                 Factory New User
    Remove User             ${user}

    ${response}             POST User                  ${user}
    Status Should Be        201                        ${response}
