#!/bin/bash
#----------------------------------------------------------------------
#Obtener un listado de servidores DNS por el medio que considere
#util y verificar que los mismos se encuentren configurados,
#caso contrario deben ser agregados a la configuracion actual.
#----------------------------------------------------------------------

# En forma general el script va a descargar un archivo desde 
# la pagina https://public-dns.info/nameserver/ar.csv
# con el comando wget o curl
# y verificara si dichos dns se encuentran en resolv.conf, 
# si no estan los agrega  o los actualiza.

#----------------------------------------------------------------------
# wget https://public-dns.info/nameserver/ar.csv
# curl -O https://public-dns.info/nameserver/ar.csv
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#Funcion que verifica si una palabra se encuentra en un archivo
#----------------------------------------------------------------------
#Recibe dos paramentros
#primer parametro es el texto a buscar en el segundo parametro
#segundo es la ruta del archivo a analizar
#----------------------------------------------------------------------
function verificarDNS() {
	local textoBuscar=$1
	local rutaArchivo=$2
	if grep -v "#" $rutaArchivo | grep -w "$textoBuscar" > /dev/null
	then 
		echo 0
	else
		echo 1
	fi
}

#----------------------------------------------------------------------
#Funcion que modifica una palabra (DNS) en un archivo
#----------------------------------------------------------------------
#Recibe tres paramentros
#Primer parametro: Contiene la palabra a buscar
#Segundo parametro: Contiene la palabra a reemplazar
#Tercer parametro: Contiene la ruta del archivo a analizar
#----------------------------------------------------------------------
function modificarDNS() {
	local abuscar=$1
	local aReemplazar=$2
	local archivo=$3
	local reeemplazo=$(grep -v "#" $archivo | grep $abuscar | cut -d ' ' -f 1 )
	sed "s/$reeemplazo/$aReemplazar/g" $rutaResolv > temp && mv temp $rutaResolv
	}

#----------------------------------------------------------------------
#Funcion que modifica una palabra (IP) en un archivo
#----------------------------------------------------------------------
#Recibe tres paramentros
#Primer parametro: Contiene la palabra a buscar
#Segundo parametro: Contiene la palabra a reemplazar
#Tercer parametro: Contiene la ruta del archivo a analizar
#----------------------------------------------------------------------
function modificarIP() {
	local abuscar=$1
	local aReemplazar=$2
	local archivo=$3
	local reeemplazo=$(grep -v "#" $archivo | grep $abuscar | cut -d ' ' -f 2 )
	sed "s/$reeemplazo/$aReemplazar/g" $rutaResolv > temp && mv temp $rutaResolv
	}


#ruta archivo resolv.conf
rutaResolv=/etc/resolv.conf

echo "Usted puede descargar un listado de DNS actualizado desde https://public-dns.info/nameserver/ar.csv"
echo "Se puede realizar de manera manual (ingrese al enlace y descargue el archivo en formato CSV)"
echo "Tambien se puede hacer de manera automatica (requiere tener instalado el programa WGET o CURL)"

read -p "Desea hacerlo de manera automatica? Ingrese (s/n): " opcion

if [[ $opcion == "s" ]];then
	instalacion 'wget'
	prog1=$?
	instalacion 'curl'
	prog2=$?
	
	if [[ $prog1 -eq 0 && $prog2 -eq 0 ]];then
		(wget https://public-dns.info/nameserver/ar.csv || curl -O https://public-dns.info/nameserver/ar.csv)
		rutaDNS=ar.csv
	else
		echo "Error, verifique que el programa CURL o WGET se encuentren instalados en su sistema"
	fi
	
else
	read -ep "Ingrese ruta completa al archivo csv, descargado: " rutaDNS	
fi

if [ -f $rutaDNS ];then
	echo "Fichero encontrado: "
else
	echo "El fichero no existe"
	exit 1
fi

msj_es_root
ESROOT=$?
if [ $ESROOT -eq 0 ]; #Comprueba si el usuario es root para correr la funcion.
then
	sed -n '1!p' $rutaDNS | while IFS=, read ipServer nombreServer resto
	do
		resultNombreServer=$(verificarDNS $nombreServer $rutaResolv)
		resulIPServer=$(verificarDNS $ipServer $rutaResolv)
		( [ $resultNombreServer -ne 0 ] && [ $resulIPServer -ne 0 ] && ( echo $nombreServer $ipServer >> $rutaResolv ) ) \
		|| ( [ $resultNombreServer -ne 0 ] && [ $resulIPServer -eq 0 ] && ( modificarDNS $ipServer $nombreServer $rutaResolv) ) \
		|| ( [ $resultNombreServer -eq 0 ] && [ $resulIPServer -ne 0 ] && ( modificarIP $nombreServer $ipServer  $rutaResolv) ) \
		|| ( echo "DNS CORRECTO" )
	done
else
	echo "Debe ser usuario root para poder modificar el archivo resolv.conf"
fi
