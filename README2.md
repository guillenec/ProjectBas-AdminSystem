
# Toolkit Project en BASH
## 🖼️ Menu Principal, Sub Menu Gestion De Usuarios y Discos
![Vistazo Detalles](https://res.cloudinary.com/dpiwmbsog/image/upload/v1678845657/vistaMenuPrincipal_123_ocahdy.png "menu principal admin sistem")

## 🖼️ Menu Gestion de Textos, Sub Menu Mmemorias y Procesos
![Vistazo Detalles](https://res.cloudinary.com/dpiwmbsog/image/upload/v1678845655/vista_45_adminprocess_y5y9g7.png "menues gestion memoria, texto y procesos")

## 🛠 Herramientas del Administrador(a) de Sistemas
Este proyecto es un conjunto de scripts  accesibles por el/la usuario/a desde un menú en el shell. Cada opción de menú  permite acceder a cada una de las opciones y subopciones para ejecutar las tareas solicitadas. 

## 😎 **Importante** 
<p style='text-align: justify;'>Se corresponde con el trabajo final y obligatorio de la materia Administración de Sistemas Avanzado de la carrera Administración de Sistemas y Software Libre. La misma esta dividida en diferentes secciones, cada una corresponde a una de las entregas realizadas durante la curzada.
</p>

## 👨‍🎓👨‍🎓 **Integrantes Del Grupo**
 Este proyecto fue realizado en conjunto con 2 compañeros de la curzada: [@Benjamín Muñoz](https://gitlab.com/bronxi), [@Mathias Moreira](https://gitlab.com/neelbap) y yo [@Guillermo Neculqueo](https://github.com/guillenec).


## ❓ Consignas Y Consideracions Realizadas
* Ud. posee permisos de administrador/a en las vms pertenecientes a los/las integrantes del grupo, por lo que algunas tareas no podrán ser evaluadas en máquinas remotas, en ese caso, deberá mostrarse una advertencia y continuar con la ejecución. Esto es, el script deberá distinguir entre ejecución en modo administrador/a o en modo usuario sin privilegios. 
* Para probar los ejercicios que demanden nuevos usuarios/as, por favor crear usuarios/as basados en su nombre de usuario/a individuales. Por ejemplo, si su nombre de usuario es lechner01, los usuarios/as de prueba serán lechner01a, lechner01b, etc. Esto nos permitirá asistirlos de manera más efectiva.
* El script recibirá opcionalmente, por algún método que ud. considere conveniente, el listado de máquinas sobre las que ejecutar las diversas tareas. Por ejemplo, podría proveerse como argumento del script principal un listado de IP, una por línea, o solicitarlo a través de la entrada estándar al usuario.
* En todos los casos, la tarea debe resolverse para una máquina individual y luego proceder a re-utilizar el código (tal vez función) creado para replicar el comportamiento en el listado de máquinas provisto. 
* Documentación: a medida que avance el script debe documentarse, esto es deberá tener comentarios explicativos de las secciones de código. Además deberá proveer un breve explicación en la cabecera del mismo.
* Proveer funcionalidad de ayuda al usuario/a final. Recomendamos utilizar el argumento -h (help) para implementar las ayudas de usuario.


## 🗒 Notas del Script de Administracion
1. Posee un menú de opciones como principal interface del proyecto.
2. Gestión de usuarios
    * _Altas de usuarios_: Dado un listado de usuarios en un archivo csv, permite crear los usuarios.
    * _Cruce de claves_: Dado un listado de usuarios en un archivo csv,  permite cruzar (y generar en caso que no existan)  las claves de cada uno de ellos/ellas dentro del conjunto de máquinas provistas como argumento. 
    * _Baja de usuarios_: Dado un listado de usuarios en un archivo csv, permite eliminarlos del sistema. se Indican qué política asume con respecto a los datos de los usuarios eliminados.
    * _Reporte de usuarios de sistema_: un script que devuelva el listado de todos los usuarios del sistema.
    * _Reporte de usuarios activos_: un script que devuelva el listado de todos/as los/las usuarios/as (que no sean de sistema o aplicación) habilitados para login. 
    ### Ejemplo de salida para ejecución en múltiples máquinas:
    * vmx :
        * usuarioA
        * usuarioB
        * etc
    * vmy:
        * usuarioA
        * usuarioB
        * etc

3. Gestión de discos
    * _Reporte_ de información de espacio en disco para cada servidor. se muestra: 
        * Tamaño total
        * % de utilizado
        * % disponible
        * Punto de montaje
    * _Reporte_ de rendimiento de los discos locales, en caso que la herramienta no se encuentre instalada, el script notifica al usuario y ofrece la posibilidad de instalarla.
    * _Reporte_ de actividad de I/O en todos los discos primarios de todos los servidores provistos . Obtiena las lecto/escrituras del comando que se está ejecutando en ese momento. Al igual que en el caso anterior, en caso que la herramienta no se encuentre instalada, el script notifica al usuario y ofrecerle la posibilidad de instalarla.

4. Gestión de procesos
    * _Reporte_ de los primeros 5 procesos ordenados por consumo de memoria.
    * _Reporta una alerta_ si el número de procesos es superior a un umbral provisto por el usuario.
    
        NOTA: los ítems a continuación sólo se ejecutarán en la máquina local del script y no en máquinas remota.
    
    * Monitorea un proceso específico, dado un id de proceso (PID) muestra por pantalla sólo ese proceso con un límite de iteración de 10 veces.
    * Elimina un proceso específico dado su id de proceso (PID). Realiza un intento de eliminarlo de manera amable; en caso de no funcionar intenta con mayor ímpetu y por último, en caso de no poder eliminarlo, emitir una advertencia. 
    * Se extiende la funcionalidad del punto anterior elimina una lista de procesos (PIDs), automatiza el trabajo de hacerlo uno por uno.

5. Gestión de la memoria
    * Reporte del uso de memoria RAM.
    * Dado el script de memory-alert.sh, Permite recibir las alertas en su mailbox local. Luego,  guarde la información en un archivo temporal.

6. Gestión de texto
    * Verifica que la resolución del hostname local de la máquina se encuentre correctamente configurado en la base de datos local de hosts (/etc/hosts). En caso de no estarlo se muestra una advertencia.
    * Dada un listado de servidores DNS, verificar que los mismos se encuentren configurados, caso contrario, se  agregadan a la configuración actual. 



