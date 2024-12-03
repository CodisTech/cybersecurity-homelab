# Cybersecurity Homelab Setup Guide

This guide provides a high-level overview of setting up the cybersecurity homelab. Detailed instructions for configuring individual services are included within their respective configuration files.

## Prerequisites

### Hardware
For my setup, I have 3 servers: 2 Proxmox and one Unraid.  These servers I have custom built.  Below is a breakdown of eah:

1. **Server 1: IronMan**
    * **Case:**
    * **Motherboard:**
    * **Processor:**
    * **Ram:**
    * **SSD:**
    * **NVME:**
    * **Hard Drive:**
    * **NIC:**
    * **PSU:**
    * **GPU:**

1. **Server 2: Ultron**
    * **Case:**
    * **Motherboard:**
    * **Processor:**
    * **Ram:**
    * **SSD:**
    * **NVME:**
    * **Hard Drive:**
    * **NIC:**
    * **PSU:**
    * **GPU:**

1. **Server 3: Captain**
    * **Case:**
    * **Motherboard:**
    * **Processor:**
    * **Ram:**
    * **SSD:**
    * **NVME:**
    * **Hard Drive:**
    * **NIC:**
    * **PSU:**
    * **GPU:**

### Network

### Software


## Setup Steps

1. **Prepare the environment:**  *(Instructions for setting up networking, static IPs, etc.)*
2. **Install pfSense:** *(Brief overview; link to pfSense documentation if appropriate)*
3. **Install Proxmox VE:** *(Brief overview; link to Proxmox documentation)*
4. **Install UnRAID:** *(Brief overview; link to UnRAID documentation)*
5. **Create and configure Ubuntu Server VMs:** *(Brief overview)*
6. **Deploy services:**
    * **Authelia:**  *(Instructions for deploying the Authelia container; link to the `authelia.yaml` file for detailed configuration.)*
    * **Traefik:** *(Instructions for deploying Traefik; link to `traefik.yaml` for detailed config.)*
    * *(Add other services)*
7. **Verify and test:** *(Instructions to check functionality)*


## Detailed Configuration Files

The configuration files for each service are well documented within their respective YAML files:

* Authelia: [`authelia.yaml`](documentation/docker-compose/authelia.yaml)
* Traefik: [`traefik.yaml`](documentation/docker-compose/traefik.yaml)
* *(List other services)*


## Troubleshooting

*(Include common issues and solutions)*
