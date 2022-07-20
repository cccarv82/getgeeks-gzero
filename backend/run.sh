rm -rf report/*
#executar tudo
#robot -d ./report tests/
#robot -d ./report tests/Geeks.robot
pabot -d ./report tests/

# Criação do dashboard com métricas
# https://github.com/adiralashiva8/robotframework-metrics
robotmetrics --inputpath ./report --output output.xml
cp metrics-* ./report
rm -rf metrics-*

rm -rf report/pabot_results/
rm -rf .pabotsuitenames
