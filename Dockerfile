FROM debian:9.11-slim

RUN apt-get update \
 && apt-get install -y rinetd \
 && apt-get clean all \
 && rm -rf /var/lib/apt/lists/*

RUN { \
	echo '#!/bin/bash'; \
	echo 'set -e'; \
	echo 'echo "0.0.0.0 8000 $1 $2" >> /rinetd.conf'; \
	echo 'echo "logfile /var/log/rinetd.log" >> /rinetd.conf'; \
	echo '/usr/sbin/rinetd -f -c /rinetd.conf'; \
    } > /rinetd-entrypoint.sh

RUN chmod +x /rinetd-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/rinetd-entrypoint.sh"]
