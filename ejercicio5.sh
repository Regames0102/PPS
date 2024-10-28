#!/bin/bash

# Comprueba si no hay parámetros.
if [ $# -eq 0 ]; then
    echo "No has introducido ningún parámetro."
    exit 1
else
    echo "Has introducido $# parámetro(s)."
    echo "Los parámetros son: $@"
    exit 0
fi
