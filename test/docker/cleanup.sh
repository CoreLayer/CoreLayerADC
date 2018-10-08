docker rm corelayer-nginx-red
docker rm corelayer-nginx-green
docker rm corelayer-nginx-blue
# docker rm corelayer-cpx
# docker rm corelayer-installer

docker rmi -f corelayer-nginx-red
docker rmi -f corelayer-nginx-green
docker rmi -f corelayer-nginx-blue
# docker rmi -f store/citrix/netscalercpx:12.0-56.20
# docker rmi -f corelayer-installer

docker rmi -f nginx
docker rmi -f alpine
