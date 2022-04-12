*Settings*
Documentation                   Be a Geek Test Suite

Resource                        ${EXECDIR}/resources/Base.robot

Test Setup                      Start Session
Test Teardown                   Finish Session


*Test Cases*
Be a Geek

    # Dado que eu tenha um usuário comum
    ${user}                     Factory User Be Geek

    # Faço login na plataforma
    Do Login                    ${user}

    # Quando submeto o formulário para me tornar um geek
    Go To Be Geek Form
    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form

    # Entao devo ver a mensagem de sucesso
    Geek Form Should Be Success
    Sleep               5s