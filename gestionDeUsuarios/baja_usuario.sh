#!/bin/bash
#programa que permite eliminar un usuario de forma facil, siendo root
#se supone que esto lo podria hacer un admin por lo que debe estar como root 

# Verificaremos que el usuario es root, ya que solo root podra crear usuarios
# llamamos a la funcion msj_es_root, el mismo se encargara de verificar si se 
# esta logueado como root. Segun su retorno analizaremos como continuar.
# Si su retorno es 0, significa que la ejecucion de msj_es_root es correcta
# y somos usuarios root.
# El siguiente paso es verificar si existe el listado de usuarios, para poder continuar
# saldra un mensjae en pantalla confirmando que existe o directamente se terminara el script.
# Con un bulce "for" vamos a recorrer linea por linea el listado y en cada iteracion
# separamos por columna quedandonos con usuario, apellido, nombre, correo y contrasenia
# en sus correspondietes variables.
# Por ultima instacia eliminamos el usuario junto con su directorio y sus archivos
#


usuariosBaja=$1

msj_es_root
msj=$?
if [ $msj == 0 ];then
	if ListaUsuario=`cat $usuariosBaja` ;
	then
        	echo "fichero encontrado: "
		
	else
		echo "el fichero no existe"
        	exit 1
	fi

	for unaLinea in $ListaUsuario
	do                               #delimitador fila
        	USUARIO=`echo $unaLinea | cut -d, -f1`
        	APELLIDO=`echo $unaLinea | cut -d, -f2`
        	NOMBRE=`echo $unaLinea | cut -d, -f3`
        	CORREO=`echo $unaLinea | cut -d, -f4`
        	PASSWORD=`echo $unaLinea | cut -d, -f5`

        	COMPLETO=`echo $APELLIDO,$NOMBRE,$CORREO`
        
      		userdel -f -r $USUARIO

	done
else
	
	exit 1
fi

