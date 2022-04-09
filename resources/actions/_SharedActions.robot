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
