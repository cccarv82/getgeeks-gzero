rm -rf report/*
robot -l NONE -o NONE -r NONE tasks/DatabasePreparation.robot
#executar tudo
#robot -d ./report tests/
#executar apenas positivos
#robot -d ./report -i positive tests/
#executar apenas negativos
#robot -d ./report -i negative tests/
#
robot -d ./report tests/AttemptBeGeek.robot
#
rm -rf playwright-log.txt
