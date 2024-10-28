#!/bin/bash
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

# Asegurarse de que num1 sea menor que num2
if (( num1 > num2 )); then
    temp=$num1
    num1=$num2
    num2=$temp
fi

# Sumar el rango
suma=0
for ((i = num1; i <= num2; i++)); do
    suma=$((suma + i))
done

echo "La suma del rango es: $suma"
