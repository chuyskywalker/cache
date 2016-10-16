FROM chuyskywalker/centos7-dumbinit-supervisor

RUN yum install -y squid \
 && echo "maximum_object_size 128 MB" >> /etc/squid/squid.conf \
 && echo "cache_dir ufs /var/spool/squid 10240 16 256" >> /etc/squid/squid.conf \
\
 && yum install -y wget unzip \
 && wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip \
 && unzip consul_0.6.4_linux_amd64.zip \
 && rm -r consul_0.6.4_linux_amd64.zip \
 && mv consul /usr/bin/consul \
 && yum -y history undo last \
\
 && yum clean all \
 && rm -rf /var/cache/yum \
 && rm /config/init/placeholder.sh

COPY consul.ini         /config/supervisor/consul.ini
COPY squid.ini          /config/supervisor/squid.ini
COPY consul.json        /config/consul.json
COPY squid-start.sh     /config/squid-start.sh
