# 🔍 Escáner y Spoofer de Red LAN – JossueGallardo

Herramientas en **Bash** diseñadas para auditorías de red y análisis de seguridad en entornos controlados.

Este repositorio contiene:

- 🛰️ **Escáner de red LAN** interactivo (basado en **Nmap**) con modos de análisis rápido, extendido, individual y de vulnerabilidades.  
- 🎭 **Spoofing ARP** unidireccional (DoS) contra un host, ideal para simular ataques MITM en laboratorio.

> ⚠️ **Uso exclusivo con fines educativos.**  

---

## 📁 Contenido del Repositorio

| Archivo           | Descripción                                                                      |
|-------------------|----------------------------------------------------------------------------------|
| `escanear_red.sh` | Escáner interactivo de red LAN usando `nmap`.                                    |
| `spoof.sh`        | Script básico para ataque ARP spoofing (DoS) usando `arpspoof`.                  |
| `README.md`       | Este archivo.                                                                    |

---

## ⚙️ Requisitos

- [`nmap`](https://nmap.org) — para escanear dispositivos.  
- [`dsniff`](https://linux.die.net/man/8/arpspoof) — incluye `arpspoof` para ataques ARP.  
- Distribución GNU/Linux basada en Debian (p. ej. **Kali Linux**).  
- Permisos de **superusuario** (`root` o `sudo`).

Instalación rápida:

    sudo apt update
    sudo apt install nmap dsniff

---

## 🧪 Uso

### 🔢 1. Escáner de Red

Ejecuta el script:

    sudo bash escanear_red.sh

**Opciones disponibles**

    1) Escaneo rápido (solo IPs activas)
    2) Escaneo extendido (puertos, SO y servicios)
    3) Escaneo individual a una IP
    4) Escaneo de vulnerabilidades en un host

**El script detecta:**

- La **interfaz de red** activa.  
- La **IP local** y la **máscara** (CIDR).  
- El **rango completo** o la **IP puntual** según el modo seleccionado.  
- Permite **volver al menú** o **salir** tras cada escaneo.

---

### 💥 2. Ataque ARP Spoofing (DoS)

Ejecuta el script:

    sudo bash spoof.sh

El script te pedirá:

- ✅ **Interfaz de red** (p. ej. `eth0`, `wlan0`).  
- ✅ **IP del dispositivo objetivo**.

Luego:

- 🧠 Detecta automáticamente la **gateway** y realiza un **spoofing ARP unidireccional**, haciéndose pasar por el router ante el objetivo.  
- ✂️ Esto provoca **pérdida de conectividad (DoS)** en la víctima.  
- ❗ No implementa spoof bidireccional (MITM completo); es una **denegación básica de servicio** para demostraciones.

---

## 🛡️ Advertencia Legal

Estas herramientas fueron creadas **solo con fines educativos** y deben usarse **únicamente** en redes propias o en entornos con autorización explícita.

🚫 **Prohibido** su uso en redes ajenas sin consentimiento.
