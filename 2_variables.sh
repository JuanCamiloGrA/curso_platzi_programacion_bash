# !/bin/bash
# Programa para revisar la declaración de variables.

OPCION=0
NOMBRE=Juan

echo "Opción: $OPCION, Nombre: $NOMBRE"

# Exportar variable para que esté disponible para los demás procesos.
export NOMBRE

# Llamar al siguiente script para recuperar la variable.
./2_variables_2.sh
