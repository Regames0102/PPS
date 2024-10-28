#!/bin/bash
read -p "Introduce la altura en cm de la primera persona: " altura1
read -p "Introduce la altura en cm de la segunda persona: " altura2
read -p "Introduce la altura en cm de la tercera persona: " altura3

# Convertir alturas a metros
max_altura=$((altura1 > altura2 ? (altura1 > altura3 ? altura1 : altura3) : (altura2 > altura3 ? altura2 : altura3)))
echo "La mayor altura es: $(bc <<< "scale=2; $max_altura/100") metros."
