2.
user@user:~$ route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         _gateway        0.0.0.0         UG    100    0        0 enp0s3
10.0.2.0        0.0.0.0         255.255.255.0   U     0      0        0 enp0s3
_gateway        0.0.0.0         255.255.255.255 UH    100    0        0 enp0s3
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 dummy0
172.16.10.0     0.0.0.0         255.255.255.0   U     0      0        0 dummy0
192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0 dummy0
3.
user@user-VirtualBox:~$ sudo netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      493/systemd-resolve
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      659/sshd: /usr/sbin
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      536/cupsd
tcp6       0      0 :::22                   :::*                    LISTEN      659/sshd: /usr/sbin
tcp6       0      0 ::1:631                 :::*                    LISTEN      536/cupsd
4.
udp        0      0 127.0.0.53:53           0.0.0.0:*                           493/systemd-resolve
udp        0      0 0.0.0.0:631             0.0.0.0:*                           609/cups-browsed
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           534/avahi-daemon: r
udp        0      0 0.0.0.0:35287           0.0.0.0:*                           534/avahi-daemon: r
udp6       0      0 :::5353                 :::*                                534/avahi-daemon: r
udp6       0      0 :::47410                :::*                                534/avahi-daemon: r
