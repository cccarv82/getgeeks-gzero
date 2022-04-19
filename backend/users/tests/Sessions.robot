*Settings*
Documentation               Test Suite for Sessions route

Resource                    ${EXECDIR}/users/resources/Base.robot

*Variables*
&{inv_pass}                 email=carlos@email.com          password=pwd132
&{inv_email}                email=carlos#email.com          password=pwd132
&{email_404}                email=carlos@404.com            password=pwd132
&{empty_email}              email=${EMPTY}                  password=pwd132
&{wo_email}                 password=pwd132
&{empty_pass}               email=carlos@email.com          password=${EMPTY}
&{wo_pass}                  email=carlos@email.com

*Test Cases*
User Session
    ${payload}              Create Dictionary               email=carlos@email.com          password=abc123
    ${response}             POST Session                    ${payload}

    Status Should Be        200                             ${response}

    ${token_length}         Get Length                      ${response.json()}[token]
    ${expected_token_size}  Convert To Integer              140

    Should Be Equal         ${expected_token_size}          ${token_length}
    Should Be Equal         10d                             ${response.json()}[expires_in]

Should Not Get Token
    [Template]              Attempt POST Session

    ${inv_pass}             401                             Unauthorized
    ${inv_email}            400                             Incorrect email
    ${email_404}            401                             Unauthorized
    ${empty_email}          400                             Required email
    ${wo_email}             400                             Required email
    ${empty_pass}           400                             Required pass
    ${wo_pass}              400                             Required pass
