*Settings*
Documentation               Helpers

*Keywords*
Remove User
    [Arguments]             ${user}
    ${payload}              Create Dictionary          email=${user}[email]                 password=${user}[password]

    ${response}             POST Session               ${payload}

    IF                      "200" in "${response}"
        ${token}                Set Variable               Bearer ${response.json()}[token]
        DELETE User             ${token}
    END
