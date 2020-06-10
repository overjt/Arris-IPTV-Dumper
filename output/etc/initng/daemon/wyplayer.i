#!/sbin/itype
daemon daemon/wyplayer {
	env_file = /etc/initng/env;
	stdall = ${OUTPUT};
	need = daemon/dbus daemon/platformd system/factoryreset system/syslogd ;
	wait_for_dbus = com.wyplay.platformd ;
	chdir = /usr/lib;
	rlimit_core_hard = 262144;
	rlimit_core_soft = 262144;
	rlimit_nofile_soft = 10240;
	rlimit_nofile_hard = 10240;
	respawn;
	exec daemon = /usr/bin/wyplayer -f -vv -s;
}
