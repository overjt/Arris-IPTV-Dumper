#!/sbin/itype
daemon daemon/wyrest {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        wait_for_dbus = com.wyplay.platformd com.wyplay.configstore;
        wait_for_dbus = com.wyplay.platformd com.wyplay.configstore;
        wait_for_dbus = com.wyplay.configstore;
        need = system/syslogd;
        rlimit_core_hard = 262144;
        rlimit_core_soft = 262144;
        respawn;
        chdir = /usr/share/wyrest/;
        env INSTALLPATH = /usr/share/wyrest;
        exec daemon = /usr/bin/uwsgi --ini /usr/share/wyrest/devkit.ini -O 2;
}
