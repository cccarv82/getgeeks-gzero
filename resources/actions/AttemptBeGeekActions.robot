*Settings*
Documentation               Authentication Actions

Resource                    ${EXECDIR}/resources/Base.robot

*Keywords*
Attempt To Be A Geek
    [Arguments]                 ${key}      ${input}      ${output}
    ${user}                     Factory User              attempt_be_geek

    Set To Dictionary           ${user}[geek_profile]     ${key}        ${input}

    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be        ${output}
    Take Screenshot             fullPage=True

Start Session For Attempt To Be A Geek
    ${user}                     Factory User              attempt_be_geek

    Start Session
    Do Login                    ${user}
    Go To Be Geek Form
