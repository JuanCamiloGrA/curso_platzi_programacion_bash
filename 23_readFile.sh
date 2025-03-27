#!/bin/bash
# Programa para ejemplificar como se lee en un archivo
# Autor: JC
# Fecha: 2025-03-26

counter=1

echo "Leer en un archivo"
cat $1

echo -e "\n-------------------\n"

echo -e "\nAlmacenar los valores en una variable"
valorCat=`cat $1`
echo "$valorCat"

echo -e "\n-------------------\n"

# Se utiliza la variable IFS (Internal Field Separator) para evitar que los espacios en blanco al inicio al final se recorten
echo -e "\nLeer archivos línea por línea"
while IFS= read linea
do
    echo "$counter  $linea";
    counter=$((counter + 1));
done < "$1"
