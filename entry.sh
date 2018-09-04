#!/bin/sh
if [ -f /root/.init.sh ];then
	/root/.init.sh
	rm -f /root/.init.sh
fi
if [ -f /root/.startup.sh ];then
	/root/.startup.sh
fi
/usr/sbin/sshd -D
