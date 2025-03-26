#!/bin/bash
# Programa para ejemplificar el uso de la sentencia de iteración for
# Autor: JC
# Fecha: 2025-03-26

arregloNumeros=(1 2 3 4 5 6)

echo "Iterar en la lista de números"
for num in ${arregloNumeros[*]}
do
    echo "Número: $num"
done

echo -e "\nIterar en la lista de cadenas"
for nom in "Marco" "Pedro" "Luis" "Daniela"
do
    echo "Nombres: $nom"
done

echo -e "\nIterar en archivos"
for file in *
do
    echo "Nombre archivo: $file"
done

echo -e "\nIterar utilizando un comando"
for fil in $(ls)
do
    echo "Nombre archivo: $fil"
done

echo -e "\nIterar utilizando el formato tradicional"
for ((i=1; i<10; i++))
do
    echo "Número: $i"
done