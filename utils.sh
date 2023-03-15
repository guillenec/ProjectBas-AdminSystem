#!/bin/bash
#aqui colocaremos las funciones recurrentes , para llamarlas directamente desde este archivo

#++++++++++++++++++++++++++++++++++++++++++
#   funcion que verifica si somos root 
#++++++++++++++++++++++++++++++++++++++++++
function es_root(){
 if [ `id -u` -ne 0 ];then
        return 1

 elif [ `id -u` -eq 0 ];then
        return 0
 else
        return 2 #un error inesperado
 fi
}


msj_es_root(){
        #funcion que trae a es root y muestra msj acorde a lo q suceda ya que muchas veces solo necesitamos el msj y el retorno y otras solo el retorno
       es_root
       r1=$? 
        if [ $r1 -eq 0 ];then
                echo "+-------------------+"
                echo "|   usted es root   |"
                echo "+-------------------+"
                return 0
        elif [ $r1 == 1 ];then
                echo "+----------------------+"
                echo "|   usted no es root   |"
                echo "+----------------------+"
                return 1

        else
                echo "+----------------------+"
                echo "|   error inesperado   |"
                echo "+----------------------+"
                return 2
        fi

}

function estaInstalado(){
        value=$1
        dpkg -s $value &>/dev/null

        if [ $? -eq 0 ];then
                return 0
                #el programa se encuentra instalado
        else
                return 1
                #sino se encuentra instalado devolveraqa 1
        fi
}


function instalacion(){
        value=$1
        estaInstalado $value
        estaInstalado=$?

        if [ $estaInstalado -eq 1 ] ;then
        read -p "desea instalar el programa?? 'y'/'n' " respuesta
              if [[ $respuesta == "y" ]];then
                 apt-get update -y
                 apt-get install $value -y

                        if [ $? -eq 0 ];then
                                echo "+----------------------------------------+"
                                echo "|    $value instalado correctamente    |"
                                echo "+----------------------------------------+"
                                return 0
                                else
                                echo "+---------------------------------------------------+"
                                echo "|    ocurrio un error a la hora de la instalacion   |"
                                echo "+---------------------------------------------------+"
                                return 3
                        fi

             elif [[ $respuesta == "n" ]];then
                echo "+----------------------------------------------+"
                echo "|    ha seleccionado no instalar $value      |"
                echo "+----------------------------------------------+"
                return 2
             fi


        elif [ $estaInstalado -eq 0 ];then
                echo "+----------------------------------------+"
                echo "|     $value ya esta en su sistema     |"
                echo "+----------------------------------------+"
                return 0

        else
                echo "+---------------------------------------------------+"
                echo "|    ocurrio un error a la hora de la instalacion   |"
                echo "+---------------------------------------------------+"
                return 3

        fi


}


function warning() {
        START='\033[0;31m' #color rojo para el msj incorrecto
        END='\033[0;00m'  # verde para la confirmacion de 1 a 5
        MESSAGE=${@:-""}
        echo -e "${START}${MESSAGE}${END}"
        sleep 3
}

#++++++++++++++++++++++++++++++++++++++++++++++
#   funcion que verifica si una ip es correcta
#+++++++++++++++++++++++++++++++++++++++++++++

function valid_ip(){
local  ip=$1
local  stat=1

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        #En ~, es parte del operador =~ que realiza una coincidencia de expresión regular de la cadena a su izquierda con la expresión regular extendida a su derecha.
    OIFS=$IFS
    IFS='.'
    ip=($ip)
    IFS=$OIFS
    [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
        && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
    stat=$?
fi
return $stat
}


export -f warning
export -f instalacion
export -f estaInstalado 
export -f es_root
export -f msj_es_root
export -f valid_ip
