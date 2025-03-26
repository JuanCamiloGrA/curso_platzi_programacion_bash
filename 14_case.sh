# !/bin/bash
# Programa para ejemplificar el uso de la sentencia case
# Autor: JC
# Fecha: 2025-03-22

opcion=""

echo "Ejemplo Sentencia Case"
read -p "Ingrese una opción de la A - Z: " opcion
echo  "\n"

case $opcion in
    "A") echo  "\nOperación Guardar Archivo";;
    "B") echo  "\nOperación Eliminar Archivo";;
    [C-E]) echo  "\nNo está implementada la operación";;
    "*") echo  "\nOpción Incorrecta"
esac
