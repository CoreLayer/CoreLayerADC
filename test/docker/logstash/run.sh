docker rm logstash
docker rmi flowfabric-logstash

docker build -t flowfabric-logstash .
docker run -it --name logstash -p 8514:8514/tcp -p 8514:8514/udp -p 9600:9600 -p 2055:2055/udp flowfabric-logstash

