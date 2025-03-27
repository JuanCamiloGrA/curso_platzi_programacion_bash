# !/bin/sh
# Description: Programa para ejemplificar la forma de transferir archivos por la red utilizando el comando rsync y las opciones de empaquetamiento para optimizar la velocidad de transferencia.
# Author: JC - @JuanCamiloGrA
# Date: 2025-03-26

echo "Empaquetar todos los archivos de la carpeta actual y transferirlos a otro equipo por la red"

read -p "Introduce la dirección IP del equipo remoto (usa 'localhost' si es al Windows host): " ip
read -p "Introduce el nombre de usuario del equipo remoto (ignorado si IP es 'localhost' en WSL): " user

# Crear un archivo ZIP con los archivos de la carpeta actual
timestamp=$(date +%Y%m%d_%H%M%S)
zip_file="backup_$timestamp.zip"
echo "Comprimiendo archivos en $zip_file..."
zip -r "$zip_file" . -x "$zip_file"

# Variable para el comando rsync
rsync_command=""
transfer_message=""

# Detectar si estamos en WSL
if grep -qE "(Microsoft|WSL)" /proc/version; then
    echo "WSL detectado."
    # Estamos en WSL
    if [ "$ip" = "localhost" ]; then
        # Si es localhost, usamos la ruta directa al Windows host
        echo "Configurando transferencia a Windows host..."
        windows_username=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
        if [ -z "$windows_username" ]; then
            echo "Error: No se pudo obtener el nombre de usuario de Windows."
            exit 1
        fi
        dest_path="/mnt/c/Users/$windows_username/Downloads/"
        # Asegurarse de que el directorio de destino exista
        mkdir -p "$dest_path"
        transfer_message="Transfiriendo archivo ZIP al Windows host ($dest_path)..."
        rsync_command="rsync -avz --progress \"$zip_file\" \"$dest_path\""
    else
        # Si es otro equipo remoto
        echo "Configurando transferencia a equipo remoto..."
        dest_path="/home/$user/backup/"
        transfer_message="Transfiriendo archivo ZIP al equipo remoto ($user@$ip:$dest_path)..."
        rsync_command="rsync -avz --progress \"$zip_file\" \"$user@$ip:$dest_path\""
    fi
else
    # No estamos en WSL
    echo "WSL no detectado. Configurando transferencia remota estándar..."
    os=$(uname -s)
    if [ "$os" = "Linux" ] || [ "$os" = "Darwin" ]; then
        dest_path="/home/$user/backup/"
    elif [ "$os" = "CYGWIN" ] || [ "$os" = "MINGW" ] || [ "$os" = "MSYS" ]; then
        # Asumiendo que el usuario Windows es el mismo que el remoto para este caso
        dest_path="/c/Users/$user/backup/"
    else
        echo "Sistema operativo no soportado: $os"
        exit 1
    fi
    transfer_message="Transfiriendo archivo ZIP al equipo remoto ($user@$ip:$dest_path)..."
    rsync_command="rsync -avz --progress \"$zip_file\" \"$user@$ip:$dest_path\""
fi

# Ejecutar el comando rsync
if [ -n "$rsync_command" ]; then
    echo "$transfer_message"
    # Asegurarse de que el directorio de destino exista en el equipo remoto si no es localhost
    if [ "$ip" != "localhost" ]; then
        ssh "$user@$ip" "mkdir -p $dest_path" 2>/dev/null
    fi
    eval $rsync_command
    exit_status=$?
else
    echo "Error: No se pudo determinar el comando rsync a ejecutar."
    exit 1
fi

# Verificar el resultado
if [ $exit_status -eq 0 ]; then
    echo "Transferencia del archivo ZIP completada con éxito."
else
    echo "Error en la transferencia del archivo ZIP (código de salida: $exit_status)."
fi

# Preguntar si se desea eliminar el archivo ZIP local
read -p "¿Desea eliminar el archivo ZIP local? (s/N): " delete_zip
if [ "$delete_zip" = "s" ] || [ "$delete_zip" = "S" ]; then
    rm -f "$zip_file"
    echo "Archivo ZIP local eliminado."
else
    echo "Archivo ZIP local conservado: $zip_file"
fi