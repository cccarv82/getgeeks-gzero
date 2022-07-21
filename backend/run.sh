rm -rf report/*
#executar tudo
#robot -d ./report tests/
#robot -d ./report -i temp tests/Geeks.robot
pabot -x xunit.xml -d ./report tests/

# Criação do dashboard com métricas
# https://github.com/adiralashiva8/robotframework-metrics
robotmetrics  -t True --inputpath ./report --output output.xml
cp metrics-* ./report
rm -rf metrics-*

rm -rf report/pabot_results/
rm -rf .pabotsuitenames
