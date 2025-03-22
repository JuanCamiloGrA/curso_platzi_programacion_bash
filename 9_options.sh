#!/bin/bash
# Programa para ejemplificar cómo se realiza el paso de opciones con o sin parámetros
# Autor: JC
# Fecha 2025-22-03

echo "Programa Opciones"
echo "Opción 1 enviada: $1"
echo -e "\n"
echo "Opción 2 enviada: $2"
echo -e "\n"
echo "Opción enviada: $*" # Muestra todas las opciones enviadas
echo -e "\n"

echo "Recuperar valores"
while [ -n "$1" ]
do
	case "$1" in
		-a) echo "-a option utilizada";;
		-b) echo "-b option utilizada";;
		-c) echo "-c option utilizada";;
		*) echo "$1 no es una opción";;
	esac
	shift
done

