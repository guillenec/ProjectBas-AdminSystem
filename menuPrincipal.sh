#!/bin/bash

rutaParcial=$(dirname $(realpath $0))/
#importar libreria
source $rutaParcial"rutas.sh" $rutaParcial
source $utiles

function menuPrincipal() {
cat << menuPrincipal
        .--.  ####### #######    #    #     #    #      
       |o_o |    #    #         # #   ##   ##    #    #  
       |<_/ |    #    #        #   #  # # # #    #    #  
      //   \ \   #    #####   #     # #  #  #    #    #  
     (|     | )  #    #       ####### #     #    ####### 
    / \_   _/ \  #    #       #     # #     #         #  
    \___)=(___/  #    ####### #     # #     #         #  
	##############################################|
	|					      |
  	|	    MENU PRINCIPAL		      |
	|					      |
	##############################################|
	1) Gestion de Usuarios			      |
	2) Gestion de Discos			      |
	3) Gestion de Procesos			      |
	4) Gestion de Memoria			      |
	5) Gestion de Texto			      |
	6) Ingresar como root			      |
	0) Salir del Menu			      |
	###############################################
menuPrincipal
}
opcion=7
while [ $opcion -ne 0 ]; do
	clear
        menuPrincipal
	msj_es_root
	read -p "Seleccione una opcion de 1 a 6: " opcion
        case $opcion in
                1)
                        bash $menuUsuarios
                        ;;
                2)
                        bash $menuDisco
                        ;;
                3)
                        bash $menuProceso
                        ;;
                4)
                        bash $menuMemoria
                        ;;
                5)
                        bash $menuTexto
                        ;;
		6)
                        su root -c "bash $0"
			;;
                0)
                        echo "Ha seleccionado salir del menu.. gracias por usar nuestro programa.. bye! :) "
                        break 
                        ;;
                *)
			warning "Esa no es una opcion valida, selecciona de 1 a 6 :-)"
                        ;;
		esac
done
