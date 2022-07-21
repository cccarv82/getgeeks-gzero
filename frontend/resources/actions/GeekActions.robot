*Settings*
Documentation                   Actions for Be Geek Tests

*Keywords*
Go To Be Geek Form
    Click                       a[href='/be-geek'] >> text=Seja um Geek
    Wait For Elements State     .be-geek-form               visible             5s

Go To Geeks
    Click                       a[href='/geeks'] >> text=Geeks
    Wait For Elements State     .title strong >> text=Estes são os Geeks disponíveis
    ...                         visible             5s
    Wait For Elements State     xpath=//article[contains(@class,"geek-item")][1]
    ...                         visible             5s

Fill Geek Form
    [Arguments]                 ${geek_profile}

    Reset Be Geek Form
    Fill Text                   id=whatsapp                             ${geek_profile}[whatsapp]
    Fill Text                   id=desc                                 ${geek_profile}[desc]

    #IF padrão
    IF                          '${geek_profile}[printer_repair]'
        Select Options By       id=printer_repair                       text                            ${geek_profile}[printer_repair]
    END

    #Inline IF
    IF                          '${geek_profile}[work]'                   Select Options By               id=work                                 text                            ${geek_profile}[work]

    Fill Text                   id=cost                                 ${geek_profile}[cost]

Fill Geeks Search Form
    [Arguments]                 ${printer_option}                       ${text_search}

    IF        '${printer_option}'
        Select Options By           id=printer_repair                       value                            ${printer_option}
    END

    Fill Text                   id=desc                                 ${text_search}


Submit Geek Form
    Click                       button >> text=Quero ser um Geek

Submit Geeks Search Form
    Click                       button >> text=Buscar

Geek Form Should Be Success
    ${expected_message}         Set Variable                            Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     p >> text=${expected_message}           visible         5s

Reset Be Geek Form
    #Execute Javascript          document.getElementsByClassName('be-geek-form')[0].reset();
    Evaluate Javascript          .be-geek-form      document.getElementsByClassName('be-geek-form')[0].reset();

Geek Should Be Found
    [Arguments]                  ${geek}
    ${full_alien_name}           Set Variable                            ${geek}[name] ${geek}[lastname]
    ${target}                    Get Element                             xpath=//strong[contains(text(), "${full_alien_name}")]/../../..
    ${work}                      Convert To Lower Case                   ${geek}[geek_profile][work]

    Get Text                     ${target}                               contains                Atendimento ${work}
    Get Text                     ${target}                               contains                ${geek}[geek_profile][desc]
    Get Text                     ${target}                               contains                ${geek}[geek_profile][cost]

    Set Suite Variable           ${target}

Alien Icon Should Be Visible
    Get Text                     ${target}                                contains               👽

Alien Icon Should Not Be Visible
    Get Text                     ${target}                                not contains           👽
