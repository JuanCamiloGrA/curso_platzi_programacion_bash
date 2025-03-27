#!/bin/bash
# Programa para ejemplificar el uso de la sentencia break y continue
# Autor: JC
# Fecha: 2025-03-26

echo "Sentencia break y continue"
for fil in $(ls)
do
    for nombre in {1..4}
    do
        if [ $fil = "10_download.sh" ]; then
            echo "Se encontro el archivo 10_download.sh"
            break;
        elif [[ $fil == 4* ]]; then
            continue;
        else
            echo "Nombre archivo: $fil _ $nombre"
        fi
    done
done