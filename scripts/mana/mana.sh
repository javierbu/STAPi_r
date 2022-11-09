#!/bin/bash
source /root/scripts/mana/mana.conf
ps fax | grep 'berate_ap --mana-loggin' | grep -v grep
if  [ $? = "0" ];then
	echo -e " 1 $(date)" >>/tmp/mana
exit
else
	killall tcpdump 2>/dev/null
	berate_ap --mana-loggin $mana $ifaceap $ifacenet "${nombreap}"  2>&1 >/tmp/mana.log & disown
	sleep 60
	if [ $captura = "si" ];then
                nombre=$(date +'%A%d-%M-%H-%m')
                ifacereal=$(ip a | awk -F ":" '{print $2}' | grep ap)
                if [ $? = "0" ];then
                        tcpdump -i $ifacereal -w /root/scripts/mana/capturas/${nombre}.cap & disown
                else
                        tcpdump -i $ifaceap -w /root/scripts/mana/capturas/${nombre}.cap & disown
                fi
	fi
fi


