#!/bin/bash
# Programa para ejemplificar el uso de los archivos y directorios
# Autor: JC
# Fecha: 2025-03-26

echo "Archivos - Directorios"

if [ $# -ne 2 ]; then
    echo "Error: Se requieren exactamente 2 parámetros."
    exit 1
fi

if [ $1 = "d" ]; then
    mkdir -m 755 $2
    echo "El directorio $2 fue creado"
elif [ $1 = "f" ]; then
    touch $2
    echo "El archivo $2 fue creado"
else
    echo "No existe la opción $1"
fi
