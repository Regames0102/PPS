#!/bin/bash
if [ -z "$1" ]; then
    echo "Debes especificar un directorio."
    exit 1
fi

# Verifica si el directorio existe
if [ ! -d "$1" ]; then
    echo "El directorio no existe."
    exit 1
fi

# Nombre del archivo de copia
fecha=$(date +%d%m%Y)
archivo="copia_scripts_${fecha}.tar"

# Crear paquete
tar -cvf "$archivo" "$1"/*.sh
echo "Copia creada: $archivo"
