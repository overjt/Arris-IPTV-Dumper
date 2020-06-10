#!sbin/itype
service daemon/devkit {
    need = daemon/wystorage;
    wait_for_dbus = com.wyplay.wystorage;
    script start = {
        BACKDOOR=$(find /media -maxdepth 2 -name .frog | head -1)
        if [ "$BACKDOOR" != "" ]; then
            if [ -e "/etc/params/devkit-backdoor" ]; then
              rm /etc/params/devkit-backdoor
            fi
            ln -s "$BACKDOOR" /etc/params/devkit-backdoor
        fi
    };
}
