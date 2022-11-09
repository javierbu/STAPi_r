#!/bin/bash
source /root/scripts/crearap/crearap.conf
ps fax | grep 'berate_ap' | grep -v grep
if  [ $? = "0" ];then
	echo -e " 1 $(date)" >>/tmp/createap
	exit
else
	killall tcpdump 2>/dev/null
	berate_ap --vanilla -m bridge $ifaceap $ifacenet "${nombreap}" $wpaap 2>&1 >/tmp/berate.log & disown
	sleep 60
	if [ $captura = "si" ];then
		nombre=$(date +'%A%d-%M-%H-%m')
		ifacereal=$(ip a | awk -F ":" '{print $2}' | grep ap)
        	if [ $? = "0" ];then
			tcpdump -i $ifacereal -w /root/scripts/crearap/capturas/${nombre}.cap & disown
        	else
			tcpdump -i $ifaceap -w /root/scripts/crearap/capturas/${nombre}.cap & disown
        	fi
	fi
fi


