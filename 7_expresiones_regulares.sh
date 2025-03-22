#!/bin/bash
# Programa para ejemplificar cómo capturar la información del usuario y validarla utilizando expresiones regulares
# Autor: JC
# Fecha: 2025-22-03

identificacionRegex='^[0-9]{10}$'
paisRegex='^EC|COL|US$'
fechaNacimientoRegex='^19|20[0-8]{2}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$'

echo "Expresiones Regulares"
read -p "Ingrese su identificación: " identificacion
read -p "Ingrese las iniciales de su país [EC, COL, US]: " pais
read -p "Ingrese su fecha de nacimiento [YYYYMMDD]: " fechaNacimiento

# Validación de la identificación
if [[ $identificacion =~ $identificacionRegex ]]; then
	echo "Identificación $identificacion válida"
else
	echo "Identificación $identificacion inválida"
fi

# Validación del país
if [[ $pais =~ $paisRegex ]]; then
    echo "País $pais válido"
else
    echo "País $pais inválido"
fi

# Validación de la fecha de nacimiento
if [[ $fechaNacimiento =~ $fechaNacimientoRegex ]]; then
    echo "Fecha de nacimiento $fechaNacimiento válida"
else
    echo "Fecha de nacimiento $fechaNacimiento inválida"
fi
