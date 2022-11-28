#!/bin/bash
source /root/scripts/sistema/pitunel/datostunel
ps aux | grep sshpass | grep -v grep
if [ $? = 0 ] ;then
	sshpass -p $pass ssh -p $puerto -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -t -t $user@$ip "touch /tmp/vivo"
	if [ $? = 0 ] ;then
		echo
		exit 0
	else
		killall sshpass 2>/dev/null
		sshpass -p $pass ssh -p ${puerto} -C -X -t -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -R ${ip}:21270:localhost:22 ${user}@${ip} ## HACEMOS LA CONEXION PARA CREAR EL PUENTE
	fi
else
	sshpass -p $pass ssh -p ${puerto} -C -X -t -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -R ${ip}:21270:localhost:22 ${user}@${ip} ## HACEMOS LA CONEXION PARA CREAR EL PUENTE
fi
