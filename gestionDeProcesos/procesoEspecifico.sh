#!/bin/bash
#Monitorear un proceso específico, dado un id de proceso (PID) deberá mostrar por pantalla sólo ese proceso con un límite de iteración de 10 veces.


read -p "ingrese id del proceso (PID): " procesID

echo "+-----------------------------------------+"
echo "+---------- usando un for y ps -----------+"
echo "+-----------------------------------------+"

for ((i=0 ; i<10 ; i++ ));do
ps -el |grep $procesID
done


echo "+-----------------------------------------+"
echo "+---------- usando comando top -----------+"
echo "+-----------------------------------------+"
top -p $procesID -b -n 10 -d 5

#-b: modo batch (por lotes) de top permite operar de manera no interactiva en la salida estándar
#-b: número de iteraciones; -d: periodo de tiempo entre iteracion 
#-p indicamos el pid a monitorear


