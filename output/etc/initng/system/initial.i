#!/sbin/itype
service system/initial/mountvirtfs {
        critical;
        script start = {
                if [ ! -d /proc -o ! -d /sys ]
                then
                        echo "The /sys or /proc is missing, can't mount it!" >&2
                        echo "Please sulogin, remount rw and create them." >&2
                        exit 1 # "It can't work. Critical!"
                fi
                mount -n -t proc proc /proc
                mount -n -t sysfs sys /sys
                mount /var
                mount /dev
                mkdir -p /dev/pts
                mount /dev/pts
                mkdir -p /dev/shm
                wait
                exit 0
        };
}
service system/initial/lo {
        critical;
        script start = /sbin/ifconfig lo 127.0.0.1 netmask 255.0.0.0;
}
virtual system/initial {
        critical;
        need = system/initial/mountvirtfs system/initial/lo system/udev system/mountfs;
}
