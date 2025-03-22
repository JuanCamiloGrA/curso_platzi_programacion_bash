#!/bin/bash

# --- Funciones de color (opcional, pero mejora la legibilidad) ---
rojo="\e[31m"
verde="\e[32m"
amarillo="\e[33m"
azul="\e[34m"
magenta="\e[35m"
cian="\e[36m"
blanco="\e[37m"
normal="\e[0m"  # Resetea el color a la normalidad

# --- Función para validar si una cadena contiene solo letras y espacios ---
validar_nombre() {
  local cadena="$1"
  if [[ ! "$cadena" =~ ^[a-zA-Z\s]+$ ]]; then
    return 1 # Error: No solo letras y espacios
  else
    return 0 # Éxito: Solo letras y espacios
  fi
}

# --- Función para validar si una cadena es un entero positivo ---
validar_edad() {
  local cadena="$1"
  if [[ ! "$cadena" =~ ^[0-9]+$ ]]; then
    return 1 # Error: No es un número
  elif [[ "$cadena" -lt 0 ]]; then
    return 1 # Error: No es positivo
  else
    return 0 # Éxito: Es un entero positivo
  fi
}

# --- Función para validar un número de teléfono (formato básico) ---
validar_telefono() {
  local telefono="$1"
  # Permite dígitos, espacios, guiones y paréntesis.  Adaptar a tu formato regional.
  if [[ ! "$telefono" =~ ^[0-9\s()-]+$ ]]; then
    return 1 # Error: Formato inválido
  else
    return 0 # Éxito: Formato válido
  fi
}

# --- Variables para almacenar la información ---
nombre=""
apellido=""
edad=""
direccion=""
telefono=""

# --- Solicitar información al usuario ---
echo -e "${azul}Por favor, ingrese la siguiente información:${normal}"

# --- Nombre ---
while true; do
  read -p "Nombre: " nombre
  if validar_nombre "$nombre"; then
    break
  else
    echo -e "${rojo}Error: El nombre debe contener solo letras y espacios.${normal}"
  fi
done

# --- Apellido ---
while true; do
  read -p "Apellido: " apellido
  if validar_nombre "$apellido"; then
    break
  else
    echo -e "${rojo}Error: El apellido debe contener solo letras y espacios.${normal}"
  fi
done

# --- Edad ---
while true; do
  read -p "Edad: " edad
  if validar_edad "$edad"; then
    break
  else
    echo -e "${rojo}Error: La edad debe ser un número entero positivo.${normal}"
  fi
done

# --- Dirección ---
read -p "Dirección: " direccion  # No se valida, ya que puede contener caracteres diversos

# --- Teléfono ---
while true; do
  read -p "Teléfono: " telefono
  if validar_telefono "$telefono"; then
    break
  else
    echo -e "${rojo}Error: El teléfono debe contener solo números, espacios, guiones y/o paréntesis.${normal}"
  fi
done

# --- Imprimir la información recolectada ---
echo -e "\n${verde}Información ingresada:${normal}"
echo -e "Nombre: ${cian}$nombre${normal}"
echo -e "Apellido: ${cian}$apellido${normal}"
echo -e "Edad: ${cian}$edad${normal}"
echo -e "Dirección: ${cian}$direccion${normal}"
echo -e "Teléfono: ${cian}$telefono${normal}"

echo -e "${magenta}¡Gracias por proporcionar la información!${normal}"

exit 0
