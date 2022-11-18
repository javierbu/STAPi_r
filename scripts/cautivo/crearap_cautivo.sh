#!/bin/bash
source /root/scripts/cautivo/crearap_cautivo.conf
ps fax | grep 'berate_ap' | grep -v grep
if  [ $? = "0" ];then
	echo -e " 1 $(date)" >>/tmp/cautivo
	exit
else
	killall tcpdump 2>/dev/null
	berate_ap --vanilla --no-dnsmasq $ifaceap $ifacenet "${nombreap}" $wpaap 2>&1 >/tmp/berate.log & disown
	dnsmasq -C /root/scripts/crearap/nat/dnsmasq.conf -q --log-facility=/tmp/dnsmasq3.log -r /root/scripts/crearap/nat/resolv.conf -d >> /tmp/dnsmaq.log & disow
	sleep 5
	nombre=$(date +'%A%d-%M-%H-%m')
        ifacereal=$(ip a | awk -F ":" '{print $2}' | grep ap)
	if [ -v $ifacereal ];then
                grep -v GatewayInterface /root/scripts/cautivo/nodogsplash.conf > /root/scripts/cautivo/nds.conf
                echo -e "GatewayInterface $ifaceap" >> /root/scripts/cautivo/nds.conf
                nodogsplash -c /root/scripts/cautivo/nds.conf >/tmp/nodog.log & disown
        else
                grep -v GatewayInterface /root/scripts/cautivo/nodogsplash.conf > /root/scripts/cautivo/nds.conf
                echo -e "GatewayInterface $ifacereal" >> /root/scripts/cautivo/nds.conf
                nodogsplash -c /root/scripts/cautivo/nds.conf >/tmp/nodog.log & disown
        fi
	if [ $captura = "si" ];then
		if [ -v $ifacereal ];then
			tcpdump -i $ifaceap -w /root/scripts/cautivo/capturas/${nombre}.cap & disown
		else
			tcpdump -i $ifacereal -w /root/scripts/cautivo/capturas/${nombre}.cap & disown
		fi
	fi
fi
