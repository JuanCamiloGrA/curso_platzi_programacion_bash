#!/bin/bash
# Programa para ejemplificar el uso de la sentencia de iteración while
# Autor: JC
# Fecha: 2025-03-26

numero=1

while [ $numero -ne 10 ]
do
    if [ $numero -eq 1 ]
    then
        echo "Imprimiendo $numero vez"
        else
        echo "Imprimiendo $numero veces"
    fi
    numero=$((numero + 1))
done