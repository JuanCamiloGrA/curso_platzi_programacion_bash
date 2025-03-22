#!/bin/bash
# Programa para ejemplificar cómo capturar la información del usuario y validarla
# Autor: JC
# Fecha: 2025-22-03

option=0
backupName=""
clave=""

echo "Programa Utilidades Postgres"
read -n1 -p "Ingresa una opción: " option
echo -e "\n"
read -n10 -p "Ingresa el nombre del archivo del backup: " backupName
echo -e "\n"
read -s -p "Clave: " clave
echo -e "\n"
echo "La opción: $option, el nombre del archivo: $backupName y la clave: $clave"
