FROM logstash

COPY logstash.conf /etc/logstash
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["-f", "/etc/logstash/logstash.conf"]
