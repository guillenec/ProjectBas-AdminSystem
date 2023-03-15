#!/bin/bash

clear
#source utils.sh
function subMenuTres(){
cat << menuGestionDiscos 
	############################################################
		   Menu de opciones gestion de disco    
	############################################################
	1) Reporte de espacio en disco para cada servidor
	2) Reporte de rendimiento de los discos locales
	3) Reporte de actividad de I/O en todos los discos primarios
	4) Ayuda / Help
	0) Volver al menu anterior
	#############################################################

menuGestionDiscos
}

while true; do
        subMenuTres
        read -p "	 Seleccione una opcion: " opcion
        clear
        case $opcion in
                1) 
			bash $reporteEspacio
			;;
                2)
			bash $reporteRendimiento
			;;
                3)
			bash $reporteActividad
                        ;;
		4)
			less $helpDiscos
			;;
                0)
                        echo "#######################################"
			echo "	esta volviendo al menu principal"
			echo "#######################################"
                        #menuPrincipal
			break
                        ;;
                *)
                        warning "Esa no es una opcion valida, selecciona de 1 a 4 :-)"
                        ;;
        esac
done  
