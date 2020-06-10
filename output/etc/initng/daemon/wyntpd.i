#!/sbin/itype
daemon daemon/wyntpd {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = daemon/dbus daemon/wynetwork;
        exec daemon = /usr/sbin/wyntpd;
        respawn;
}
