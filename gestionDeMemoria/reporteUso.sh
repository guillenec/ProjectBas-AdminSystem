#!/bin/bash
#script que muestra el uso de memoria ram en el sistema

free | awk '/Mem/{{printf("Porcetanje uso memoria RAM: %.2f\n"), $3/$2*100} {printf("Porcentaje disponible de memoria RAM: %.2f\n"), $4/$2*100}}'

