*Settings*
Documentation                   Sessions Actions

Resource                        ${EXECDIR}/users/resources/Base.robot


*Keywords*
Attempt POST Session
    [Arguments]                 ${payload}              ${status_code}              ${error_message}

    ${response}                 POST Session            ${payload}

    Status Should Be            ${status_code}          ${response}
    Should Be Equal             ${error_message}        ${response.json()}[error]
