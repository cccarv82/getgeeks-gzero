*Settings*
Documentation           Preparar o banco para novas execuçoes
...                     robot -l NONE -o NONE -r NONE tasks/DatabaseCleanUp.robot

Resource                ${EXECDIR}/resources/Base.robot

*Tasks*
Database Preparation
    Connect to Base
    Reset Env
    Users Seed
    Disconnect from Database