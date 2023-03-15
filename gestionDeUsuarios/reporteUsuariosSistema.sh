#!/bin/bash

# Muestra por pantalla la identificacion de la maquina
# y un listado de usuarios Activos. 
# La combinacion se realiza utilizando el comando getent y el archivo
# passwd. La salida es similar a ejecutar cat /etc/passwd.
# con la ayuda de grep y las opciones v w F f, vamos a comparar dos listas
# en nuestro script, compararemos si las shells validas contenidas en
# /etc/shells estan en cada uno de los ususarios del archivo passwd.
# El punto es que aca solo mostraremos la lineas que no lo contengan gracias 
# a la ocpion v de grep
# La salida seran las lineas de los usuarios que no tengan login habilitado.
# Cortaremos la primer linea quedando solo los nombres de usuarios.
# El resto es solo ordenar la salida por abcdario y agregar un numero
# Al principio de cada linea

echo "*****************************************"
hostnamectl
echo "*****************************************"
getent passwd | grep -vwFf /etc/shells | cut -d: -f1 | sort | nl
echo "*****************************************"
