#!/bin/bash
source /root/scripts/wardriving/wardriving.conf
ps fax | grep kismet | grep -v grep
if [ $? = "0" ];then
	exit
fi
cd /root/scripts/wardriving/capturas
/usr/sbin/gpsd -F /var/run/gpsd.sock -b -n /dev/ttyUSB0
sleep 2
kismet -c $iface --use-gpsd-gps >/tmp/kismet.log
