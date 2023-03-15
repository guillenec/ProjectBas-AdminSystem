#!/bin/bash

cat << verificacionSisstat
+---------------------------------------------+
|     verificacion si sisstat esta en la pc   |
+---------------------------------------------+
verificacionSisstat

msj_es_root
value=$?
if [ $value -eq 0 ];then
        instalacion 'sysstat'
        prog1=$?

        if [ $prog1 -eq 0 ];then
                iostat -d 2 4
	else
                exit 2
        fi
else
	exit 2
fi
