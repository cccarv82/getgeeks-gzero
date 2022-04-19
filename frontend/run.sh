rm -rf report/*
robot -l NONE -o NONE -r NONE tasks/DatabasePreparation.robot
#executar tudo
#robot -d ./report -v BROWSER:chromium -v HEADLESS:False tests/
#executar apenas positivos
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True -i positive tests/
#executar apenas negativos
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True -i negative tests/
#smoke test
#robot -d ./report/smoke_test -v BROWSER:chromium -v HEADLESS:True -i smoke tests/
#por tags
#robot -d ./report -v BROWSER:chromium -v HEADLESS:True tests/AttemptBeGeek.robot
#tudo via pabot
pabot -d ./report -v BROWSER:chromium -v HEADLESS:True tests/
#
rm -rf playwright-log.txt
mkdir report/browser
mkdir report/browser/screenshot
cp $(find report/pabot_results -type f -name "*.png") report/browser/screenshot/
rm -rf report/pabot_results/
rm -rf .pabotsuitenames