#!/bin/bash
# Programa para ejemplificar el uso de los arreglos
# Autor: JC
# Fecha: 2025-03-26

arregloNumeros=(1 2 3 4 5 6)
arregloCadenas=(Juan Camilo Pedro Pablo)
arregloRandos=({A..Z} {10..20})

# Imprimir todos los arreglos
echo "Imprimir todos los arreglos:"
echo "${arregloNumeros[@]}"
echo "${arregloCadenas[@]}"
echo "${arregloRandos[@]}"
echo

# Imprimir los tamaños de los arreglos
echo "Imprimir los tamaños de los arreglos:"
echo "Tamaño de arregloNumeros: ${#arregloNumeros[@]}"
echo "Tamaño de arregloCadenas: ${#arregloCadenas[@]}"
echo "Tamaño de arregloRandos: ${#arregloRandos[@]}"
echo

# Imprimir la posición 3 de cada arreglo
echo "Imprimir la posición 3 de cada arreglo:"
echo "Posición 3 de arregloNumeros: ${arregloNumeros[3]}"
echo "Posición 3 de arregloCadenas: ${arregloCadenas[3]}"
echo "Posición 3 de arregloRandos: ${arregloRandos[3]}"

# Añadir y eliminar valores en un arreglo
arregloNumeros[7]=20
unset arregloNumeros[0]
echo "Imprimir el arregloNumeros luego de añadir y eliminar valores:"
echo "${arregloNumeros[@]}"
echo "Tamaño de arregloNumeros luego de añadir y eliminar valores: ${#arregloNumeros[@]}"