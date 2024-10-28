#!/bin/bash
read -p "Introduce un número: " numero

# Verificar si es un número
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
    echo "Error: Debes introducir un número válido."
    exit 1
fi

# Comprobación de múltiplo de 10
if (( numero % 10 == 0 )); then
    echo "$numero es múltiplo de 10."
else
    echo "$numero no es múltiplo de 10."
fi
