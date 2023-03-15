#!/bin/bash
source utils.sh
#Funcion que revisa si la clave existe, sino la crea y la cruza
#a partir de una lista de usuarios y de una lista de maquinas.
ssh_keygen_copy_id () {
	read -ep "Ingrese ruta completa del archivo *.csv con los usuarios a cruzar claves: " usuariosCruce

	if [ -f $usuariosCruce ];
	then
		echo "Fichero encontrado: "
	else
		echo "El fichero no existe"
		exit 1
	fi

ListaUsuarioCruce=`cat $usuariosCruce` #creamos una variable y le asignamos la lista que tiene el archivo

for unaLinea in $ListaUsuarioCruce #Recorre la lista de usuarios
do   				 #delimitador fila
	USUARIO=`echo $unaLinea | cut -d, -f1`
	#Si posee clave, la copia, sino la crea y luego copia.
	[[ -f /home/$USUARIO/.ssh/id_rsa.pub ]] || { su $USUARIO -c "echo | ssh-keygen -P ''" ;} && { cat /home/$USUARIO/.ssh/*.pub | ssh root@$ipMaquina "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" ;}
done
}

lista_ips () {
	read -ep "Ingrese ruta completa al archivo con ip's: " rutaArchivoIp

	if [ -f $rutaArchivoIp ];
	then
	        echo "Fichero IPs encontrado: "
	else
        	echo "La ruta ingresada no es correcta o no existe el archivo"
	        exit 1
	fi

	while IFS= read ipMaquina
	do
	        ssh_keygen_copy_id < /dev/null

	done < $rutaArchivoIp

}

msj_es_root
ESROOT=$?
if [ $ESROOT -eq 0 ]; #Comprueba si el usuario es root para correr la funcion.
then
       	lista_ips

fi
