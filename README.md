# Laboratorio: Emuladores y Virtualización (Unidad 5)
**Estudiante:** Cely Urbina William Camilo Igor
**Carrera:** Ingeniería de Sistemas  
**Materia:** Arquitectura de Computadores  
**Fecha:** 2026

## 1. Descripción del Laboratorio
Este repositorio contiene el desarrollo de dos fases técnicas enfocadas en el manejo de entornos emulados y virtualizados:
1. **Configuración de DOSBox:** Creación de un entorno de desarrollo para lenguaje ensamblador x86[cite: 1].
2. **Gestión de VirtualBox:** Instalación y administración de Alpine Linux, manejo de redes y snapshots[cite: 2].

---

## 2. Entorno de Trabajo
- **DOSBox:** Versión 0.74-3[cite: 1].
- **VirtualBox:** Versión 7.x[cite: 2].
- **Sistema Operativo Guest:** Alpine Linux 3.19 Standard[cite: 2].
- **Ensamblador:** NASM v2.x para DOS[cite: 1].
- **Control de Versiones:** Git y GitHub.

---

## 3. Fase 1: DOSBox y Ensamblador x86

### Checkpoints de la Fase 1
*   **Checkpoint 1: Estructura de Directorios**  
    Se creó la estructura con carpetas `src/`, `bin/` y `capturas/` para organizar el proyecto[cite: 1].  
    ![Estructura](capturas/cp1_estructura.png)

*   **Checkpoint 2: Configuración de DOSBox y NASM**  
    Uso de `dosbox.conf` personalizado para montar automáticamente la unidad C: y verificación de NASM con `nasm -v`[cite: 1].  
    ![DOSBox Config](capturas/cp2_dosbox_nasm.png)

*   **Checkpoint 3: Ejecución de saludo.com**  
    Programa en ensamblador que utiliza la interrupción `INT 21h` función `09h` para mostrar texto[cite: 1].  
    ![Saludo](capturas/cp3_saludo.png)

*   **Checkpoint 4: Programa de Entrada y Eco Hexadecimal**  
    Uso de la función `07h` para lectura de teclado y subrutinas para convertir caracteres a hexadecimal[cite: 1].  
    ![Entrada](capturas/cp4_entrada_hex.png)

*   **Checkpoint 5: Depuración con DEBUG**  
    Sesión de depuración mostrando el desensamblado (`-u`) y el ciclo de instrucción paso a paso (`-t`)[cite: 1].  
    ![DEBUG](capturas/cp5_debug_sesion.png)

---

## 4. Fase 2: Virtualización con Alpine Linux

### Comparativa de Modos de Red[cite: 2]
| Modo de Red | Dirección IP Obtenida | Acceso a Internet | Comunicación con Anfitrión |
| :--- | :--- | :--- | :--- |
| **NAT** | 10.0.2.15 | Sí | Limitada (vía Gateway) |
| **Host-Only** | 192.168.56.x | No | Sí (Ping bidireccional) |

### Gestión de Snapshots[cite: 2]
Se gestionaron los siguientes estados de la máquina virtual:
1. **snap base:** Sistema Alpine recién instalado[cite: 2].
2. **snap con herramientas:** Sistema con `curl`, `wget`, `nano` y `htop` instalados mediante `apk add`[cite: 2].

### Checkpoints de la Fase 2
*   **Checkpoint 1:** Configuración de la VM Lab5-Alpine (1GB RAM, 10GB Disco)[cite: 2].
*   **Checkpoint 2:** Alpine Linux instalado y prueba de `ping 8.8.8.8` exitosa[cite: 2].
*   **Checkpoint 3:** Capturas de `ip addr` mostrando el cambio entre NAT y Host-Only[cite: 2].
*   **Checkpoint 4:** Árbol de snapshots verificado con `VBoxManage snapshot list`[cite: 2].
*   **Checkpoint 5:** Exportación exitosa del archivo `Lab5-Alpine-export.ova`[cite: 2].

---

## 5. Conclusiones Técnicas
*   **Sobre el ciclo de instrucción:** El uso de DEBUG permitió observar físicamente cómo los registros AX y DX cambian de estado antes de ejecutar una interrupción de software como `INT 21h`[cite: 1].
*   **Sobre la virtualización:** Los snapshots son herramientas críticas en ingeniería, ya que permiten realizar pruebas destructivas (como instalar software experimental) y revertir el sistema a un estado estable en segundos[cite: 2].
*   **Sobre la red:** Se comprendió que el modo Bridge es el más transparente para servicios externos, mientras que Host-Only es ideal para entornos de laboratorio aislados y seguros[cite: 2].
