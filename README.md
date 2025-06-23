# 🔍 Escáner y Spoofer de Red LAN - JossueGallardo

Herramientas en Bash diseñadas para auditorías de red y análisis de seguridad en entornos controlados.

Este repositorio contiene:

- 🛰️ Un **escáner de red LAN** interactivo con Nmap, con detección automática de red y opciones de análisis rápido, extendido, individual y de vulnerabilidades.
- 🎭 Un **spoofing ARP** directo contra un host (DoS), útil para simular ataques MITM en pruebas de laboratorio.

> ⚠️ **Uso exclusivo para propósitos educativos y con autorización previa.**
> Ejecutar estas herramientas en redes no autorizadas **es ilegal**.

---

## 📁 Contenido del Repositorio

| Archivo           | Descripción                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `escanear_red.sh`| Escáner interactivo de red LAN usando `nmap`.                              |
| `spoof.sh`       | Script básico para ataque de ARP spoofing (tipo DoS) usando `arpspoof`.     |
| `README.md`      | Este archivo.                                                              |

---

## ⚙️ Requisitos

Asegúrate de tener instalados los siguientes paquetes:

- [`nmap`](https://nmap.org) — para escanear dispositivos en la red.
- [`dsniff`](https://linux.die.net/man/8/arpspoof) — para ejecutar `arpspoof`.
- Distribución GNU/Linux basada en Debian (como Kali Linux).
- Permisos de **superusuario** (`root` o `sudo`).

Instalación rápida:

```bash
sudo apt update
sudo apt install nmap dsniff
