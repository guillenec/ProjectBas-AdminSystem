#!/bin/bash

# DESCRIPCION GENERAL
#	#	#	#
# Teniendo la ruta de un archivo, vamos a mostrarlo por pantalla con la ayuda del comando cat
# Aunque esta salida sera la entrada para la funcion map. Dentro de map leemos linea por linea
# el archivo y llamaremos en cada recorrido a la funcion (usuariosActivos o usuariosSistemas 
# dependiendo la opcion elegida) agregando un parametro el cual se obtiene en cada iteracion
# del ciclo while.
# Las funciones usuariosActivos usuariosSistemas son muy similares, con el argumento ingresado
# por parametro solo ejecutara el script correspondiente enviando dos parametros, la opcion
# para que funcione ssh y una ip en donde realizar la conexion


# Se almacena en la variable "rutaArchivoIp" la ruta del archivo con ip's
#  que debe ingresar como parametro para que el script funcione
rutaArchivoIp=$1


# Se ingresa por parametro el nombre de una funcion
function map() {
	local funcion=$1
	while IFS= read argumento
	do
		eval $funcion $argumento
	done
}

# Se ingresa por parametro una ipv4
function usuariosActivos ()
{
	local ipMaquina=$1
	scp $reporteUsuAct $ipMaquina:$HOME > /dev/null
	ssh -n $ipMaquina "bash reporteUsuariosActivos.sh"
	ssh -n $ipMaquina "rm ${HOME}/reporteUsuariosActivos.sh"
}

# Se ingresa por parametro una ipv4
function usuariosSistemas ()
{
	local ipMaquina=$1
	scp $reporteUsuSis $ipMaquina:$HOME > /dev/null
        ssh -n $ipMaquina "bash reporteUsuariosSistema.sh"
        ssh -n $ipMaquina "rm ${HOME}/reporteUsuariosSistema.sh"
}

# Mostramos dos mensajes por pantalla, para que el usuario elija si mostrar
# Usuarios activos o de sistema. Se lee la opcion
# Se redirige la salida de cat como entrada a la funcion map y se envia como parametro a map la funcion
# correspondiente dependiendo de la opcion elegida por el usuario
echo "1) Reporte usuarios del Sistema (Remota)"
echo "2) Reporte usuarios Activos (Remota)"
read opcion

# La evaluacion se realiza de la siguiente forma.
# si "opcion" es igual a 1 entonces ejecutamos el siguiente comando.
# en el caso que no se cumpla pasara a la siguiente evaluacion en donde se preguntara si opcion
# es igual a 2. Si no podemos determinar que sea 1 o 2, saldra por pantalla un mensaje avisandole a usuario
# que el valor ingresado es incorrecto
[ $opcion -eq 1 ] && ( cat $rutaArchivoIp | map usuariosSistemas ) || [ $opcion -eq 2 ] && ( cat $rutaArchivoIp | map usuariosActivos ) || echo "Opcion incorrecta"


