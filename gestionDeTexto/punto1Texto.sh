#!/bin/bash

#script que verifica que la resolución del hostname local de la máquina se encuentre correctamente configurado en la base de datos local de hosts (/etc/hosts). 

verHostname(){

cat /etc/hosts | grep "$(hostname)" > /dev/null
nomHost=$?
cat /etc/hosts | grep "$(hostname -i)" > /dev/null
ipHost=$?

if  [ $nomHost -eq 0 ] && [ $ipHost -eq 0 ] ;then
	return 0
else 
	return 1
fi
}

#############################################################
#	         resolucion ejersicio
#############################################################
ip=$(hostname -i)
valid_ip $ip
val=$?

if [ $val -eq 0 ] ;then
	if verHostname ;then
           echo "| La ip es valida y el nombre de host es correcto |"
	else 
	   echo "|   Error!!! uno de los valores no es correcto    | "
	fi	
else
	echo "|	   ***** La ip no es valida *****      |"
fi
