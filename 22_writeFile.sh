#!/bin/bash
# Programa para ejemplificar cómo escribir en un archivo
# Autor: JC
# Fecha: 2025-03-26

echo "Escribir en un archivo"

echo "Valores escritos con el comando echo" >> $1

# Adición multilínea
cat <<EOM >>$1
$2
EOM