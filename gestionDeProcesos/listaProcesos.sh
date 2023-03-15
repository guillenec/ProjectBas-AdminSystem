#!/bin/bash

# Declaramos un arreglo para despues rellenarlo con todas la pid que ingrese el usuario
declare -a listaProcesos


# En este bucle ejecutaremos el comando ps en cada iteracion mostrando por pantalla
# todos los procesos activos en pantalla (tipo lista) y se le pedira al usuario que
# ingrese el pid del proceso que desea finalizar, lo siguiente va a ser
# preguntarle al usuario si desea agregar otro proceso o finalizar
#
while [ true ]
do
	ps axo pid,comm,uname
	read -p "Ingrese el numero del PID a finalizar: " pid
	listaProcesos+=($pid)
	read -p "desea agregar otro proceso? s/n : " respuesta
	if [ $respuesta = "n" ]; then
		break
	fi
done

# Llamamos al script y le enviamos el arreglo con todos los pid
# cargado por el usuario
bash $eliminarProcExt ${listaProcesos[@]}
