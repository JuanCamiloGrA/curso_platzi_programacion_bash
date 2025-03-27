#!/bin/bash
# Programa para ejemplificar las operaciones de un archivo
# Autor: JC
# Fecha: 2025-03-26

echo "Operaciones de un archivo"
mkdir -m 755 backupScripts

echo -e "\nCopiar archivos .txt del directorio actual al nuevo directorio backupScripts"
cp *.txt backupScripts/
ls -la backupScripts/

echo -e "\nMover el directorio backupScripts a otra ubicación: $HOME"
mv backupScripts $HOME

echo -e "\nEliminar los archivos .txt"
rm *.txt