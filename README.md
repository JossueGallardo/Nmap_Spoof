# 🔍 Escáner y Spoofer de Red LAN - JossueGallardo

Herramientas en Bash diseñadas para entornos de **auditoría de red** y **análisis de seguridad** local. Este proyecto incluye:

- Un **escáner de red LAN** interactivo basado en `nmap`, con opciones de análisis rápido, extendido, individual y de vulnerabilidades.
- Un script de **ARP spoofing** dirigido, útil en pruebas de ataques MITM (Man-in-the-Middle).

> ⚠️ **Uso exclusivo para propósitos educativos y auditoría con autorización previa.**

---

## 📁 Contenido del Repositorio

| Archivo         | Descripción                                                                 |
|----------------|------------------------------------------------------------------------------|
| `escaneo.sh`   | Escáner interactivo de red LAN usando Nmap.                                 |
| `spoof.sh`     | Script básico para ARP spoofing contra un host, usando `arpspoof`.           |
| `README.md`    | Este archivo.                                                                |

---

## ⚙️ Requisitos

Asegúrate de tener instalados los siguientes paquetes:

- `nmap` – para escanear dispositivos en la red.
- `dsniff` – para el uso de `arpspoof`.
- Distribución basada en GNU/Linux (probado en Kali Linux y Debian-based).
- Permisos de **superusuario (root)**.

Instalación rápida:

```bash
sudo apt update
sudo apt install nmap dsniff

## 🧪 Uso

### 1. Escáner de Red

Ejecuta el script:

```bash
sudo bash escanear_red.sh

