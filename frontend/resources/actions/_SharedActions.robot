*Settings*
Documentation               Shared actions

Resource                    ${EXECDIR}/resources/Base.robot

*Keywords*
Modal Content Should Be
    [Arguments]                     ${expected_title}               ${expected_text}
    ${modal_title}                  Set Variable                    .swal2-title
    ${modal_text}                   Set Variable                    .swal2-html-container
    
    Wait For Elements State         ${modal_title}                  visible         5s
    Wait For Elements State         ${modal_text}                   visible         5s
    Get Text                        ${modal_title}                  equal           ${expected_title}
    Get Text                        ${modal_text}                   equal           ${expected_text}

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