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

| Item | Description  | Documentation                                      |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------|
| `authelia`               | Authelia is an open-source IAM (Identity and Access Management) system providing multi-factor authentication and single sign-on (SSO) capabilities for applications through a web portal.                                                    | [Authelia](documentation/authelia.md)              |
| `Grafana-Unraid-Stack`   | Grafana server: Includes both a GUS demo dashboard and falconexe's Ultimate UNRAID Dashboard v1.3. InfluxDB, Telegraf with hddtemp or smartmontools (and ipmitool pre-installed), Loki + Promtail (to view Unraid syslog in the dashboard) | [Grafana-Unraid-Stack](documentation/grafana-unraid-stack.md) |
| `HandBrake`              | HandBrake, when using Nvidia's NVENC, provides faster video encoding.  It leverages your Nvidia GPU for transcoding, resulting in shorter processing times.  This is a configuration option within HandBrake.                               | [HandBrake](documentation/handbrake.md)            |
| `Nginx-Proxy-Manager`    | Nginx Proxy Manager (NPM) simplifies managing Nginx as a reverse proxy through a user-friendly web interface.  Supports multiple domains and SSL certificates.                                                                                   | [Nginx-Proxy-Manager](documentation/nginx-proxy-manager.md) |
| `Notifiarr`              | Notifiarr is an open-source notification aggregator (primarily using Discord) that provides basic system monitoring.                                                                                                                            | [Notifiarr](documentation/notifiarr.md)            |
| `ClamAV`                 | ClamAV is an open-source antivirus engine detecting malware (viruses, trojans, worms). It's often integrated into other systems.                                                                                                              | [ClamAV](documentation/clamav.md)                 |
| `Cloudflared`            | Cloudflared is Cloudflare's command-line tool for managing DNS, Tunnels, Access, and other services, enabling automation.                                                                                                                            | [Cloudflared](documentation/cloudflared.md)          |
| `Code-Server`            | Code-Server lets you access and use Visual Studio Code through a web browser, enabling remote code editing.                                                                                                                                   | [Code-Server](documentation/code-server.md)         |
| `Crowdsec`               | CrowdSec is an open-source, collaborative IDS/IPS that uses behavioral analysis and community threat intelligence.                                                                                                                               | [Crowdsec](documentation/crowdsec.md)              |
| `Duplicacy`              | Duplicacy is a cross-platform, open-source backup tool using client-side encryption and deduplication.                                                                                                                                          | [Duplicacy](documentation/duplicacy.md)            |
| `Gitea`                  | Gitea is a self-hostable, community-driven, open-source Git service similar to GitHub.                                                                                                                                                           | [Gitea](documentation/gitea.md)                  |
| `Heimdall`               | The Heimdall application dashboard is a self-hosted dashboard for accessing and managing web applications and services.                                                                                                                            | [Heimdall](documentation/heimdall.md)             |
| `InfluxDB`               | InfluxDB is an open-source time-series database for monitoring and analytics.                                                                                                                                                                     | [InfluxDB](documentation/influxdb.md)             |
| `MariaDB`                | MariaDB is a community-developed, open-source relational database management system (RDBMS), a fork of MySQL.                                                                                                                                     | [MariaDB](documentation/mariadb.md)               |
| `Nextcloud`              | Nextcloud is a self-hostable, open-source software suite providing collaborative features like cloud storage, file management, and communication tools.                                                                                       | [Nextcloud](documentation/nextcloud.md)           |
| `Pi-hole`                | Pi-hole is a network-level ad and tracker blocker acting as a DNS sinkhole.                                                                                                                                                                         | [Pi-hole](documentation/pihole.md)                |
| `Prometheus`             | Prometheus is an open-source systems monitoring and alerting toolkit.                                                                                                                                                                          | [Prometheus](documentation/prometheus.md)          |
| `Redis`                  | Redis is an in-memory data structure store used as a database, cache, and message broker.                                                                                                                                                          | [Redis](documentation/redis.md)                  |
| `Speedtest-tracker`      | Speedtest-tracker monitors and logs internet speed test results from Ookla's Speedtest.net, providing performance tracking and analysis.                                                                                                       | [Speedtest-tracker](documentation/speedtest-tracker.md) |
| `Traefik`                | Traefik is an open-source edge router acting as a reverse proxy and load balancer, simplifying application management, especially in microservices and containerized environments.                                                                  | [Traefik](documentation/traefik.md)              |
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
