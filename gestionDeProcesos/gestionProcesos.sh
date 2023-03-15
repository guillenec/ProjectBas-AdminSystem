#!/bin/bash
#probando gestion de procesos

echo "-------------------------------------------------------------"
echo "  forma 1 de listar los 5 procesos que consumen mas memoria  "
echo "-------------------------------------------------------------"

echo "forma 1 de mostrar los 5 primeros procesos que consumen mas memora"
ps aux --no-headers --sort -rss |head -n 5

echo "----------------------------------------------------"
echo "         forma 2 - mas ordenado usando aw           "
echo "----------------------------------------------------"

ps aux --no-headers | awk '{print "PID:" $2," %MEM:"$4," COMMAND:" $11}' | sort -k2r | head -n 5
