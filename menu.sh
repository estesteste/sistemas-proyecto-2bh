#!/bin/bash

echo "-----------------------"
echo "|       INGRESO       |"
echo "-----------------------"

read -p "Inserte Usuario: " usuario
read -s -p  "Inserte Contraseña: " passwrd 

source scripts/checkUsers.sh

