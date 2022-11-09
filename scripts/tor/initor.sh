#!/bin/bash
source /root/scripts/tor/initor.conf
ps fax | grep berate_apmod | grep -v grep
	if [ $? = 0 ];then
		ps fax | grep 'tor -f' | grep -v grep
			if [ $? = 0 ];then
				echo "tor funcionando " >> /tmp/torencendido.log
				exit 0
			else
				/usr/sbin/tor -f /root/scripts/tor/conf/torrc >/tmp/torlog.1 & disown
			fi
	else
		killall dnsmasq 2>/dev/null
		killall tor 2>/dev/null
		sleep 3 
		nohup bash /root/scripts/tor/berate_apmod --vanilla  $ifaceap $ifacenet "${nombreap}" $wpaap >/tmp/torlog.log & disown
		sleep 20
		iptables -F
                iptables -t nat -F
                iptables -t nat -A POSTROUTING -o $ifacenet -s 192.168.12.0/24 -j MASQUERADE

		ifacereal=$(ip a | awk -F ":" '{print $2}' | grep ap)
			if [ $? != "0" ];then
				iptables -t nat -A PREROUTING -i $ifaceap -p tcp --syn -j REDIRECT --to-ports 9040
			else
				iptables -t nat -A PREROUTING -i $ifacereal -p tcp --syn -j REDIRECT --to-ports 9040
			fi
		/usr/sbin/tor -f /root/scripts/tor/conf/torrc >/tmp/torlog.0 & disown
	fi
