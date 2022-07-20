*** Settings ***
Documentation            Arquivo Base
Library                  RequestsLibrary
Library                  factories/Users.py
Resource                 routes/SessionsRoute.robot
Resource                 routes/UsersRoute.robot
Resource                 routes/GeeksRoute.robot
Resource                 Helpers.robot

*** Variables ***
${API_USERS}             https://getgeeks-users-cccarv.herokuapp.com
${API_GEEKS}             https://getgeeks-geeks-cccarv.herokuapp.com
