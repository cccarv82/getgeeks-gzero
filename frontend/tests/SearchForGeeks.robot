*** Settings ***
Documentation                                     Search for Geeks Test Suite

Resource                                          ${EXECDIR}/resources/Base.robot

Test Setup                                        Start Session
Test Teardown                                     After Test


*** Test Cases ***
Search for alien geek
    #preparação da massa criando um prestador de serviço
    ${alien}      Factory User            search_alien
    Create Geek Profile Service           ${alien}

    #realização do login utilizando o perfil do usuário que busca por prestadores de serviço
    ${searcher}                           Factory User            searcher
    Do Login      ${searcher}

    Go To Geeks
    Fill Geeks Search Form                Sim                     Matricial a fita colorida
    Submit Geeks Search Form
    Geek Should Be Found                  ${alien}
    Alien Icon Should Be Visible

Search for not an alien geek
    #preparação da massa criando um prestador de serviço
    ${not_an_alien}                       Factory User            search_not_an_alien
    Create Geek Profile Service           ${not_an_alien}

    #realização do login utilizando o perfil do usuário que busca por prestadores de serviço
    ${searcher}                           Factory User            searcher
    Do Login      ${searcher}

    Go To Geeks
    Fill Geeks Search Form                Não                     Archlinux
    Submit Geeks Search Form
    Geek Should Be Found                  ${not_an_alien}
    Alien Icon Should Not Be Visible

Geek not found
    ${searcher}                           Factory User            searcher
    Do Login      ${searcher}
    Go To Geeks
    Fill Geeks Search Form                Não                     Atari
    Submit Geeks Search Form
    Validate Geek Not Found Message
