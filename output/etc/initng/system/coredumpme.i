#!/sbin/itype
service system/coredumpme {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        need = system/initial/mountvirtfs;
        script start = /usr/bin/coredumpme;
}
service system/coredumpme/post {
        env_file = /etc/initng/env;
        stdall = ${OUTPUT};
        script start = /usr/bin/coredumpme post;
}
