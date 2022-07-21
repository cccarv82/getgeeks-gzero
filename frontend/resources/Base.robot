*Settings*
Documentation           Base file

Library                 Browser
Library                 Collections
Library                 String

Library                 factories/Users.py
Library                 Utils.py

Resource                actions/_SharedActions.robot
Resource                actions/AuthActions.robot
Resource                actions/SignupActions.robot
Resource                actions/GeekActions.robot
Resource                actions/AttemptBeGeekActions.robot

Resource                Helpers.robot
Resource                Database.robot
Resource                Services.robot

*Variables*
${BASE_URL}             https://getgeeks-cccarv.herokuapp.com

*Keywords*
Start Session
    New Browser         ${BROWSER}        headless=${HEADLESS}       slowMo=00:00:00
    New Page            ${BASE_URL}
    Set Viewport Size   1280              768

After Test
    ${screenshot_name}  Screenshot Name
    Take Screenshot     fullPage=True     filename=${screenshot_name}
