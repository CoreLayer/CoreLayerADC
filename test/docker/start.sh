docker-compose up -d
# docker cp corelayer-installer:/corelayer/CoreLayerADC/installer/batch.conf $PWD/batch.conf
# docker cp $PWD/batch.conf corelayer-cpx:/var/tmp/batch.conf
# rm $PWD/batch.conf

# docker stop corelayer-installer

# docker exec -d corelayer-cpx /var/netscaler/bins/cli_script.sh "batch -filename /var/tmp/batch.conf"
# docker exec -d corelayer-cpx /var/netscaler/bins/cli_script.sh "batch -filename /var/tmp/corelayer/config/cpx.conf"
