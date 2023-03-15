#!/bin/bash
#script que verifica si el uso de memoria exede el %20 y si asi es envia una alerta al correo del usuario que lo ejecuta 
#set -xv
declare -i maximMem

######################################################
#               script memory alert
######################################################
   a=$(free |awk '/Mem/{printf $3*100/$2}')
   echo $a 
   b=${a%.*}
   cantMem=$(free -h |awk '/Mem/{print $2}')
   maximMem='10'
  
   if [ $b -gt $maximMem ]; then
	
	instalacion 'mailutils'
	prog1=$?

	instalacion 'postfix'
	prog2=$?

	if [[ $prog1 -eq 0 && $prog2 -eq 0 ]];then
           SUBJECT="ATENCIÓN: El uso de memoria es alto en $(hostname) at $(date)"
           temp_file=$(mktemp)
           TO=$USER 

           	echo "la cantidad de memoria en uso es: $b% que equivale a: $cantMem GB " >> $temp_file
           	echo "------------------------------------------------------------------------" >> $temp_file
           	echo "Consumo de memoria con información de TOP" >> $temp_file
           	echo "------------------------------------------------------------------------ " >> $temp_file
           	echo "$(top -b -o +%MEM | head -n 20) " >> $temp_file
           	echo "------------------------------------------------------------------------" >> $temp_file
           	echo "Consumo de memoria con información de PS ">> $temp_file
          	echo "------------------------------------------------------------------------" >> $temp_file
          	echo "$(ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head)" >> $temp_file

        	echo "Cuerpo:"| cat $temp_file | mail -s "Asunto : $SUBJECT" $TO
        	rm ${temp_file}
		
		echo "+-------------------------------------+"
		echo "| el mail fue  enviado correctamente  |"
		echo "+-------------------------------------+"
	
	else
        	echo "error inesperado"
	fi

   else
        echo "+------------------------------------------------+"
	echo "| El uso de momoria no supera el maximo esperado |"
 	echo "+------------------------------------------------+"     
   fi
