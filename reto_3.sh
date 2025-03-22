#!/bin/bash
# Autor: JC
# Fecha: 2025-03-22

# Colores ANSI
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[0;33m'
AZUL='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BLANCO='\033[0;37m'
NC='\033[0m' # No Color

# Función para limpiar la pantalla
limpiar_pantalla() {
  clear
}

# Función para mostrar el menú
mostrar_menu() {
  echo -e "${AZUL}Seleccione una opción (1-5):${NC}"
  echo -e "1. Validación numérica"
  echo -e "2. Validación de cadena"
  echo -e "3. Validación de archivo"
  echo -e "4. Validación combinada (numérica y cadena)"
  echo -e "5. Validación combinada (archivo y numérica)"
  echo -e "${ROJO}0. Salir${NC}"
  read -n1 -p "Ingrese su elección: " opcion
  return $opcion
}

# Función para validar una entrada numérica
validar_numerica() {
  read -p "Ingrese un número entero: " numero

  if [[ ! "$numero" =~ ^-?[0-9]+$ ]]; then
    echo -e "${ROJO}Error: '$numero' no es un número entero válido.${NC}"
    return 1
  fi

  if [ $numero -gt 100 ]; then
    echo -e "${VERDE}El número '$numero' es mayor que 100.${NC}"
  elif [ $numero -lt 0 ]; then
    echo -e "${AMARILLO}El número '$numero' es menor que 0.${NC}"
  else
    echo -e "${CYAN}El número '$numero' está entre 0 y 100 (inclusive).${NC}"
  fi
  return 0
}

# Función para validar una cadena
validar_cadena() {
  read -p "Ingrese una cadena de texto: " cadena

  if [[ -z "$cadena" ]]; then
    echo -e "${ROJO}Error: La cadena está vacía.${NC}"
    return 1
  fi

  if [[ "${#cadena}" -gt 20 ]]; then
    echo -e "${VERDE}La cadena '$cadena' tiene más de 20 caracteres.${NC}"
  elif [[ "$cadena" == *[[:space:]]* ]]; then
    echo -e "${AMARILLO}La cadena '$cadena' contiene espacios.${NC}"
  else
    echo -e "${CYAN}La cadena '$cadena' es válida (no vacía, menos de 20 caracteres y sin espacios).${NC}"
  fi
  return 0
}

# Función para validar un archivo
validar_archivo() {
  read -p "Ingrese la ruta de un archivo: " ruta_archivo

  if [[ ! -e "$ruta_archivo" ]]; then
    echo -e "${ROJO}Error: El archivo '$ruta_archivo' no existe.${NC}"
    return 1
  fi

  if [[ -d "$ruta_archivo" ]]; then
    echo -e "${AMARILLO}Error: '$ruta_archivo' es un directorio, no un archivo.${NC}"
    return 1
  fi

  if [[ -r "$ruta_archivo" ]]; then
    echo -e "${VERDE}El archivo '$ruta_archivo' es legible.${NC}"
  else
    echo -e "${ROJO}Error: El archivo '$ruta_archivo' no es legible.${NC}"
  fi

  if [[ -w "$ruta_archivo" ]]; then
    echo -e "${VERDE}El archivo '$ruta_archivo' es escribible.${NC}"
  else
    echo -e "${ROJO}Error: El archivo '$ruta_archivo' no es escribible.${NC}"
  fi

  if [[ -x "$ruta_archivo" ]]; then
    echo -e "${VERDE}El archivo '$ruta_archivo' es ejecutable.${NC}"
  else
    echo -e "${ROJO}Error: El archivo '$ruta_archivo' no es ejecutable.${NC}"
  fi

  return 0
}

# Función para validación combinada (número y cadena)
validar_combinada_numero_cadena() {
  validar_numerica
  numero_valido=$?

  validar_cadena
  cadena_valida=$?

  if [[ $numero_valido -eq 0 && $cadena_valida -eq 0 ]]; then
    echo -e "${VERDE}Ambas validaciones (número y cadena) fueron exitosas.${NC}"
  else
    echo -e "${ROJO}Al menos una validación (número o cadena) falló.${NC}"
  fi
}

# Función para validación combinada (archivo y número)
validar_combinada_archivo_numero() {
  validar_archivo
  archivo_valido=$?

  validar_numerica
  numero_valido=$?

  if [[ $archivo_valido -eq 0 && $numero_valido -eq 0 ]]; then
    echo -e "${VERDE}Ambas validaciones (archivo y número) fueron exitosas.${NC}"
  else
    echo -e "${ROJO}Al menos una validación (archivo o número) falló.${NC}"
  fi
}


# Bucle principal
while true; do
  limpiar_pantalla
  mostrar_menu

  case $opcion in
    1)
      limpiar_pantalla
      validar_numerica
      ;;
    2)
      limpiar_pantalla
      validar_cadena
      ;;
    3)
      limpiar_pantalla
      validar_archivo
      ;;
    4)
      limpiar_pantalla
      validar_combinada_numero_cadena
      ;;
    5)
      limpiar_pantalla
      validar_combinada_archivo_numero
      ;;
    0)
      echo -e "${VERDE}\nSaliendo del programa...${NC}"
      exit 0
      ;;
    *)
      echo -e "${ROJO}Opción no válida. Intente de nuevo.${NC}"
      sleep 2
      ;;
  esac

  read -n 1 -s -r -p "Presione cualquier tecla para continuar..."
done
