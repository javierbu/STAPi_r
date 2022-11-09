#!/bin/bash
source /root/scripts/crearap/nat/crearap_nat.conf
ps fax | grep 'berate_ap' | grep -v grep
if  [ $? = "0" ];then
	echo -e " 1 $(date)" >>/tmp/createap
	exit
else
	killall tcpdump 2>/dev/null
	berate_ap --vanilla --no-dnsmasq $ifaceap $ifacenet "${nombreap}" $wpaap 2>&1 >/tmp/berate.log & disown
	dnsmasq -C /root/scripts/crearap/nat/dnsmasq.conf -q --log-facility=/tmp/dnsmasq3.log -r /root/scripts/crearap/nat/resolv.conf -d >> /tmp/dnsmaq.log & disow
	sleep 60
	if [ $captura = "si" ];then
		nombre=$(date +'%A%d-%M-%H-%m')
		ifacereal=$(ip a | awk -F ":" '{print $2}' | grep ap)
        	if [ $? = "0" ];then
			tcpdump -i $ifacereal -w /root/scripts/crearap/nat/capturas/${nombre}.cap & disown
        	else
			tcpdump -i $ifaceap -w /root/scripts/crearap/nat/capturas/${nombre}.cap & disown
        	fi
	fi
fi


