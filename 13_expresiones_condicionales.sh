# !/bin/bash
# Propósito: Mostrar el uso de expresiones condicionales en bash.
# Autor: JC
# Fecha: 2025-03-22
# ------------------------------------------------------------------

edad=0
pais=""
pathArchivo=""

read -p "Ingrese su edad: " edad
read -p "Ingrese su país: " pais
read -p "Ingrese el path de un archivo: " pathArchivo

echo -e "\nExpresiones condicionales con números"
if [ $edad -lt 10 ]; then
    echo "La persona es un niño o niña"
elif [ $edad -ge 10 ] && [ $edad -le 17 ]; then
    echo "La persona es un adolescente"
else
    echo "La persona es mayor de edad"
fi

echo -e "\nExpresiones condicionales con cadenas"
if [ $pais = "EEUU" ]; then
    echo "La persona es estadounidense"
elif [ $pais = "Ecuador" ] || [ $pais = "Colombia" ]; then
    echo "La persona es sudamericana"
else
    echo "Se desconoce la nacionalidad"
fi

echo -e "\nExpresiones condicionales con archivos"
if [ -d $pathArchivo ]; then
    echo "El directorio $pathArchivo existe"
else
    echo "El directorio $pathArchivo no existe"
fi
