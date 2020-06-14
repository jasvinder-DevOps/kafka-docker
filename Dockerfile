FROM ubuntu:16.04
 
ENV KAFKA_HOME /usr/local/kafka
RUN mkdir -p /scripts 
ADD ./start-kafka.sh /scripts/

# install java + others
RUN apt-get update && apt-get install -y \
  wget \
  openjdk-8-jdk
 
# install kafka
RUN wget http://apachemirror.wuchna.com/kafka/2.5.0/kafka_2.12-2.5.0.tgz && \
  tar -xzf kafka_2.12-2.5.0.tgz && \
  mv kafka_2.12-2.5.0 $KAFKA_HOME

RUN chmod +x ./scripts/start-kafka.sh
 
CMD ["./scripts/start-kafka.sh"]
