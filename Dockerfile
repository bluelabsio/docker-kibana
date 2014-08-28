FROM ubuntu:14.04
MAINTAINER Chelsea Zhang <chelsea@bluelabs.com>

# Based on https://registry.hub.docker.com/u/arcus/kibana/dockerfile/

# Download latest package lists
RUN apt-get update

# Install dependencies
RUN apt-get install -yq \
    nginx-full \
    wget \
    && apt-get clean

RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz -O /tmp/kibana.tar.gz && \
    tar zxf /tmp/kibana.tar.gz && \
    mv kibana-3.1.0/* /usr/share/nginx/html

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD run.sh /usr/local/bin/run

EXPOSE 80

CMD ["/usr/local/bin/run"]
