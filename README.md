# Cybersecurity Homelab Setup Guide

This repository documents my journey of exploring and learning various facets of cybersecurity through the setup and configuration of a personal home lab. The goal is to provide a hands-on environment for experimenting with different security tools and techniques. This project is a work in progress, and I will be continuously updating it as I learn and expand my knowledge. The scripts and configurations contained herein are intended for educational purposes and should not be used in any unauthorized or illegal activities. Contributions and feedback are welcome!

---

## Folder Structure

- **documentation/**: Guides, diagrams, and documentation for setting up and using the homelab, including Traefik setup instructions.
- **configs/**: Configuration files for various tools and services within the homelab.
- **scripts/**: Automation and utility scripts used in the homelab setup and maintenance.
- **logs/**: Sample log files (for demonstration purposes).
- **diagrams/**: Visual representations of the homelab architecture and network topology.
- **tools/**: Information and documentation about the tools used in this homelab.
- **documentation/docker-compose/**: Docker Compose configuration files for various services.

---

## Prerequisites

This home lab utilizes a multi-machine setup. Below is a brief list of hardware for each machine:

**Hardware:**

* **Four physical machines (or VMs with sufficient resources):**
    * **Machine 1 (Firewall):** Dedicated to running pfSense. A quad-core processor, 4GB RAM, and 120GB HD storage.
    * **Machine 2 (Hypervisor):** Dedicated to running Proxmox VE. 256GB RAM and 2TB SSDs Raid10, of storage for VMs.
    * **Machine 3 (Hypervisor):** Dedicated to running Proxmox VE. 128GB RAM and 2TB NVME of storage for VMs.
    * **Machine 3 (Storage Server):** Running UnRAID. 128GB RAM and 80TB HD storage. Plus thumbdrive, maximum of 60GB (for OS).

**Software:**

* **pfSense:** Download the latest stable version from the official pfSense website. [Download Link](https://www.pfsense.org/download/)
* **Proxmox VE:** Download the latest stable ISO from the official Proxmox website. [Download Link](https://www.proxmox.com/en/downloads)
* **UnRAID:** Purchase and download UnRAID from their official website. [Website Link](https://unraid.net/) *(Note: This requires a paid license)*
* **Operating System for VMs (Linux Server):** For this setup I am using Ubuntu Server 22.04 LTS.  Many other distributions are available, but I have used Ubuntu for many years. [Website Link](https://ubuntu.com/download/server)
* **Docker:**  I am using Docker on one Ubuntu Server VM to manage containers. *(List specific containers if desired)*

**Network Configuration:**

* **Network Cables:** You'll need Ethernet cables to connect the machines.
* **Static IP Addresses:** Assign static IP addresses to each machine.

**Other Considerations:**

* **Basic Networking Knowledge:** Recommended.
* **Linux Command-Line Knowledge:** Recommended.
* **Administrator/Root Privileges:** Required on all machines.
* **Docker Knowledge (Recommended):**  Familiarity with Docker is needed to utilize the Docker Compose files.

---

## Docker Compose Configuration

This project uses Docker Compose to manage various services.  The configuration files are located in the `/documentation/docker-compose` directory. Each YAML file defines a specific service, allowing for independent management and scaling.

The following services are defined:

| File Name             | Description                                                                     |
|-----------------------|---------------------------------------------------------------------------------|
| `authelia`      | Sets up an Nginx web server container for hosting a website or application.     |
| `Grafana-Unraid-Stack` | ...                                                                           |
| `HandBrake` | ...                                                                           |
| `HandBrake-for-Nvidia` | ...                                                                           |
| `Nginx-Proxy-Manager-Official` | ...                                                                           |
| `NginxProxyManager` | ...                                                                           |
| `Notifiarr` | ...                                                                           |
| `ClamAV` | ...                                                                           |
| `Cloudflared` | ...                                                                           |
| `Code-Server` | ...                                                                           |
| `Crowdsec` | ...                                                                           |
| `Duplicacy` | ...                                                                           |
| `Gieta` | ...                                                                           |
| `Heimdall` | ...                                                                           |
| `Influxdb` | ...                                                                           |
| `Mariadb` | ...                                                                           |
| `Nextcloud` | ...                                                                           |
| `Pihole` | ...                                                                           |
| `Prometheus` | ...                                                                           |
| `Redis` | ...                                                                           |
| `RXV4` | ...                                                                           |
| `Speedtest-tracker` | ...                                                                           |
| `traefik`        | Defines the Traefik reverse proxy container, routing traffic to other services. |
| `...other file.yaml` | ...                                                                           |


Each YAML file contains detailed configuration settings for its respective service.  Refer to the individual YAML files for specific options and customizations.

---

## Traefik Setup

For detailed instructions on setting up and configuring Traefik in this homelab (based on Techno-Tim's guide), please refer to:

[Traefik Setup Guide](https://github.com/CodisTech/cybersecurity-homelab/blob/main/documentation/docker-compose/traefik_3.0/traefik-setup.md)


---

## Getting Started

To begin setting up your cybersecurity home lab, follow the detailed instructions in the setup guide: [setup guide](documentation/setup-guide.md)

---

## License

MIT License

Copyright (c) 2024 CodisTech

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
