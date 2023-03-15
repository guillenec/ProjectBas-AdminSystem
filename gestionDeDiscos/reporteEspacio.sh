#!/bin/bash
cat << infoDisco
"####################################"
"informacion espacio disco comando df"
"####################################"
infoDisco
#df informaci  n del espacio utilizado en disco -T tipo de sistema de archivo, -h legible .
df -T -h

cat << info2Disco
"####################################"
"informacion espacio disco lsblk -fm"
"####################################"
info2Disco
#lsblk visualiza los dispositivos , unidadesparticiones y sus capacidades(esten montadas o no las unidades)
#fm amplia la informacion -d solo discos
lsblk -io kname,type,mountpoint,size,fsuse%
#nombre tipo tama  o y punto de montaje

