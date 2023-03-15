#!/bin/bash
cat << verificacionIOTOP
#####################################
verificacion si iotop esta en la pc
#####################################
verificacionIOTOP

msj_es_root
val=$?

if [ $val -eq 0 ];then
	instalacion 'iotop'
	prog1=$?

        if [ $prog1 -eq 0 ];then
                iotop -o -b -n 5
        else
                exit 2
        fi
else
 	exit 2
fi
