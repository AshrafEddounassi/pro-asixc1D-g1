# InnovateTech CPD Servers Architecture

This document provides a comprehensive overview of the architecture, network configurations, and current deployment status of the InnovateTech Data Center (CPD) server infrastructure.

---

##  Architecture Overview

![InnovateTech CPD Architecture](</Media/InnovateTech CPD Servers Architecture.png>)

---

##  Infrastructure Summary

| Server Role | Hostname | Instance Type | IP Address | Storage | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Web Server** | `InnovateTech-WebServer` | `t2.micro` | `52.21.139.73` | 20GB GP3 | 🟢 Active |
| **Database Server** | `InnovateTech-DB-Server` | `t3.small` | `13.216.34.192` | 20GB GP3 | 🟢 Active |
| **Logs Server** | `InnovateTech-Logs-Server` | `t3.large` | `23.21.142.115` | 20GB GP3 | 🟢 Active |
| **LDAP Server** | `InnovateTech-LDAP` | `t3.small` | `54.174.227.251` | 20GB GP3 | 🟢 Active |
| **Audio Server** | `InnovateTech-AudioServer` | `t3.medium` | `44.212.203.72` | 30GB GP3 | 🟢 Active |
| **Video & Streaming** | *PENDING* | `t3.large` | *PENDING* | 50GB GP3 | 🟢 Active |

---

## Detailed Server Specifications

###  Web Server
* **Hostname:** `InnovateTech-WebServer`
* **Instance Type:** `t2.micro`
* **IP Address:** `52.21.139.73`
* **Storage:** 20GB GP3

###  Database Server
* **Hostname:** `InnovateTech-DB-Server`
* **Instance Type:** `t3.small`
* **IP Address:** `13.216.34.192`
* **Storage:** 20GB GP3

###  Logs Server
* **Hostname:** `InnovateTech-Logs-Server`
* **Instance Type:** `t3.large`
* **IP Address:** `23.21.142.115`
* **Storage:** 20GB GP3

###  LDAP Server
* **Hostname:** `InnovateTech-LDAP`
* **Instance Type:** `t3.small`
* **IP Address:** `54.174.227.251`
* **Storage:** 20GB GP3

###  Audio Server
* **Hostname:** `InnovateTech-AudioServer`
* **Instance Type:** `t3.medium`
* **IP Address:** `44.212.203.72`
* **Storage:** 30GB GP3

###  Video & Streaming Server
* **Hostname:** `InnovateTech-VideoServer`
* **Instance Type:** `t3.large`
* **IP Address:** `32.195.130.65`
* **Storage:** 50GB GP3
