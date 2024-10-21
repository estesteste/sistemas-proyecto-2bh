#!/bin/bash

if grep -q "$usuario:$passwrd" obligatorio/usuarios/users && grep "$usuario" obligatorio/usuarios/InfoUsers && [ obligatorio/usuarios/$usuario -d ]; then
	source scripts/users.sh
	echo "$(date) - $usuario se logueó^" >> log/$usuario
	echo "$(date) - $usuario se logueó^" >> log/general

elif grep -q "$usuario:$passwrd" obligatorio/admins/admins; then
	source scripts/admins.sh
	echo "$(date) - $usuario se logueó^" >> log/$usuario
	echo "$(date) - $usuario se logueó^" >> log/general

else
	source scripts/createUsers.sh
fi
