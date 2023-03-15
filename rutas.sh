#!/bin/bash

ruta=$1
#rutas menu principal
export menuUsuarios=$ruta"gestionDeUsuarios/menuGestionUsuarios.sh"
export menuDisco=$ruta"gestionDeDiscos/menuGestionDisco.sh"
export menuProceso=$ruta"gestionDeProcesos/menuProcesos.sh"
export menuMemoria=$ruta"gestionDeMemoria/menuGestionMemoria.sh"
export menuTexto=$ruta"gestionDeTexto/menuTexto.sh"

#rutas Opcion gestion de usuarios
export altaUsuarios=$ruta"gestionDeUsuarios/alta_usuarios.sh"
export cruceClaves=$ruta"gestionDeUsuarios/cruceClaves.sh"
export bajaUsuarios=$ruta"gestionDeUsuarios/baja_usuario.sh"
export reporteUsuSis=$ruta"gestionDeUsuarios/reporteUsuariosSistema.sh"
export reporteUsuAct=$ruta"gestionDeUsuarios/reporteUsuariosActivos.sh"
export reportesRemoto=$ruta"gestionDeUsuarios/reporteExt.sh"
export helpUsuarios=$ruta"gestionDeUsuarios/help.txt"

#rutas Opcion gestion de disco
export reporteEspacio=$ruta"gestionDeDiscos/reporteEspacio.sh"
export reporteRendimiento=$ruta"gestionDeDiscos/reporteRendimiento.sh"
export reporteActividad=$ruta"gestionDeDiscos/reporteActividad.sh"
export helpDiscos=$ruta"gestionDeDiscos/help.txt"

#rutas Opcion gestion de procesos
export gestionProcesos=$ruta"gestionDeProcesos/gestionProcesos.sh"
export alertaUmbral=$ruta"gestionDeProcesos/alertaUmbral.sh"
export procesoEspecifico=$ruta"gestionDeProcesos/procesoEspecifico.sh"
export eliminarProceso=$ruta"gestionDeProcesos/eliminarProceso.sh"
export eliminarProcExt=$ruta"gestionDeProcesos/eliminarProcesoEXT.sh"
export listaProcesos=$ruta"gestionDeProcesos/listaProcesos.sh"
export helpProcesos=$ruta"gestionDeProcesos/help.txt"

#rutas Opcion gestion de memoria
export reporteUso=$ruta"gestionDeMemoria/reporteUso.sh"
export memory_alert=$ruta"gestionDeMemoria/memory_alert.sh"
export helpMemory=$ruta"gestionDeMemoria/help.txt"

#rutas Opcion gestion de texto
export textoPunto1=$ruta"gestionDeTexto/punto1Texto.sh" 
export chequeoDNS=$ruta"gestionDeTexto/chequeoDNS.sh"
export helpTexto=$ruta"gestionDeTexto/help.txt"

#rutas Archivos complementarios
export utiles=$ruta"utils.sh"
