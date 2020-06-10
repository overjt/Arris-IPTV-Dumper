#!/bin/sh
if test ! -d "/etc/params"; then
    /bin/mkdir -p "/etc/params" &&
    /bin/chmod -R 0700 "/etc/params" &&
    /bin/chown -R root:root "/etc/params"
fi
/bin/mkdir /var/run/wynetwork &&
/bin/chmod -R 0755 /var/run/wynetwork &&
/bin/chown -R root:root /var/run/wynetwork
