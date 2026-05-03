#!/bin/bash
# Laboratorio: VirtualBox - Creación y Gestión de Máquinas Virtuales
# Estudiante: Cely Urbina William Camilo Igor
# Unidad 5: Arquitectura de Computadores

# --- PASO 1: Creación y Configuración de la VM ---
# Crear la VM y registrarla en VirtualBox
VBoxManage createvm --name "Lab5-Alpine" --ostype "Linux_64" --register

# Configurar hardware básico: 1GB RAM, 1 CPU y red NAT
VBoxManage modifyvm "Lab5-Alpine" --memory 1024 --cpus 1 --nic1 nat[cite: 2]

# Crear el disco duro virtual de 10GB (Formato VDI)[cite: 2]
VBoxManage createmedium disk --filename "Lab5-Alpine.vdi" --size 10240 --format VDI[cite: 2]

# Conectar el disco y la ISO de Alpine Linux[cite: 2]
VBoxManage storagectl "Lab5-Alpine" --name "SATA" --add sata[cite: 2]
VBoxManage storageattach "Lab5-Alpine" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "Lab5-Alpine.vdi"[cite: 2]
VBoxManage storagectl "Lab5-Alpine" --name "IDE" --add ide[cite: 2]
VBoxManage storageattach "Lab5-Alpine" --storagectl "IDE" --port 0 --device 0 --type dvddrive --medium "alpine-standard-3.19.0-x86_64.iso"[cite: 2]

# --- PASO 3: Gestión de Red ---
# Cambiar a modo Host-Only (requiere tener una interfaz vboxnet creada)[cite: 2]
# VBoxManage modifyvm "Lab5-Alpine" --nic1 hostonly --hostonlyadapter1 "vboxnet0"[cite: 2]

# Volver a modo NAT para tener internet[cite: 2]
# VBoxManage modifyvm "Lab5-Alpine" --nic1 nat[cite: 2]

# --- PASO 4: Gestión de Snapshots ---
# Tomar snapshot del estado base[cite: 2]
VBoxManage snapshot "Lab5-Alpine" take "snap base" --description "Alpine Linux 3.19 recién instalado"[cite: 2]

# Tomar snapshot con herramientas instaladas (curl, htop, etc.)[cite: 2]
VBoxManage snapshot "Lab5-Alpine" take "snap con herramientas" --description "Alpine con herramientas adicionales"[cite: 2]

# Listar los snapshots creados[cite: 2]
VBoxManage snapshot "Lab5-Alpine" list[cite: 2]

# Restaurar al estado base[cite: 2]
# VBoxManage snapshot "Lab5-Alpine" restore "snap base"[cite: 2]

# --- PASO 5: Exportación ---
# Exportar la VM completa a formato OVA[cite: 2]
VBoxManage export "Lab5-Alpine" --output "Lab5-Alpine-export.ova" --manifest[cite: 2]