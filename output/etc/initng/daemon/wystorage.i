#!/sbin/itype
daemon daemon/wystorage {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = system/mountfs daemon/dbus system/udev system/factoryreset;
        respawn;
        exec daemon = /usr/bin/storaged;
}
