#!/bin/bash
read -p "Introduce tu edad (entre 15 y 60 años): " edad

# Obtener año actual
anio_actual=$(date +%Y)
nacimiento=$((anio_actual - edad))

# Calcular la década
decada=$(( (nacimiento / 10) * 10 ))
echo "Si naciste en $nacimiento, naciste en la década de $decada."

