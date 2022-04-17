rm -rf report/*
robot -l NONE -o NONE -r NONE tasks/DatabasePreparation.robot
#executar tudo
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True tests/
#executar apenas positivos
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True -i positive tests/
#executar apenas negativos
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True -i negative tests/
#smoke test
robot -d ./report/smoke_test -v BROWSER:chromium -v HEADLESS:True -i smoke tests/
#por tags
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True tests/AttemptBeGeek.robot
#
rm -rf playwright-log.txt
