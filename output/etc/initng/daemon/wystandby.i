#!/sbin/itype
daemon daemon/wystandby {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = daemon/wynetwork daemon/dbus;
        respawn;
        exec daemon = /usr/bin/wystandby;
}
