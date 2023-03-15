#!/bin/bash
clear

function subMenuCinco(){
cat << menu
	##########################################
	Menu de opciones Gestion de la memoria   
	##########################################
	1) Reporte del uso de memoria RAM
	2) Script de memory-alert.sh 
	3) Ayuda / Help
	0) Volver al menu anterior"
	##########################################
menu
}

opcion=6
while [ $opcion -ne 0 ]; do
        subMenuCinco
        read -p "seleccione una opcion: " opcion
        clear
        case $opcion in
                1)
			echo "Ha seleccionado reporte Memoria:"
			bash $reporteUso
                        ;;
                2)
			echo " ha seleccionado memory alert: "
			bash $memory_alert
                        ;;
		3)
                        echo "Ha seleccionado Ayuda para Gestion de Memoria"
                        less $helpMemory
                        ;;
                0)
                        echo "ha seleccionado salir del menu.. gracias por usar nuestro programa.. bye bye "
                        break
                        ;;
                *)
			warning "Esa no es una opcion valida, seleccina de 1 a 2 :-)"
                        ;;
	esac
done
