#!/bin/bash

clear

function subMenuDos(){

cat << menuUsuario
	##########################################
	   Menu de opciones gestion usuarios   
	##########################################
	1) Altas de Usuarios
	2) Cruce de Claves
	3) Baja de Usuarios
	4) Reporte de Usuario de sistema
	5) Reporte de Usuarios activos
	6) Reporte de Usuarios activos/sistema (Remoto)
	7) Ayuda / Help
	0) Volver al Menu anterior
	############################################
menuUsuario
}

opcion=7
while [ $opcion -ne 0 ]; do
        subMenuDos
        read -p "	Seleccione una opcion de 1 a 7: " opcion
       	clear
	case $opcion in
                1)
			echo "Ha seleccionado Altas de usuario:"
                        read -ep "Ingrese ruta completa al archivo .csv: " usuariosAlta
			bash $altaUsuarios $usuariosAlta
			;;
                2)
			echo "------> Ha seleccionado Cruce de claves. Solo funciona como root!"
			bash $cruceClaves
			;;
                3)
			echo "Ha seleccionado Baja de usuarios"
			read -ep "Ingrese ruta completa al archivo .csv " usuariosBaja
			bash $bajaUsuarios $usuariosBaja
			;;
                4)
			echo "Ha seleccionado Reporte de usuarios del sistema"
			bash $reporteUsuSis
			;;
                5)
			echo "Ha seleccionado Reporte de usuarios activos"
			bash $reporteUsuAct
			;;
		6)
			echo "Ha seleccionado Reporte de Usuarios activos/sistema (Remoto)"
			read -ep "Ingrese ruta completa al archivo con ip's: " rutaArchivoIp
			bash $reportesRemoto $rutaArchivoIp
			;;
                7)
                        echo "Ha seleccionado Ayuda para Gestion de Usuarios"
                        less $helpUsuarios
                        ;;

                0)
			echo "Ha seleccionado Salir del menu.. gracias por usar nuestro programa.. bye bye "
			break
			;;
                *)
			warning "Esa no es una opcion valida, selecciona de 1 a 5 :-)"
                    ;;
	esac
done
