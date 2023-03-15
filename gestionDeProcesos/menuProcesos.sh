#!/bin/bash
clear

#+++++++++++++++++++++++++++++++++++++++++++++++#

function menuProcesos(){
#menu corregido usando case
cat << menuProcesos
	#####################################################################
	  		 Menu de opciones gestion de procesos 
	######################################################################

	1) Reporte de los primeros 5 procesos ordenados por consumo de memoria
	2) Reportar una alerta si el numero de procesos es superior a un umbral provisto por el usuario
	3) Monitorear un proceso especifico
	4) Eliminar un proceso especifico dado su id de proceso (PID)
	5) Eliminar varios procesos
	6) Ayuda / Help
	0) Volver al menu anterior
	########################################################################

menuProcesos
}

while true; do
        menuProcesos
        read -p "seleccione una opcion de 1 a 5: " opcion
        clear
        case $opcion in
                1)
			echo "Ha seleccionado Reporte de los primeros 5 procesos ordenados por consumo de memoria"
			$gestionProcesos
                        ;;
                2)
			echo "Ha seleccionado Reportar una alerta si el numero de procesos es superior a un umbral"
			$alertaUmbral
                        ;;
                3)
			echo "Ha seleccionado Monitorear un proceso especifico"
			$procesoEspecifico
                        ;;
                4)	echo "Ha seleccionado Eliminar un proceso especifico dado su id de proceso (PID)"
                        $eliminarProceso
			;;
                5)
			echo "Ha seleccionado Eliminar varios procesos"
                        $listaProcesos
			;;
                6)
                        echo "Ha seleccionado ayuda de gestion de procesos"
                        less $helpProcesos
                        ;;

                0)
                        echo "Ha seleccionado volver al menu anterior"
                        break
                        ;;
                *)
			warning "Esa no es una opcion valida, seleccina de 1 a 5 :-)"
                        ;;
	esac
done
