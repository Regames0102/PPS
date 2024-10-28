#!/bin/bash

# Comprueba si hay al menos dos parámetros.
if [ $# -lt 2 ]; then
    echo "Debes pasar al menos dos parámetros."
    exit 1
fi

# Muestra el contenido del archivo y guarda el exit code.
cat "$2"
exit_code=$?

# Muestra el código de salida.
echo "El exit code de 'cat' es: $exit_code"
