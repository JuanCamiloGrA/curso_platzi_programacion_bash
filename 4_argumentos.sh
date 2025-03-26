# !/bin/bash
# Programa para ejemplificar el paso de argumentos
# Autor: JC - @juan_gri

nombreCurso=$1
horarioCurso=$2

echo "El nombre del curso es: $nombreCurso en el horario de $horarioCurso"
echo "El número de parámetros enviados es: $#"
echo "Los parámetros enviados son: $*"

