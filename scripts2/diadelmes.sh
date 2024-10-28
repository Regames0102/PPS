#!/bin/bash
mes=$(date +%B)
dias=$(date +%d -d "$(date +%Y-%m-01) +1 month -1 day")

echo "Estamos en $mes, un mes con $dias días."
