#!/bin/bash

# Función para generar el menú
menu() {
    echo "1.- EJECUTAR COPIA DE SEGURIDAD"
    echo "2.- DAR DE ALTA USUARIO"
    echo "3.- DAR DE BAJA AL USUARIO"
    echo "4.- MOSTRAR USUARIOS"
    echo "5.- MOSTRAR LOG DEL SISTEMA"
    echo "6.- SALIR"
}

# Función para realizar una copia de seguridad
copia() {
    local fecha=$(date +"%d%m%Y_%H-%M-%S")
    local nombre_copia="copia_usuarios_${fecha}.zip"
    zip "$nombre_copia" usuarios.csv > /dev/null
    echo "Copia de seguridad creada: $nombre_copia"

    # Mantener solo las dos copias más recientes
    if [ $(ls copia_usuarios_*.zip | wc -l) -gt 2 ]; then
        ls -t copia_usuarios_*.zip | tail -n +3 | xargs rm
        echo "Copias de seguridad antiguas eliminadas"
    fi

    echo "COPIA REALIZADA el $(date +"%d/%m/%Y %H:%M:%S")" >> log.log
}

# Función para dar de alta a un usuario
copia() {
    local fecha=$(date +"%d%m%Y_%H-%M-%S")
    local nombre_copia="copia_usuarios_${fecha}.zip"

    # Crear la copia de seguridad en un archivo .zip
    zip "$nombre_copia" usuarios.csv > /dev/null
    echo "Copia de seguridad creada: $nombre_copia"

    # Verificar si hay más de dos archivos de copia de seguridad
    if [ $(ls copia_usuarios_*.zip 2> /dev/null | wc -l) -gt 2 ]; then
        # Si existen más de dos copias, elimina las más antiguas
        ls -t copia_usuarios_*.zip | tail -n +3 | xargs rm
        echo "Copias de seguridad antiguas eliminadas"
    fi

    # Agregar registro al log
    echo "COPIA REALIZADA el $(date +"%d/%m/%Y %H:%M:%S")" >> log.log
}
alta() {
    read -p "Nombre: " nombre
    read -p "Primer apellido: " apellido1
    read -p "Segundo apellido: " apellido2
    read -p "DNI (8 dígitos y una letra): " dni

    # Generar nombre de usuario
    username=$(echo "${nombre:0:1}${apellido1:0:3}${apellido2:0:3}${dni: -3}" | tr '[:upper:]' '[:lower:]')

    # Verificar si el usuario ya existe
    if grep -q ":$username$" usuarios.csv; then
        echo "El usuario ya existe."
    else
        echo "$nombre:$apellido1:$apellido2:$dni:$username" >> usuarios.csv
        echo "Usuario añadido: $username"
        echo "INSERTADO $nombre:$apellido1:$apellido2:$dni:$username el $(date +"%d/%m/%Y %H:%M:%S")" >> log.log
    fi
}

# Función para dar de baja a un usuario
baja() {
    read -p "Nombre de usuario a eliminar: " username
    if grep -q ":$username$" usuarios.csv; then
        grep -v ":$username$" usuarios.csv > tmpfile && mv tmpfile usuarios.csv
        echo "Usuario eliminado: $username"
        echo "BORRADO $username el $(date +"%d/%m/%Y %H:%M:%S")" >> log.log
    else
        echo "Usuario no encontrado."
    fi
}

# Función para mostrar los usuarios
mostrar_usuarios() {
    echo "Usuarios en el sistema:"
    cut -d: -f5 usuarios.csv | sort
}

# Función para mostrar el log del sistema
mostrar_log() {
    cat log.log
}

# Función para la pantalla de login
login() {
    for i in {1..3}; do
        read -sp "Ingrese su nombre de usuario: " username
        echo

        # Permitir acceso a "admin" o verificar existencia en usuarios.csv
        if [ "$username" == "admin" ] || grep -q ":$username$" usuarios.csv; then
            echo "Acceso concedido. Bienvenido, $username!"
            return 0
        else
            echo "Usuario no válido. Intento $i de 3."
        fi
    done
    echo "Demasiados intentos fallidos. Saliendo..."
    exit 1
}

# Inicio del script
login
while true; do
    menu
    read -p "Seleccione una opción: " opcion
    case $opcion in
        1) copia ;;
        2) alta ;;
        3) baja ;;
        4) mostrar_usuarios ;;
        5) mostrar_log ;;
        6) exit ;;
        *) echo "Opción no válida" ;;
    esac
done

