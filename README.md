Titulo: Laboratorio Telemetría de Redes basada en gNMI con Containerlab

Descarga del laboratorio

Opción 1: Importar repositorio
1. Clic en el botón + de la pantalla principal de Github
2. Seleccionar Import repository
3. En el campo de texto: "The URL for your source repository" pegar la URL: https://github.com/ernestosv73/lab-telemetria.git
4. Asignar nombre al nuevo repositorio
5. Clic en Begin import

Opción 2: Crear un fork
1. Desde el repositorio https://github.com/ernestosv73/lab-telemetria, hacer clic en la lista desplegable Fork
2. Seleccionar Create a new fork

Arquitectura del laboratorio

(Aqui va una imagen)

Deploy de la topología

La topología fue configurada para su ejecución en una instancia de Github Codespaces
1. Clic en la solapa Code y seleccionar Codespaces
2. Clic en Create codespaces on main

Iniciar el laboratorio
 ejecutar clab deploy -t topo-telemetria.yml

Stack de Telemetría

-nodo gNMIc: Collector de métricas basado en gNMI/gRPC
 Acceso al nodo: desde una nueva terminal en Codespaces
 ejecutar docker exec -it clab-lab-telemetria-PC4 /bin/bash

 En el directorio principal se encuentran los archivos
 gnmic-config.yml (susbcribe a métricas de consumo de CPU)
 gnmic-stats-ifaces.yml (subscribe a métricas de estádísticas in-multicast-packets, out-multicast-packets, in-packets, out-packets)

 Iniciar la subscripción a métricas ejecutando el comando: 
 gnmic subscribe --config gnmic-config.yml
 gnmic subscribe --config gnmic-stats-ifaces.yml

-nodo Prometheus: Base de datos de series temporales. Scrap de métricas gNMIc

-nodo Grafana: Dashboard y Panels de visualización. Ejecuta PromQL sobre Prometheus
 Acceso al Dashboard vía web: Desde la solapa Puertos en Codespaces
 1. Clic derecho sobre el puerto 3000
 2. Seleccionar visibilidad del puerto: Public
 3. Clic en el ícono Abrir navegador
	
  
