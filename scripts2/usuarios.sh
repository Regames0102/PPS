#!/bin/bash
while true; do
    read -p "Introduce el nombre de usuario: " usuario

    # Verifica si el usuario existe
    if id "$usuario" &>/dev/null; then
        echo "Nombre: $usuario"
        echo "UID: $(id -u $usuario)"
        echo "GID: $(id -g $usuario)"
        echo "Directorio de trabajo: $(eval echo ~$usuario)"
    else
        echo "El usuario no existe."
    fi

    read -p "¿Quieres consultar otro usuario? (s/n): " respuesta
    if [[ "$respuesta" != "s" ]]; then
        break
    fi
done
