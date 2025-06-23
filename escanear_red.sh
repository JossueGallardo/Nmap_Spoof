#!/bin/bash

# ============================
# Escáner de red LAN con Nmap
# Creado por JossueGallardo
# ============================

# ─── Auto-sudo si no somos root (Mejora 3) ───
[ "$EUID" -ne 0 ] && exec sudo "$0" "$@"

# Cabecera decorativa
print_header() {
    clear
    echo ""
    echo -e "\e[36m==============================="
    echo -e "   ESCÁNER DE RED LOCAL - JG"
    echo -e "===============================\e[0m"
    echo ""
    echo "Creado por JossueGallardo"
    echo ""
}

# Verificar si nmap está instalado
if ! command -v nmap &> /dev/null; then
    echo "Error: nmap no está instalado. Instálalo con: sudo apt install nmap"
    exit 1
fi

# Detectar interfaz activa con salida
INTERFAZ=$(ip route get 1.1.1.1 | awk '{print $5; exit}')

# ─── Detección de máscara/CIDR real (Mejora 1) ───
CIDR=$(ip -o -f inet addr show "$INTERFAZ" | awk '{print $4}') # ej. 192.168.18.34/22
IP_LOCAL=${CIDR%/*}

if [ -z "$IP_LOCAL" ]; then
    echo "No se pudo obtener la IP local. Verifica tu conexión."
    exit 1
fi

# Función para volver o salir
volver_o_salir() {
    echo ""
    read -p "¿Deseas volver al menú? (s/N): " OPC
    [[ "$OPC" =~ ^[Ss]$ ]] || { echo -e "\nSaliendo...\n"; exit 0; }
}

# Bucle principal
while true; do
    print_header

    echo -e "\e[34mInterfaz detectada:\e[0m $INTERFAZ"
    echo -e "\e[34mIP local:\e[0m $IP_LOCAL"
    echo -e "\e[34mRango de red:\e[0m $CIDR"
    echo ""

    echo "Selecciona el tipo de escaneo:"
    echo "1) Escaneo rápido (solo IPs activas)"
    echo "2) Escaneo extendido (puertos, OS, servicios)"
    echo "3) Escaneo individual a una IP"
    echo "4) Escaneo de vulnerabilidades en un host"
    read -p "Opción [1/2/3/4]: " OPCION
    echo ""

    [[ "$OPCION" =~ ^[1-4]$ ]] || { echo "Opción no válida. Saliendo."; exit 1; }

    echo -n "Escaneando"
    for i in {1..3}; do echo -n "."; sleep 0.5; done
    echo -e "\n"

    case $OPCION in
        1)
            SALIDA=$(nmap -sn "$CIDR")
            HOSTS=$(echo "$SALIDA" | grep -E "Nmap scan report for|MAC Address" | awk '!a[$0]++')
            COUNT=0
            while read -r LINE; do
                if [[ $LINE == Nmap\ scan* ]]; then
                    COUNT=$((COUNT + 1))
                    echo -e "\e[32m$COUNT. $LINE\e[0m"
                else
                    echo "$LINE"; echo "---------------------"
                fi
            done <<< "$HOSTS"
            echo -e "\n\e[33mTotal de dispositivos detectados:\e[0m $COUNT"
            volver_o_salir
            ;;
        2)
            echo -e "\e[33mModo extendido activado...\e[0m\n"
            nmap -A "$CIDR"
            volver_o_salir
            ;;
        3)
            read -p "Ingresa la IP objetivo: " IP_OBJ
            echo -e "\e[33mEscaneando $IP_OBJ en modo extendido...\e[0m\n"
            nmap -A "$IP_OBJ"
            volver_o_salir
            ;;
        4)
            read -p "Ingresa la IP del host a analizar vulnerabilidades: " IP_OBJ
            echo -e "\e[31mEjecutando scripts de vulnerabilidad sobre $IP_OBJ...\e[0m\n"
            nmap --script vuln "$IP_OBJ"
            volver_o_salir
            ;;
    esac
done

