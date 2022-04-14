*Settings*
Documentation           Base file

Library                 Browser
Library                 Collections

Library                 factories/Users.py

Resource                actions/_SharedActions.robot
Resource                actions/AuthActions.robot
Resource                actions/SignupActions.robot
Resource                actions/BeGeekActions.robot

Resource                Helpers.robot
Resource                Database.robot

*Variables*
${BASE_URL}             https://getgeeks-cccarv.herokuapp.com

*Keywords*
Start Session
    New Browser         chromium        headless=False       slowMo=00:00:00
    New Page            ${BASE_URL}

Finish Session
    Take Screenshot
