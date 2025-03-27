#!/bin/bash
# Menú de opciones del sistema
# Autor: JC
# Fecha: 2025-03-26

# option=0

while :
do
    clear
    echo "_________________________________________"
    echo "         Menú de Opciones del Sistema        "
    echo "_________________________________________"
    echo "1. Procesos Actuales"
    echo "2. Memoria Disponible"
    echo "3. Espacio en Disco"
    echo "4. Información de Red"
    echo "5. Variables de Entorno Configuradas"
    echo "6. Información del Programa"
    echo "7. Backup información"
    echo "8. Salir"

    read -n1 -p "Ingrese una opción [1-8]: " option

    echo -e "\n\n"

    case $option in
        1)
            echo "Procesos Actuales:"
            ps aux
            ;;
        2)
            echo "Memoria Disponible:"
            free -h
            ;;
        3)
            echo "Espacio en Disco:"
            df -h
            ;;
        4)
            echo "Información de Red:"
            ip route
            ;;
        5)
            echo "Variables de Entorno Configuradas:"
            env
            ;;
        6)
            echo "Información del Programa:"
            echo "Autor: JC"
            echo "Fecha: 2025-03-26"
            echo "Descripción: Menú de opciones del sistema"
            ;;
        7)
            echo "Backup información"
            echo "Simulando crear respaldo..."
            sleep 2
            echo "Respaldo creado correctamente."
            ;;
        8)
            echo "Saliendo del programa..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, seleccione una opción del 1 al 8."
            ;;
    esac

    echo -e "\nPresione cualquier tecla para continuar..."
    read -n1 -s -r -p ""
done