FROM docker.elastic.co/logstash/logstash-oss:6.4.0
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
ADD patterns/ /usr/share/logstash/patterns

ENV CONFIG_RELOAD_AUTOMATIC true
ENV CONFIG_RELOAD_INTERVAL 10s
#ENV CONFIG_DEBUG true
#ENV LOG_LEVEL debug

EXPOSE 8514/udp
EXPOSE 8514/tcp
EXPOSE 2055/udp
EXPOSE 9600/tcp

