#!/bin/bash

# Comprueba si hay al menos dos parámetros.
if [ $# -lt 2 ]; then
    echo "Debes pasar al menos dos parámetros."
    exit 1
fi

# Crea el directorio y copia el archivo en él.
mkdir -p "$1"
cp "$2" "$1" && echo "Archivo copiado exitosamente."
