*Settings*
Documentation                   Actions for Be Geek Tests

*Keywords*
Go To Be Geek Form
    Click                       a[href='/be-geek'] >> text=Seja um Geek
    Wait For Elements State     .be-geek-form               visible             5s

Fill Geek Form
    [Arguments]                 ${geek_profile}

    Fill Text                   id=whatsapp                             ${geek_profile}[whatsapp]
    Fill Text                   id=desc                                 ${geek_profile}[desc]
    Select Options By           id=printer_repair                       text                            ${geek_profile}[printer_repair]
    Select Options By           id=work                                 text                            ${geek_profile}[work]
    Fill Text                   id=cost                                 ${geek_profile}[cost]

Submit Geek Form
    Click                       button >> text=Quero ser um Geek

Geek Form Should Be Success
    ${expected_message}         Set Variable                            Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

    Wait For Elements State     p >> text=${expected_message}           visible         5s