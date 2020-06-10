#!/sbin/itype
daemon daemon/configstore {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = system/mountfs daemon/dbus;
        exec daemon = /usr/bin/configstored;
        respawn;
        respawn_rate = 0;
}
