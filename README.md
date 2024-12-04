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
| `authelia`      | Authelia is an open-source IAM (Identity and Access Management) system providing multi-factor authentication and single sign-on (SSO) capabilities for applications through a web portal.|
| `Grafana-Unraid-Stack` |**Grafana server:** Include both a GUS demo dashboard and falconexe's Ultimate UNRAID Dashboard v1.3. **Influxdb**, **Telegraf** with hddtemp or smartmontools (and ipmitool pre-installed) **Loki + Promtail** (so you can now watch your Unraid syslog in the dashboard)|
| `HandBrake` | HandBrake, when configured to utilize Nvidia's NVENC encoder, provides significantly faster video encoding compared to CPU-only encoding.  This setup leverages the parallel processing power of your Nvidia GPU to transcode video files, resulting in shorter processing times for the same quality output.  It's not a separate program, but rather a configuration option within the HandBrake application itself, requiring compatible Nvidia hardware and drivers.  This approach is particularly beneficial for high-resolution videos or when speed is a priority.|
|`Nginx-Proxy-Manager` | Nginx Proxy Manager (NPM) is an open-source application that simplifies managing Nginx as a reverse proxy server through a user-friendly web interface.  It supports multiple domains, SSL certificates, and more, eliminating the need for complex command-line configurations.|                                                                    
| `Notifiarr` | Notifiarr is an open-source notification aggregator that centralizes alerts from various applications and services, primarily using Discord, and provides basic system monitoring capabilities.|
| `ClamAV` | ClamAV is an open-source antivirus engine used for detecting various types of malware, including viruses, trojans, worms, and other malicious threats.  It's not a full antivirus suite like you might find on a desktop computer; instead, it's a powerful engine that's often integrated into other applications or systems.  It's frequently used in email gateways, web servers, and other security-sensitive environments to scan files for threats before they reach end users.  It's known for its flexibility and its ability to be incorporated into various platforms and security solutions.|
| `Cloudflared` | Cloudflared is Cloudflare's command-line tool for managing DNS, Tunnels, Access, and other Cloudflare services directly from the terminal, enabling automation and scripting.|
| `Code-Server` | Code-Server lets you access and use Visual Studio Code through a web browser, enabling remote code editing from any device.|
| `Crowdsec` | CrowdSec is an open-source, collaborative intrusion detection and prevention system (IDS/IPS). It leverages a global network of users to identify and block malicious actors based on their behavior.  Instead of relying solely on signature-based detection, CrowdSec analyzes logs and network traffic to detect suspicious patterns, sharing this threat intelligence across its community to proactively protect its users.  It offers various components to enhance its capabilities, including a central console for management and reporting, as well as features for application security (AppSec).|
| `Duplicacy` | Duplicacy is a cross-platform, open-source backup tool that uses client-side encryption and deduplication to efficiently back up files to various cloud storage providers, local disks, or SFTP servers.  Its key features include lock-free deduplication for improved performance and a user-friendly web-based GUI alongside a command-line interface.  It supports numerous cloud services and offers robust encryption options.|
| `Gieta` | Gitea is a community-driven, open-source Git service.  It's a self-hostable platform that provides similar functionality to GitHub, GitLab, and Bitbucket, allowing users to manage Git repositories, collaborate on code, and track issues.  It's designed to be lightweight, easy to set up, and highly performant.|
| `Heimdall` | The Heimdall application dashboard is an open-source, self-hosted dashboard that provides a centralized interface for accessing and managing various web applications and services.  It's designed to replace the need for numerous browser bookmarks or a complex spreadsheet, offering a visually appealing and organized way to access your self-hosted tools and applications.  It supports adding numerous applications, often displaying status information and quick-launch buttons.|
| `Influxdb` | InfluxDB is an open-source time-series database optimized for storing and querying large amounts of time-stamped data, commonly used for monitoring and analytics.|
| `Mariadb` | MariaDB is a community-developed, open-source relational database management system (RDBMS).  It's a fork of MySQL, and it's designed to be a drop-in replacement, maintaining high compatibility while also adding new features and improvements.  It's known for its speed, reliability, and ease of use, making it a popular choice for various applications, from small websites to large-scale enterprise systems.  Many Linux distributions use it as their default database system.|
| `Nextcloud` | Nextcloud is a self-hostable, open-source software suite that provides a range of collaborative features similar to commercial cloud services like Dropbox or Google Workspace.  Users can set up their own private cloud storage, manage files, share documents, collaborate on projects, and utilize integrated communication tools.  It emphasizes data privacy and control, allowing users to maintain ownership and control of their data.|
| `Pihole` | Pi-hole is a network-level ad and tracker blocker that works by acting as a DNS sinkhole. It prevents devices on your network from connecting to domains known to host advertisements and online trackers, improving privacy and network performance.|
| `Prometheus` | Prometheus is an open-source systems monitoring and alerting toolkit. Prometheus collects and stores its metrics as time series data, i.e. metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels.|
| `Redis` | Redis is an in-memory data structure store, used as a database, cache, and message broker.  It's known for its speed and flexibility, offering various data structures (strings, hashes, lists, sets, sorted sets, bitmaps, hyperloglogs, geospatial indexes, streams) to efficiently store and retrieve data.  This makes it suitable for a wide range of applications, from caching frequently accessed data to building real-time applications and implementing message queues.  Its in-memory nature allows for extremely fast data access.|
| `Speedtest-tracker` | Speedtest-tracker is a self-hosted application that monitors and logs the results of internet speed tests performed using Ookla's Speedtest.net service.  It provides a convenient way to track internet performance over time, allowing users to identify trends, potential issues, and compare their internet speed to their ISP's advertised speeds.  The collected data is typically presented through a web interface, offering visualizations and historical data for analysis.  It's often used to monitor internet service reliability.|
| `traefik` | Traefik is an open-source edge router that acts as a reverse proxy and load balancer.  It's designed to simplify the management of HTTP and TCP-based applications, particularly in microservices architectures and containerized environments.  Its key features include automatic service discovery (it can automatically detect new services and configure itself accordingly) and dynamic configuration updates (it adapts to changes without requiring restarts).  It supports various providers and platforms, enabling seamless integration into diverse infrastructure setups.|
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
