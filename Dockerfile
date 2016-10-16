FROM chuyskywalker/centos7-dumbinit-supervisor

RUN yum install -y squid \
 && echo "maximum_object_size 128 MB" >> /etc/squid/squid.conf \
 && echo "cache_dir ufs /var/spool/squid 10240 16 256" >> /etc/squid/squid.conf \
 && yum clean all && rm -rf /var/cache/yum

COPY consul.ini         /config/supervisor/consul.ini
COPY squid.ini          /config/supervisor/squid.ini
COPY consul.json        /config/consul.json
COPY squid-start.sh     /config/squid-start.sh
