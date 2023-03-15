#!/bin/bash
#Este script permite dar de alta usuarios a partir de una lista .csv con
#cinco apartados por linea, separados por coma, ejemplo:
#usuario1, apellido1, nombre1, correo electronico1, contrasena1

#IFS=" "

usuariosAlta=$1
msj_es_root
msj=$?
if [ $msj -eq 0 ];then

	if  ListaUsuario=`cat $usuariosAlta` ;
	then
		echo "fichero encontrado: "
	else 
		echo "el fichero no existe"
		exit 1
	fi

	for unaLinea in $ListaUsuario
	do   				 		
		USUARIO=`echo $unaLinea | cut -d, -f1`
		APELLIDO=`echo $unaLinea | cut -d, -f2`
        	NOMBRE=`echo $unaLinea | cut -d, -f3`
       		CORREO=`echo $unaLinea | cut -d, -f4`
        	PASSWORD=`echo $unaLinea | cut -d, -f5`
        	
		COMPLETO=`echo $APELLIDO,$NOMBRE,$CORREO`
		#echo $USUARIO		
		getent passwd |grep "$USUARIO" > /dev/null
		var=$?
		
		if [ $var -eq 1 ] ;then
			#echo "useradd -m -s /bin/bash -p -c $COMPLETO $USUARIO"
			#-m create home  -s shell  -c comentario  
  			useradd -m -s /bin/bash -p $(openssl passwd $PASSWORD) -c $COMPLETO $USUARIO
			echo "$USUARIO se creo correctamente.."

		elif [ $var -eq 0 ];then
			echo "el usuario ya existe , no se creara.."
	
		else
			echo " ocurrio algun error inesperado "
		fi
	done

else	
	exit 2
fi
