# ! /bin/bash
# Programa para ejempificar cómo capturar la información del usuario utilizando echo, read y $REPLY
# Autor: JC - @jc
# Fecha: 2025-22-03

option=0
backupName=""

echo "Programa utilidades Postgres"
read -p "Ingresar una opción: " option
read -p "Ingresar el nombre del archivo del backup: " backupName
echo "Opción: $option, Nombre del backup: $backupName"
