#!/bin/bash
# Programa para ejemplificar el uso de los for loops anidados
# Autor: JC
# Fecha: 2025-03-26

echo "Loops anidados"
for file in $(ls)
do
    for nombre in {1..4}
    do
        echo "Nombre archivo: $file _ $nombre"
    done
done