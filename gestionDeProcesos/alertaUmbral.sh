#!/bin/bash
#script que muestra una alerta si el total de procesos es superior, menor o igual a un umbral provisto
totalPros=`ps aux|wc -l`
 echo "++++++++++++++++++++++++++++++++++++++++"
 echo "    TOTAL DE PROCESOS $totalPros        " 
 echo "++++++++++++++++++++++++++++++++++++++++"

declare -i umbral

function alerta(){
read -p "ingrese un numero de procesos /umbral " umbral
instalacion 'sysvbanner'
prog=$?
total=$1

if [ $prog -eq 0 ];then
	
	if [ $total -gt $umbral ];then
		banner "Alerta"
        	echo "¡tiene mas procesos ejecutandose que lo esperado"
        	echo ""
		return 1

	elif [ $total -lt $umbral ];then
        	banner "Alerta"
		echo "hay $totalPros procesos ejecutandose, esta por debajo del umbral provisto"
        	echo ""
		return 0
	elif [ $total -eq $umbral ];then
		banner "Alerta"
        	echo "la cantidad provisata es la misma que los procesos en ejecucion"
        	echo ""
		return 2
	else
		banner "Alerta"
        	echo "error inesperado"
		echo ""
	fi

else
	exit 2
fi
}
alerta $totalPros
