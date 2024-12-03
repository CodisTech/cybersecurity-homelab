# Cybersecurity Homelab Setup Guide

This repository documents my journey of exploring and learning various facets of cybersecurity through the setup and configuration of a personal home lab. The goal is to provide a hands-on environment for experimenting with different security tools and techniques. This project is a work in progress, and I will be continuously updating it as I learn and expand my knowledge. The scripts and configurations contained herein are intended for educational purposes and should not be used in any unauthorized or illegal activities. Contributions and feedback are welcome!

---

## Folder Structure

- **documentation/**: Guides, diagrams, and documentation for setting up and using the homelab.
- **configs/**: Configuration files for various tools and services within the homelab.
- **scripts/**: Automation and utility scripts used in the homelab setup and maintenance.
- **logs/**: Sample log files (for demonstration purposes).
- **diagrams/**: Visual representations of the homelab architecture and network topology.
- **tools/**: Information and documentation about the tools used in this homelab.

---

## Prerequisites

This home lab utilizes a multi-machine setup. Ensure you have the following hardware and software before proceeding.

**Hardware:**

* **Three physical machines (or VMs with sufficient resources):**
    * **Machine 1 (Firewall):** Dedicated to running pfSense.  A quad-core processor, 4GB RAM, and 16GB of storage are a reasonable minimum.
    * **Machine 2 (Hypervisor):** Dedicated to running Proxmox VE.  A minimum of 8GB RAM and 64GB of storage is recommended.
    * **Machine 3 (Storage Server):** Running UnRAID. A minimum of 16GB RAM and 1TB of storage is recommended.

**Software:**

* **pfSense:** Download the latest stable version from the official pfSense website. [Download Link](https://www.pfsense.org/download/)
* **Proxmox VE:** Download the latest stable ISO from the official Proxmox website. [Download Link](https://www.proxmox.com/en/downloads)
* **UnRAID:** Purchase and download UnRAID from their official website. [Website Link](https://unraid.net/) *(Note: This requires a paid license)*
* **Operating System for VMs (Linux Server):** Specify the distribution you are using (e.g., Ubuntu Server, CentOS, Debian) and the minimum required version. [Download Link](insert appropriate link here)
* **(Optional Tools):** List any additional software you'll be using within the VMs.

**Network Configuration:**

* **Network Cables:**  You'll need Ethernet cables to connect the machines.
* **Static IP Addresses:** Assign static IP addresses to each machine.

**Other Considerations:**

* **Basic Networking Knowledge:** Recommended.
* **Linux Command-Line Knowledge:** Recommended.
* **Administrator/Root Privileges:** Required on all machines.

---

## Getting Started

To begin setting up your cybersecurity home lab, follow the detailed instructions in the setup guide: [setup guide](documentation/setup-guide.md)

---

## License

*(Add your license information here)*
