# !/bin/sh
# Description: Programa para ejemplificar el uso de la compresión de archivos con tar, gzip y pbzip2
# Author: JC - @jc
# Date: 2025-03-26

echo "Empaquetar todos los scripts de la carpeta shellCourse con tar"
tar -cvf shellCourse.tar *.sh

# Cuando se empaqueta con gzip el empaquetamiento anterior se elimina
gzip shellCourse.tar

echo "Empaquetar un solo archivo, con un ratio 9"
gzip -9 9_options.sh

echo "Empaquetar todos los scripts de la carpeta shellCourse con pbzip2"
tar -cvf shellCourse.tar *.sh
pbzip2 -f shellCourse.tar

echo "Empaquetar un directorio con tar y pbzip2"
tar -cf *.sh -c > shellCourseDos.tar.bz2