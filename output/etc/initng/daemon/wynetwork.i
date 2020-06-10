#!/sbin/itype
service daemon/wynetwork/pre-start {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = system/mountfs;
        exec start = /etc/initng/daemon/wynetwork/start.sh;
}
daemon daemon/wynetwork/sysd {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = system/udev daemon/dbus;
        need = daemon/wynetwork/pre-start;
        exec daemon = /usr/bin/wynetwork-sysd;
        respawn;
        respawn_rate = 0;
}
daemon daemon/wynetwork {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = system/udev daemon/dbus daemon/wynetwork/sysd;
        need = daemon/wynetwork/pre-start;
        exec daemon = /usr/bin/wynetworkd;
        respawn;
        respawn_rate = 0;
        wait_for_dbus = com.wyplay.WyNetworkSysd;
}
