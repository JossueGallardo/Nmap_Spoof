# 🔍 Escáner y Spoofer de Red LAN – JossueGallardo

Herramientas **Bash** para auditorías de red y pruebas de seguridad en entornos controlados.

| Herramienta | Descripción |
|-------------|-------------|
| 🛰️ **LAN Scanner** | Interactivo (Nmap). Detecta interfaz, IP local/máscara y ofrece 4 modos: rápido, extendido, individual y *vuln-scan*. |
| 🎭 **ARP Spoofer (DoS)** | Envenenamiento unidireccional de caché ARP mediante `arpspoof`; provoca pérdida de conectividad de la víctima. |

> ⚠️ **Uso exclusivamente educativo.**

---

## 📁 Estructura

| Archivo            | Descripción                              |
|--------------------|------------------------------------------|
| `escanear_red.sh`  | Escáner interactivo de red LAN.          |
| `spoof.sh`         | Ataque ARP spoofing (DoS).               |
| `README.md`        | Este documento.                          |

---

## ⚙️ Dependencias

| Paquete   | Motivo                                 |
|-----------|----------------------------------------|
| `nmap`    | Escaneo de hosts y puertos             |
| `dsniff`  | Incluye `arpspoof`                     |
| `iproute2`| Comandos `ip route` / `ip addr`        |
| `awk`     | Filtros de texto                       |
| `bash ≥4` | Arrays y mejoras de sintaxis           |

### Instalación rápida

```bash
# Clonar repositorio
git clone https://github.com/JossueGallardo/Nmap_Spoof.git
```

```bash
# Instalar dependencias (Debian/Kali)
sudo apt update
```

```bash
# Instalar dependencias (Debian/Kali)
sudo apt install nmap dsniff iproute2 gawk
```

```bash
# Dar permisos de ejecución
chmod +x escanear_red.sh spoof.sh
```

## 🧪 Uso

### 1️⃣ Escáner de Red

```bash
sudo bash escanear_red.sh
```

| Opción | Descripción                           | Flags Nmap           |
|-------:|---------------------------------------|----------------------|
| 1      | Rápido — solo IPs activas             | `-sn`                |
| 2      | Extend. — puertos/SO/servicios        | `-A`                 |
| 3      | Host único extendido                  | `-A <IP>`            |
| 4      | Scripts de vulnerabilidad             | `--script vuln <IP>` |

---

### 2️⃣ ARP Spoofing (DoS)

```bash
sudo bash spoof.sh
```

**Pasos interactivos**

1. Introducir la **interfaz** (`eth0`, `wlan0`, …).  
2. Introducir la **IP objetivo**.  
3. El script detecta automáticamente la puerta de enlace y ejecuta:

```bash
arpspoof -i <iface> -t <victima> <gateway>
```

> Nota: se valida el formato de IP y, si falta `dsniff`, el script aborta con un mensaje claro.

---

## 🛡️ Advertencia Legal

Estas herramientas se proporcionan **solo con fines educativos** y deben usarse **exclusivamente** en redes propias o con permiso expreso.  
**No me hago responsable** del uso indebido.

