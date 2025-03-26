#!/bin/bash
# Programa para ejemplificar la sentencia de decisión if else
# Autor: JC
# Fecha: 2025-22-03

notaClase=0
edad=0

echo "Ejemplo Sentencia If -else"
read -n1 -p "Indique cual es su nota (1-9): " notaClase
echo -e "\n"

if (( $notaClase >= 7 )); then
    echo "El alumno aprueba la materia"
else
    echo "El alumno reprueba la materia"
fi

read -p "Indique cual es su edad: " edad
if [ $edad -le 10 ] && [ $edad -ge 0 ]; then
    echo "La persona es un niño o niña"
elif [ $edad -le 18 ] && [ $edad -ge 10 ]; then
    echo "La persona es adolescente"
elif [ $edad -ge 19 ] && [ $edad -le 64 ]; then
    echo "La persona es adulta"
elif [ $edad -ge 65 ] && [ $edad -le 125 ]; then
    echo "La persona es adulto mayor"
else
    echo "La edad no es válida"
fi
