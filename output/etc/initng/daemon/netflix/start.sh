#!/bin/sh -f

EXTRAPARAMS=""
if [ "$(cat /boxinfo/CapBoxmode)" = "4" ]; then
	EXTRAPARAMS="${EXTRAPARAMS} --surface-cache-capacity 57671680";
fi

if [ "$(cat /boxinfo/CapPvrSupport )" != "No"  ]; then
	EXTRAPARAMS="${EXTRAPARAMS} --media-cache-capacity 50331648 --cache-path /tmp/datapartition/netflix/cache";
fi

export EXTRAPARAMS
exec sh -c "cd /usr/lib/netflix; ./sample_am netflix ${EXTRAPARAMS}"
