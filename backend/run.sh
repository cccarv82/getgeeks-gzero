rm -rf report/*
robotidy -c AlignSettingsSection:up_to_column=3:min_width=50 -c AlignTestCasesSection:enabled=True:widths=14,24 --line-length 80 -c AlignKeywordsSection:widths=10,10,24,30 --line-length 100 -c AlignVariablesSection:min_width=20 -c IndentNestedKeywords:enabled=True -c OrderTags:enabled=True tests
robocop --report all --output ./report/robocop.txt tests
#executar tudo
#robot -x xunit.xml -d ./report tests/
#robot -x xunit.xml -d ./report -i temp tests/Geeks.robot
pabot --processes 5 -x xunit.xml -d ./report tests/

# Criação do dashboard com métricas
# https://github.com/adiralashiva8/robotframework-metrics
robotmetrics  -t True --inputpath ./report --output output.xml
cp metrics-* ./report
rm -rf metrics-*

rm -rf report/pabot_results/
rm -rf .pabotsuitenames
