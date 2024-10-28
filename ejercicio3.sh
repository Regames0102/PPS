#!/bin/bash

# Comprueba si se han pasado dos parámetros.
if [ $# -ne 2 ]; then
    echo "Debes pasar exactamente dos parámetros."
    exit 1
fi

# Crea el directorio y copia el archivo en él.
mkdir -p "$1"
cp "$2" "$1" && echo "Archivo copiado exitosamente."
