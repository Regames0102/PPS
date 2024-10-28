#!/bin/bash
read -p "Introduce tu año de nacimiento (4 dígitos): " anio

# Calcular el signo
signo=$((anio % 12))
case $signo in
    0) animal="Rata" ;;
    1) animal="Buey" ;;
    2) animal="Tigre" ;;
    3) animal="Conejo" ;;
    4) animal="Dragón" ;;
    5) animal="Serpiente" ;;
    6) animal="Caballo" ;;
    7) animal="Cabra" ;;
    8) animal="Mono" ;;
    9) animal="Gallo" ;;
    10) animal="Perro" ;;
    11) animal="Cerdo" ;;
esac

echo "Tu signo del horóscopo chino es el $animal."

