#!/bin/sh

if [[ ! -d /var/spool/squid/00 ]]; then
  echo "Initializing cache..."
  /usr/sbin/squid -N -f /etc/squid/squid.conf -z
fi

echo "Starting squid3..."
exec /usr/sbin/squid -NYCd 1 -f /etc/squid/squid.conf
