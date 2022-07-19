*** Settings ***
Documentation            Arquivo Base
Library                  RequestsLibrary
Library                  factories/Users.py
Resource                 routes/SessionsRoute.robot
Resource                 routes/UsersRoute.robot

*** Variables ***
${API_USERS}             https://getgeeks-users-cccarv.herokuapp.com
