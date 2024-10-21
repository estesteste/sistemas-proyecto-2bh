#!/bin/bash

echo ""
echo "-----------------------------------"
echo "|      MENÚ DE ADMINISTRADOR      |"
echo "-----------------------------------"
echo "|	! = eliminar usuario		|"
echo "|	% = ver logueo de un usuario    |"
echo "|	@ = ver informacion de usuario  |"
echo "|	* = ver todos los usuarios      |"
echo "|	/ = ver usuarios por conexión   |"
echo "|	+ = ver usuarios por plan       |"
echo "|	€ = ver usuarios por paga       |"
echo "|	? = ver ayuda		        |"
echo "|	X = salir	                |"
echo "-----------------------------------"

while true; do

read -p ": " command

if [ "$command" == "*" ]; then
    ls -d obligatorio/usuarios/*/
    echo "$(date) - $usuario vió la información de todos los usuarios" >> log/$usuario
    echo "$(date) - $usuario vió la información de todos los usuarios" >> log/general
elif [ "$command" == "!" ]; then
    read -p "Inserte Usuario a Borrar: " usuariob
    rmdir "obligatorio/usuarios/$usuariob"
    echo "$(date) - $usuario borró la información de $usuariob" >> log/$usuario
    echo "$(date) - $usuario borró la información de $usuariob" >> log/general
elif [ "$command" == "@" ]; then
    read -p "Inserte Usuario a Ver Información: " usuariob
    grep "$usuariob" obligatorio/usuarios/InfoUsers 
    echo "$(date) - $usuario vió la información de $usuariob" >> log/$usuario
    echo "$(date) - $usuario vió la información de $usuariob" >> log/general
elif [ "$command" == "%" ]; then
    read -p "Inserte Usuario a Ver Logueo: " usuariob
    cat "log/$usuariob"
    echo "$(date) - $usuario vió el logueo de $usuariob" >> log/$usuario
    echo "$(date) - $usuario vió el logueo de $usuariob" >> log/general
elif [ "$command" == "+" ]; then
    echo "Usuarios con plan limitado: $(grep -c limitado obligatorio/usuarios/InfoUsers)"
    echo "Usuarios con plan plano: $(grep -c plano obligatorio/usuarios/InfoUsers)"
    echo "$(date) - $usuario la cantidad de usuarios y sus planes" >> log/$usuario
    echo "$(date) - $usuario la cantidad de usuarios y sus planes" >> log/general    
elif [ "$command" == "/" ]; then
    echo "Usuarios con conexión fija: $(grep -c fijo obligatorio/usuarios/InfoUsers)"
    echo "Usuarios con conexión inalámbrica: $(grep -c inalámbrico obligatorio/usuarios/InfoUsers)"
    echo "$(date) - $usuario la cantidad de usuarios y sus tipos de conexión" >> log/$usuario
    echo "$(date) - $usuario la cantidad de usuarios y sus tipos de conexión" >> log/general
elif [ "$command" == "€" ]; then
    echo "Usuarios por efectivo: $(grep -c efectivo obligatorio/usuarios/InfoUsers)"
    echo "Usuarios por crédito: $(grep -c crédito obligatorio/usuarios/InfoUsers)"
    echo "$(date) - $usuario la cantidad de usuarios y sus medios de pago" >> log/$usuario
    echo "$(date) - $usuario la cantidad de usuarios y sus medios de pago" >> log/general
elif [ "$command" == "?" ]; then
	echo ""
	echo "-----------------------------------"
	echo "|      MENÚ DE ADMINISTRADOR      |"
	echo "-----------------------------------"
	echo "|	! = eliminar usuario		|"
	echo "|	% = ver logueo de un usuario    |"
	echo "|	@ = ver informacion de usuario  |"
	echo "|	* = ver todos los usuarios      |"
	echo "|	/ = ver usuarios por conexión   |"
	echo "|	+ = ver usuarios por plan       |"
	echo "|	€ = ver usuarios por paga       |"
	echo "|	? = ver ayuda		        |"
	echo "|	X = salir	                |"
	echo "-----------------------------------"
elif [ "$command" == "X" ]; then
	echo "$(date) - $usuario salió" >> log/$usuario
	echo "$(date) - $usuario salió" >> log/general
	break
else 
    echo "comando no encontrado."
fi

done
