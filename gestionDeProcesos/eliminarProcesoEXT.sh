#!/bin/bash

# Se almacena en la variable "arreglo" un arreglo que debe contener todas las PID que el
# usuario quiera finalizar. Debe ingresar como parametro para que el script funcione

# Se recorre todos los elementos del arreglo y en cada iteracion se ejecuta
# llamar al script "eliminarProceso.sh" y como parametro se envia el PID
arreglo=("$@")
for elementos in "${arreglo[@]}"
do 
	bash $eliminarProceso $elementos < /dev/null
done
