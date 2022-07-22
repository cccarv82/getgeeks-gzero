rm -rf report/*
#executar tudo
#robot -x xunit.xml -d ./report tests/
#robot -x xunit.xml -d ./report -i temp tests/Geeks.robot
pabot --processes 10 --testlevelsplit -x xunit.xml -d ./report tests/

# Criação do dashboard com métricas
# https://github.com/adiralashiva8/robotframework-metrics
robotmetrics  -t True --inputpath ./report --output output.xml
cp metrics-* ./report
rm -rf metrics-*

rm -rf report/pabot_results/
rm -rf .pabotsuitenames
