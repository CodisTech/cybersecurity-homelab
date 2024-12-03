# Cybersecurity Homelab Setup Guide

This guide provides a high-level overview of setting up the cybersecurity homelab. Detailed instructions for configuring individual services are included within their respective configuration files.

## Prerequisites

### Hardware
For my setup, I have 3 servers: 2 Proxmox and one Unraid.  These servers I have custom built.  Below is a breakdown of hardware for each:

1. **Server 1: *Captain*** Proxmox
    * **Case: *JONSBO N4 BLACK NAS mini Chassis*** [JONSBO N4](https://www.newegg.com/p/2AM-006A-000F1?Item=9SIAY3SK6A9556)
    * **Motherboard: *ASUS Prime B650M-A AX II AMD B650*** [Asus Prime B650M-A](https://www.newegg.com/asus-rog-strix-b650-a-gaming-wifi/p/N82E16813119631?Item=N82E16813119631)
    * **Processor: *AMD Ryzen 9 7900X*** [AMD Ryzen 9](https://www.newegg.com/amd-ryzen-9-7900x-ryzen-9-7000-series-raphael-zen-4-socket-am5/p/N82E16819113769?Item=N82E16819113769)
    * **Ram: *G.SKILL Trident Z5 RGB Series 64GB*** [G.Skill Trident x2](https://www.newegg.com/g-skill-64gb-ddr5-6400/p/N82E16820374432?Item=N82E16820374432)
    * **NVME: *SAMSUNG 990 PRO 2TB SSD*** [Samsung 990 Pro](https://www.newegg.com/samsung-2tb-990-pro-nvme-2-0/p/N82E16820147861?Item=N82E16820147861)
    * **Hard Drive: *Seagate Exos X20*** [Segate Exos X20 x3](https://www.newegg.com/seagate-exos-x20-st20000nm007d-20tb-hard-drive-for-enterprise-storage-7200-rpm/p/N82E16822185011?Item=N82E16822185011)
    * **Hard Drive: *Seagate Exos X18 16TB Enterprise HDD - CMR 3.5 Inch Hyperscale SATA 6Gb/s*** [Segate Exos x 16](https://www.amazon.com/dp/B0924X39NB?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)
    * **NIC:**
    * **PSU: *CORSAIR SF850 (2024) Fully Modular Low Noise 80 Plus Platinum ATX Power Supply – ATX 3.0 Compliant – PCIe 5.0 Ready – SFX-to-ATX Bracket Included*** [Corsair SF850](https://www.amazon.com/dp/B0D45PQ8C4?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)
    * **HeatSink: *Noctua NH-L9x65 chromax.Black, Premium Low-Profile CPU Cooler (65mm, Black)*** [Noctua NH-L9x65](https://www.amazon.com/dp/B0CKVZ2NZ1?ref=ppx_yo2ov_dt_b_fed_asin_title)

1. **Server 2: *Ultron*** UnRAID
    * **Case: *Rosewill 4U Server Chassis Rackmount Case | 12 Hot Swap 3.5", 2.5" SATA I, SATA II, SATA III SAS*** [Rosewill 4U](https://www.newegg.com/rosewill-rsv-l4412u-black/p/11-147-330?Item=11-147-330&cm_sp=product-_-from-price-options)
    * **Motherboard: *ASUS TUF Gaming X570-PRO (WiFi 6) AM4 Zen 3 Ryzen 5000 & 3rd Gen Ryzen ATX Motherboard*** [Asus TUF Gaming x570-PRO](https://www.amazon.com/dp/B08JWMPVD9?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)
    * **Processor: *AMD Ryzen 9 5900X 12-core, 24-Thread Unlocked Desktop Processor*** [AMD Ryzen 9](https://www.amazon.com/dp/B08164VTWH?ref_=ppx_hzod_title_dt_b_fed_asin_title_0_1&th=1)
    * **Ram: *G.SKILL Ripjaws V Series 64GB (2 x 32GB) 288-Pin PC RAM DDR4 3600 (PC4 28800) Desktop Memory Model F4-3600C18D-64GVK*** [G.Skill 64GB x2](https://www.newegg.com/g-skill-64gb-ddr4-3600/p/N82E16820374003?Item=N82E16820374003)
    * **NVME: *SAMSUNG 980 PRO SSD 1TB PCIe 4.0 NVMe Gen 4*** [Samsung 980 1TB](https://www.amazon.com/dp/B08GLX7TNT?ref=ppx_yo2ov_dt_b_fed_asin_title&th=1)
    * **Hard Drive: *Seagate Exos X20*** [Segate Exos X20 x4](https://www.newegg.com/seagate-exos-x20-st20000nm007d-20tb-hard-drive-for-enterprise-storage-7200-rpm/p/N82E16822185011?Item=N82E16822185011)
    * **NIC:**
    * **PSU: *EVGA SuperNOVA 750 P2, 80+ PLATINUM 750W , Fully Modular*** [EVGA 750](https://www.amazon.com/dp/B010HWDP48?ref_=ppx_hzod_title_dt_b_fed_asin_title_0_0&th=1) 
    * **GPU: *ZOTAC GAMING GeForce GTX 1660 SUPER Twin Fan Black 6GB GDDR6 192-bit Gaming Graphics Card, ZT-T16620J-10M*** [Zotac](https://www.newegg.com/zotac-geforce-gtx-1660-super-zt-t16620j-10m/p/1FT-000M-003U0?Item=1FT-000M-003U0)
    * **HeatSink: *Cooler Master Hyper 212 EVO V2 CPU Air Cooler with SickleFlow 120, PWM Fan*** [Cooler Master](https://www.amazon.com/dp/B08KD6SPLW?ref=ppx_yo2ov_dt_b_fed_asin_title)
    * **CaseFan: *Noctua NF-A8 PWM chromax.Black.swap, Premium Quiet Fan, 4-Pin (80mm, Black)*** [Noctua NF-A8 x2](https://www.amazon.com/dp/B07ZH1F2KH?ref=ppx_yo2ov_dt_b_fed_asin_title)

1. **Server 3: *IronMan*** Proxmox
    * **Case: *Rosewill 4U Server Chassis Rackmount Case*** [Rosewill 4U](https://www.newegg.com/rosewill-rsv-l4500u-black/p/N82E16811147328?Item=N82E16811147328)
    * **Motherboard: *SuperMicro H11DSI-NT Rev2.0 Dual Gigabit Ethernet for EPYC7001-7002 Series*** [SuperMicro H11DSI](https://www.ebay.com/itm/175819781282)
    * **Processor:**
    * **Ram: *NEMIX RAM 128GB (4X32GB) DDR4 2666MHZ PC4-21300 2Rx4 1.2V 288-PIN ECC RDIMM Registered Server Memory KIT*** [Nemix x2](https://www.newegg.com/nemix-ram-128gb-288-pin-ddr4-sdram/p/1X5-003Z-00M30?Item=9SIA7S67BJ1822)
    * **SSD: *Samsung Electronics 870 EVO 2TB 2.5 Inch SATA III Internal SSD*** [Samsung 2TB x4](https://www.newegg.com/samsung-2tb-870-evo-series-sata/p/N82E16820147794?Item=N82E16820147794)
    * **NVME: *WD Blue 1TB SA510 M.2 Internal Solid State Drive SSD - WDS100T3B0B*** [WD Blue 1TB](https://www.newegg.com/western-digital-1tb-blue-sa510/p/N82E16820250232?Item=N82E16820250232)
    * **Hard Drive:**
    * **NIC: *Intel Ethernet Server Adapter I350-T4 (I350T4V2)*** [4 Port Ethernet Card](https://www.newegg.com/intel-i350-t4/p/14U-0045-00441)
    * **PSU: *CORSAIR RMe Series RM1200e ATX Power Supply*** [Corsair RMe](https://www.newegg.com/rme-corsair-rm1200e-1200-w/p/N82E16817139315?Item=N82E16817139315)
    * **GPU:**
    * **HeatSink: *Noctua NH-U9 TR4-SP3, Premium CPU cooler for AMD sTRX4/TR4/SP3 (92mm, Brown)*** [Noctua x2](https://www.newegg.com/noctua-nh-u9-tr4-sp3-premium-grade-92mm-cpu-cooler-for-amd-tr4-sp3/p/13C-0005-00142?Item=9SIA4REJTU2660)
    * **3.5" to 2.5": *SABRENT 2.5 SSD & SATA Hard Drive to Desktop 3.5 SATA Bay Converter Mounting Kit*** [Sabrent 2.5 x4](https://www.newegg.com/sabrent-bk-pcbs-1-x-2-5-drive-to-3-5-bay/p/2WA-001J-00027?Item=9SIBK19JN74062)
    * **HBA: *LSI 9300-8i PCI-Express 3.0 SATA / SAS 8-Port SAS3 12Gb/s HBA - Single--Avago Technologies*** [LSI 9300-8i](https://www.newegg.com/lsi-9300-8i-sata-sas/p/14G-0006-000Y2?Item=9SIBK5TJTW8345)

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
