#!/bin/bash

# Se almacena en la variable "pidProc" el pid del proceso a finalizar
#  que debe ingresar como parametro para que el script funcione
pidProc=$1

# Sabemos que cada proceso tiene su directorio en /proc identificado con numero de PID
# COmprobaremos que esa carpeta exista, en el caso que exista podremos determinar que 
# el proceso existe. En el caso que no, es que no hay un proceso con ese numero de PID
# Si existe, lo que continua es terminarlo de la fomra mas amable. y /o problematica.
# Si se logra terminarlo saldra por pantalla un mensaje avisandonos que se pudo terminar
# Caso contrario se intenta eliminar con la senial -9. Si se logra saldra en pantalla
# elminado correctamente.
# Si no se termina o elimina solamente saldra por pantalla un mensaje avisando que no se pudo
# terminar o eliminar.
# La salida estandar y de error es redirigida a la nada para evitar su salida por pantalla, ya que 
# QUeremos colocar un mensaje personalizado
if [ -d /proc/$pidProc ]; then
	(((kill $pidProc >/dev/null 2>&1) && echo "Proceso $pidProc Terminado Correctamente") || ((kill -9 $pidProc >/dev/null 2>&1) && echo "Proceso $pidProc Eliminado Correctamente")) || echo "El Proceso $pidProc no pudo ser exterminado"
else
	echo "El proceso $pidProc No existe"
fi
