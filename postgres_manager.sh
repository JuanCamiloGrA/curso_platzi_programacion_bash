#!/bin/bash
# Descripción: Programa para realizar tareas de administración de Postgres
# Autor: JC
# Fecha: 2025-03-27

# Funciones

instalar_postgres() {
    echo "Verificando si postgres está instalado..."
    if which psql >/dev/null 2>&1; then
        echo "Postgres ya está instalado en el sistema"
        return 1
    else
        echo "Instalando postgres..."
        sudo apt-get update
        sudo apt-get -y install postgresql postgresql-contrib
        sudo systemctl enable postgresql.service
        sudo systemctl start postgresql.service
        echo "Postgres ha sido instalado exitosamente"
        return 0
    fi
}

desinstalar_postgres() {
    echo "Verificando si postgres está instalado..."
    if ! which psql >/dev/null 2>&1; then
        echo "Postgres no está instalado en el sistema"
        return 1
    else
        read -p "¿Está seguro de que desea desinstalar Postgres? (s/n): " confirm
        if [[ $confirm == [sS] ]]; then
            echo "Deteniendo servicios de postgres..."
            sudo systemctl stop postgresql.service
            echo "Desinstalando postgres..."
            sudo apt-get -y remove postgresql postgresql-contrib
            sudo apt-get -y purge postgresql*
            sudo rm -rf /etc/postgresql/
            sudo rm -rf /var/lib/postgresql/
            sudo userdel -r postgres
            sudo groupdel postgres
            echo "Postgres ha sido desinstalado completamente"
            return 0
        else
            echo "Operación cancelada"
            return 1
        fi
    fi
}

crear_respaldo() {
    if [ $# -eq 0 ]; then
        echo "Error: Debe especificar el nombre de la base de datos"
        return 1
    fi

    if ! which psql >/dev/null 2>&1; then
        echo "Error: Postgres no está instalado"
        return 1
    fi

    database=$1
    fecha=$(date +"%Y%m%d_%H%M%S")
    backup_dir="$HOME/postgres_backups"
    filename="${database}_${fecha}.sql"

    # Crear directorio de backups si no existe
    mkdir -p $backup_dir

    echo "Verificando si la base de datos existe..."
    if ! sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw $database; then
        echo "Error: La base de datos $database no existe"
        return 1
    fi

    echo "Creando respaldo de la base de datos $database..."
    if sudo -u postgres pg_dump $database > "$backup_dir/$filename"; then
        echo "Respaldo creado exitosamente en: $backup_dir/$filename"
        return 0
    else
        echo "Error al crear el respaldo"
        return 1
    fi
}

restaurar_respaldo() {
    if [ $# -eq 0 ]; then
        echo "Error: Debe especificar el nombre de la base de datos"
        return 1
    fi

    if ! which psql >/dev/null 2>&1; then
        echo "Error: Postgres no está instalado"
        return 1
    fi

    database=$1
    backup_dir="$HOME/postgres_backups"

    # Verificar si existen backups
    if [ ! -d "$backup_dir" ] || [ -z "$(ls -A $backup_dir)" ]; then
        echo "No se encontraron archivos de respaldo"
        return 1
    fi

    # Listar backups disponibles
    echo "Backups disponibles:"
    ls -1 $backup_dir
    
    read -p "Ingrese el nombre del archivo de respaldo a restaurar: " backup_file

    if [ ! -f "$backup_dir/$backup_file" ]; then
        echo "Error: El archivo de respaldo no existe"
        return 1
    fi

    # Verificar si la base de datos existe
    if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw $database; then
        read -p "La base de datos $database ya existe. ¿Desea eliminarla y restaurar? (s/n): " confirm
        if [[ $confirm == [sS] ]]; then
            echo "Eliminando base de datos existente..."
            sudo -u postgres dropdb $database
        else
            echo "Operación cancelada"
            return 1
        fi
    fi

    echo "Creando nueva base de datos..."
    sudo -u postgres createdb $database

    echo "Restaurando backup..."
    if sudo -u postgres psql $database < "$backup_dir/$backup_file"; then
        echo "Base de datos restaurada exitosamente"
        return 0
    else
        echo "Error al restaurar la base de datos"
        return 1
    fi
}

# Interfaz

option=0

while :; do
    clear
    echo "_________________________________________"
    echo "PGUTIL - Programa de Utilidad de Postgres"
    echo "_________________________________________"
    echo "             MENU PRINCIPAL              "
    echo "_________________________________________"
    echo "1. Instalar Postgres"
    echo "2. Desinstalar Postgres"
    echo "3. Crear un respaldo"
    echo "4. Restaurar respaldo"
    echo "5. Salir"

    read -n1 -p "Ingrese una opcion [1-5]: " option

    echo -e "\n\n"

    case $option in
    1)
        instalar_postgres
        read -n1 -p "Presione cualquier tecla para continuar..."
        ;;
    2)
        desinstalar_postgres
        read -n1 -p "Presione cualquier tecla para continuar..."
        ;;
    3)
        read -p "Ingrese el nombre de la base de datos para respaldar: " db_name
        crear_respaldo "$db_name"
        read -n1 -p "Presione cualquier tecla para continuar..."
        ;;
    4)
        read -p "Ingrese el nombre de la base de datos para restaurar: " db_name
        restaurar_respaldo "$db_name"
        read -n1 -p "Presione cualquier tecla para continuar..."
        ;;
    5)
        echo "Programa finalizado"
        exit 0
        ;;
    esac
done
