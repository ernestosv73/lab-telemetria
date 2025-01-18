#!/bin/bash

# Obtener una lista de todas las interfaces de red activas (excepto loopback)
interfaces=$(ls /sys/class/net | grep -v lo)

# Deshabilitar la aceptación de mensajes RA en cada interfaz
for iface in $interfaces; do
    sysctl -w net.ipv6.conf.$iface.accept_ra=0
done
