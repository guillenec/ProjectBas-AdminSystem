#!/bin/bash
clear
function subMenuSeis(){
#menu corregido usando case
cat << menuGestTexto 
	###############################################
	     Menu de opciones Gestion de texto    
	###############################################

	1) Verificar la resolucion del hostname local 
	2) Chequear DNS y actualizar
	3) Ayuda / Help
	0) Volver al menu anterior
	###############################################
menuGestTexto
}

opcion=6
while [ $opcion -ne 0 ]; do
	subMenuSeis
        read -p "seleccione una opcion de 1 a 5: " opcion
        clear
        case $opcion in
                1)
			echo "Ha seleccionado: Verificar la resolucion del hostname local "
			bash $textoPunto1
                        ;;
                2)
			echo "Ha seleccionado: Chequear DNS y actualizar"
			bash $chequeoDNS
                        ;;
		3)	less $helpTexto
			;;
                0)
                        echo "ha seleccionado salir del menu.. gracias por usar nuestro programa.. bye bye "
                        break
                        ;;
                *)
			warning "Seleccione una opcion de 1 a 5 muchas graciase."
                        ;;
	esac
done
