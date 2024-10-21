#!/bin/bash

echo " "
echo "-----------------------"
echo "|       REGISTRO       |"
echo "-----------------------"

read -p "Inserte Documento: " documento
read -p "Inserte Nombre: " name
read -p "Inserte Apellido: " surname
read -p "Inserte Direccion: " address
read -p "Inserte Conexion (fijo o inalámbrico): " connection

while true; do
    if [ "$connection" != "fijo" ] && [ "$connection" != "inalámbrico" ]; then
        read -p "Tipo de conexión incorrecta, inserte de nuevo: " connection
    else
        break
    fi
done

read -p "Inserte Plan (limitado o plano): " plan

while true; do
    if [ "$plan" != "plano" ] && [ "$plan" != "plano" ]; then
        read -p "Tipo de plan incorrecto, inserte de nuevo: " plan
    else
        break
    fi
done

read -p "Inserte medio de paga (efectivo o crédito): " payment

while true; do
    if [ "$payment" != "efectivo" ] && [ "$payment" != "crédito" ]; then
        read -p "medio de pago incorrecto, inserte de nuevo: " payment
    else
        break
    fi
done

echo "$usuario:$passwrd" >> obligatorio/usuarios/users

mkdir obligatorio/usuarios/$usuario

echo "$usuario:$documento:$name:$surname:$address:$connection:$plan:$payment" >> obligatorio/usuarios/InfoUsers

echo "$(date) - $usuario se registró" >> log/$usuario
echo "$(date) - $usuario se registró" >> log/general

