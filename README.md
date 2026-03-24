# 📡 Laboratorio: Telemetría de Redes basada en gNMI con Containerlab

> Laboratorio de telemetría de redes moderno usando gNMI/gRPC, desplegado sobre **GitHub Codespaces** con **Containerlab**. Incluye stack completo de observabilidad: **gNMIc + Prometheus + Grafana**.

[![Containerlab](https://img.shields.io/badge/Containerlab-topology-blue?logo=docker)](https://containerlab.dev/)
[![GitHub Codespaces](https://img.shields.io/badge/GitHub-Codespaces-181717?logo=github)](https://github.com/features/codespaces)
[![Grafana](https://img.shields.io/badge/Grafana-dashboard-F46800?logo=grafana)](https://grafana.com/)
[![Prometheus](https://img.shields.io/badge/Prometheus-metrics-E6522C?logo=prometheus)](https://prometheus.io/)

---

## 📥 Descarga del laboratorio

### Opción 1: Importar repositorio

1. Clic en el botón **`+`** de la pantalla principal de GitHub.
2. Seleccionar **Import repository**.
3. En el campo **"The URL for your source repository"**, pegar la URL:
   ```
   https://github.com/ernestosv73/lab-telemetria.git
   ```
4. Asignar un nombre al nuevo repositorio.
5. Clic en **Begin import**.

### Opción 2: Crear un fork

1. Desde el repositorio [ernestosv73/lab-telemetria](https://github.com/ernestosv73/lab-telemetria), hacer clic en la lista desplegable **Fork**.
2. Seleccionar **Create a new fork**.

---

## 🏗️ Arquitectura del laboratorio

<!-- Reemplazar con imagen de la topología -->
![Arquitectura del laboratorio](./images/topologia.png)

---

## 🚀 Deploy de la topología

La topología fue configurada para su ejecución en una instancia de **GitHub Codespaces**.

1. Clic en la solapa **Code** y seleccionar **Codespaces**.
2. Clic en **Create Codespaces on main**.

---

## ▶️ Iniciar el laboratorio

Una vez dentro del Codespace, ejecutar:

```bash
clab deploy -t topo-telemetria.yml
```

---

## 📊 Stack de Telemetría

El laboratorio implementa un stack completo de telemetría basado en los siguientes componentes:

### 🔹 gNMIc — Collector de métricas (gNMI/gRPC)

Acceder al nodo desde una nueva terminal en Codespaces:

```bash
docker exec -it clab-lab-telemetria-gNMIc /bin/bash
```

En el directorio principal se encuentran los archivos de configuración:

| Archivo | Descripción |
|---|---|
| `gnmic-cpu-stats.yml` | Suscribe a métricas de consumo de CPU |
| `gnmic-stats-metricas.yml` | Suscribe a métricas de interfaces: `in-multicast-packets`, `out-multicast-packets`, `in-unicast-packets`, `in-error-packets` |

**Iniciar la suscripción a métricas:**

```bash
gnmic subscribe --config gnmic-cpu-stats.yml
```

```bash
gnmic subscribe --config gnmic-stats-metricas.yml
```

---

### 🔹 Prometheus — Base de datos de series temporales

Prometheus realiza el **scraping** de métricas expuestas por gNMIc y las almacena como series temporales para su posterior consulta.

---

### 🔹 Grafana — Dashboard y visualización

Grafana ejecuta consultas **PromQL** sobre Prometheus y presenta los datos en dashboards interactivos.

**Acceso al Dashboard vía web** (desde la solapa **Puertos** en Codespaces):

1. Clic derecho sobre el **puerto 3000**.
2. Seleccionar **Visibilidad del puerto → Public**.
3. Clic en el ícono **Abrir en navegador** 🌐.

---

## 🛠️ Tecnologías utilizadas

| Tecnología | Rol |
|---|---|
| [Containerlab](https://containerlab.dev/) | Orquestación de topología de red |
| [gNMIc](https://gnmic.openconfig.net/) | Collector gNMI/gRPC |
| [Prometheus](https://prometheus.io/) | Base de datos de series temporales |
| [Grafana](https://grafana.com/) | Visualización y dashboards |
| [GitHub Codespaces](https://github.com/features/codespaces) | Entorno de ejecución en la nube |

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia [MIT](LICENSE).

---

