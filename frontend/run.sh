rm -rf report/*
robotidy -c AlignSettingsSection:up_to_column=3:min_width=50 -c AlignTestCasesSection:enabled=True:widths=14,24 --line-length 80 -c AlignKeywordsSection:widths=10,10,24,30 --line-length 100 -c AlignVariablesSection:min_width=20 -c IndentNestedKeywords:enabled=True -c OrderTags:enabled=True tests/
robocop --report all --output report/robocop.txt tests/
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
pabot --processes 5 -x xunit.xml -d ./report -v BROWSER:chromium -v HEADLESS:True tests/
#
rm -rf playwright-log.txt
mkdir report/browser
mkdir report/browser/screenshot
cp $(find report/pabot_results -type f -name "*.png") report/browser/screenshot/
rm -rf report/pabot_results/
rm -rf .pabotsuitenames

# Criação do dashboard com métricas
# https://github.com/adiralashiva8/robotframework-metrics
robotmetrics -t True --inputpath ./report --output output.xml
cp metrics-* ./report
rm -rf metrics-*
