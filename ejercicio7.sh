#!/bin/bash

# Comprueba si se ha pasado al menos un parámetro.
if [ $# -lt 1 ]; then
    echo "Debes proporcionar la ruta a un archivo o directorio."
    exit 1
fi

# Comprueba si el archivo o directorio existe y qué tipo es.
if [ -e "$1" ]; then
    if [ -f "$1" ]; then
        echo "Es un archivo."
    elif [ -d "$1" ]; then
        echo "Es un directorio."
    fi
else
    echo "El archivo o directorio no existe."
fi
