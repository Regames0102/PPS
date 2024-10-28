#!/bin/bash
if [ -z "$1" ]; then
    echo "Debes especificar un directorio."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "El parámetro debe ser un directorio existente."
    exit 1
fi

# Contar solo archivos
contador=$(find "$1" -maxdepth 1 -type f | wc -l)
if (( contador > 10 )); then
    echo "Hay más de 10 archivos en el directorio."
else
    echo "Hay 10 o menos archivos en el directorio."
fi
