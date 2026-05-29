# 🏢 InnovateTech — Infraestructura de CPD Corporatiu

> **Projecte integrador d'ASIX** · Disseny, implementació i seguretat d'un centre de processament de dades complet, amb automatització mitjançant Ansible i desplegament a AWS Academy.

---

## 📋 Taula de Continguts

- [Descripció del Projecte](#-descripció-del-projecte)
- [Arquitectura General](#-arquitectura-general)
- [Serveis Implementats](#-serveis-implementats)
- [Estructura del Repositori](#-estructura-del-repositori)
- [Requisits Previs](#-requisits-previs)
- [Desplegament Ràpid](#-desplegament-ràpid)
- [Documentació Detallada](#-documentació-detallada)
- [Recursos de la Presentació](#-recursos-de-la-presentació)
- [Seguretat](#-seguretat)
- [Autors](#-autors)

---

## 📌 Descripció del Projecte

**InnovateTech** és una empresa fictícia organitzada en quatre departaments: Vendes (`vendes`), Suport Tècnic (`suport tècnic`), Administració (`administració`) i Logística (`logística`). Aquest repositori conté la **implementació completa** de la seva infraestructura IT, des del disseny físic del CPD fins al desplegament automatitzat de tots els serveis a AWS.

### Objectius principals

| Objectiu | Descripció |
|---|---|
| 🏗️ **CPD Físic** | Disseny de la sala de servidors: ubicació, climatització N+1, seguretat física i elèctrica |
| ☁️ **Cloud AWS** | Aprovisionament automatitzat d'instàncies EC2 amb IP Elàstiques i grups de seguretat |
| 🤖 **Automatització** | Orquestració completa amb **Ansible Playbooks** (sense intervenció manual) |
| 🔐 **Seguretat** | OpenLDAP, RBAC a MariaDB, Auditbeat + Elastic Stack, firewalls FortiGate |
| 📡 **Serveis Multimèdia** | Streaming d'àudio (Icecast2), vídeo sota demanda (Jellyfin) i videoconferència (Jitsi Meet) |
| 🗄️ **Base de Dades** | MariaDB amb 16 taules, triggers d'auditoria, backups automàtics i scripts RBAC |

---

## 🏛️ Arquitectura General

```
Internet
    │
    ▼
┌─────────────────────────────────────────┐
│        Firewalls FortiGate 100F (HA)    │
└─────────────┬───────────────────────────┘
              │
    ┌─────────┴──────────┐
    │                    │
┌───▼────────┐    ┌──────▼──────┐
│   RACK 1   │    │   RACK 2   │
│ Front-End  │    │  Back-End  │
│            │    │            │
│ Web & SFTP │◄──►│  MariaDB   │
│ Icecast2   │    │  OpenLDAP  │
│ Jellyfin   │    │  ELK Stack │
└────────────┘    └────────────┘
         │              │
    ┌────┴──────────────┘
    │
┌───▼───────────────┐
│  SAN PowerVault   │
│  (RAID 10/6)      │
└───────────────────┘
```

### Instàncies AWS desplegades

| Servidor | Rol | Tipus EC2 | IP Elàstica |
|---|---|---|---|
| `InnovateTech-Web-SFTP` | Frontend Web (NGINX) + ProFTPD | `t2.micro` | Dinàmica |
| `InnovateTech-DB-Server` | Motor MariaDB | `t3.small` | `44.198.194.136` |
| `InnovateTech-Logs-Server` | Elasticsearch + Kibana | `t3.large` | `23.21.142.115` |
| `InnovateTech-LDAP` | OpenLDAP (directori central) | `t3.small` | `54.174.227.251` |
| `InnovateTech-Audio` | Icecast2 + Ezstream | `t2.micro` | Dinàmica |
| `InnovateTech-Video` | Jellyfin (HLS streaming) | `t2.micro` | Dinàmica |

---

## ⚙️ Serveis Implementats

### 🌐 Frontend Web i SFTP
**Stack:** NGINX + PHP + ProFTPD · **Autenticació:** OpenLDAP

El servidor web corporatiu publica un portal intern (`index.html`) amb accés directe a tots els serveis de l'empresa. ProFTPD valida les credencials dels usuaris contra el directori LDAP centralitzat i crea les carpetes `home` dinàmicament en el primer accés.

- Port **80/TCP** → Portal web corporatiu (HTTP)
- Port **2222/TCP** → SFTP segur per a empleats

---

### 🗄️ Base de Dades Relacional (MariaDB)
**Motor:** MariaDB · **Desplegament:** EC2 `t3.small` · **Schema:** 16 taules

El sistema de bases de dades és el cor de l'organització. Integra la gestió de personal, el registre de trucades, el catàleg de vídeo i la monitorització de xarxa.

**Model de seguretat RBAC (4 rols):**

| Rol | Permisos | Restriccions |
|---|---|---|
| `admin` | `ALL PRIVILEGES + GRANT OPTION + FILE` | Accés total + backups |
| `vendes` | `SELECT/INSERT/UPDATE` en taules comercials | Sense accés a nòmines ni personal |
| `administracio` | `SELECT/INSERT/UPDATE` en personal i RR.HH. | Sense accés a trucades ni clients |
| `treballador` | `SELECT` al catàleg; `INSERT/UPDATE` a trucades pròpies | Sense accés a dades econòmiques |

**Automatitzacions a destacar:**
- **Triggers d'auditoria:** Control de quotes de trucades mensuals/diàries. Bloqueig automàtic de comptes. Registre d'intents de violació de rols a `Taula_Avisos`.
- **Backup diari (02:00 AM):** Script Bash `backup_dades.sh` via crontab. Exporta `Empleats`, `Clients`, `Comandes` i `Registre_Trucades` a CSV. Registre automàtic a `Control_Backups`.
- **Sincronització Jellyfin:** Script Python `sincronizar_jellyfin.py` que cada 5 minuts actualitza `Videos_Streaming` via API.

---

### 🔑 Directori Central (OpenLDAP)
**Desplegament:** EC2 `t3.small` · **Domini:** `dc=innovatetech,dc=cat`

Centralitza l'autenticació de tots els serveis de la infraestructura. ProFTPD i altres serveis validen els usuaris contra aquest directori. El compte de servei `ftpadmin` aïlla les credencials de l'administrador global.

- Port **22/TCP** → SSH d'administració
- Port **389/TCP** → Consultes LDAP

---

### 📊 Monitoratge i SIEM (Elastic Stack)
**Stack:** Elasticsearch 8.x + Kibana + Auditbeat · **Servidor:** EC2 `t3.large`

Centralitza tota la telemetria de seguretat de la infraestructura. L'agent `Auditbeat` es desplega automàticament a tots els nodes i envia les dades xifrades cap al servidor central.

**Mòduls monitoritzats:**
- Integritat de fitxers (FIM): `/etc`, `/bin`, `/sbin`, `passwd`, `shadow`
- Sessions i autenticacions (`login`, `process`, `user`)
- Intents de login fallit i atacs de força bruta (`/var/log/btmp`)

---

### 🎵 Streaming d'Àudio (Icecast2 + Ezstream)
**Canals disponibles:**

| Canal | Muntatge | Ús |
|---|---|---|
| Corporatiu | `/radio` | Emissions generals en bucle |
| Premium | `/premium` | Contingut formatiu o restringit |

Accessible via NGINX (port 80) com a proxy invers. Format **MP3** per a compatibilitat universal amb HTML5. Els dimonis `systemd` garantitzen el reinici automàtic dels emissors Ezstream.

---

### 🎬 Streaming de Vídeo sota Demanda (Jellyfin)
**Protocol:** HLS (HTTP Live Streaming) · **Còdec:** H.264 en MP4

Catàleg corporatiu d'audiovisuals. Utilitza **Direct Stream** (0% CPU de transcodificació) gràcies a que tots els fitxers s'emmagatzemen en H.264/MP4, format compatible natiu amb tots els navegadors moderns.

---

### 📹 Videoconferència (Jitsi Meet)
**Desplegament:** Docker Compose · **Ports:** 8000 (HTTP) / 8443 (HTTPS)

Suite de videotrucades basada en contenidors Docker independents:

```
docker-jitsi-meet-web-1    → NGINX Frontend (ports 8000/8443)
docker-jitsi-meet-prosody  → Servidor XMPP (senyalització)
docker-jitsi-meet-jicofo   → Gestor de sessions
docker-jitsi-meet-jvb      → Video Bridge (RTP/UDP)
```

---

## 📁 Estructura del Repositori

```
pro-asixc1D-g1-main/
│
├── Ansible-Playbooks/
│   ├── Audio/
│   │   ├── 1_audio_infra_base.yml          # Aprovisionament EC2 + grup seguretat
│   │   └── 2_audio_services_config.yml     # Icecast2, Ezstream, NGINX proxy
│   │
│   ├── AuditBeat/
│   │   ├── deploy_innovatetech_aws.yml     # Desplegament agent Auditbeat
│   │   └── inventory.ini
│   │
│   ├── Database/
│   │   ├── deploy_innovatetech_aws.yml     # EC2 + MariaDB + schema + rols
│   │   ├── schema.sql                      # DDL: 16 taules amb FK i constraints
│   │   ├── rols_db.sql                     # RBAC: 4 rols amb GRANT
│   │   ├── crear_usuaris.py                # Script interactiu d'alta d'usuaris
│   │   └── inventory.ini
│   │
│   ├── Logs/
│   │   ├── deploy_innovatetech_aws.yml     # EC2 + Elasticsearch + Kibana
│   │   └── inventory.ini
│   │
│   ├── OpenLDAP/
│   │   ├── main.yml                        # Orquestrador (importa els dos playbooks)
│   │   ├── maquina.yml                     # Aprovisionament EC2 a AWS
│   │   └── openldap.yml                    # Configuració slapd + usuari ftpadmin
│   │
│   ├── Video/
│   │   └── video.yml                       # EC2 + Jellyfin (instal·lador oficial)
│   │
│   └── Web-sFTP/
│       ├── 1_infra_i_serveis_base.yml      # EC2 + NGINX + PHP + ProFTPD + LDAP
│       ├── 2_webapp_config.yml             # Portal web, PHP PDO, lògica trucades
│       ├── 3_logs_config.yml               # Auditbeat al servidor web
│       └── usefull_commands.txt            # Guia de comandes de desplegament
│
├── Docs/
│   ├── Prova.md                            # Documentació tècnica completa del projecte
│   └── Database.md                         # Especificació tècnica de la base de dades
│
├── Media/
│   └── InnovateTech CPD Servers Architecture.png
│
└── README.md
```

---

## 📦 Requisits Previs

Abans de desplegar la infraestructura, assegura't de tenir el següent:

**Eina** | **Versió mínima**
---|---
Python | 3.8+
Ansible | 2.14+
Boto3 / Botocore | Última estable
Col·lecció `amazon.aws` | Ansible Galaxy

```bash
# Instal·lar dependències
pip install ansible boto3 botocore

# Instal·lar la col·lecció oficial d'AWS per a Ansible
ansible-galaxy collection install amazon.aws
```

**Credencials AWS necessàries:** Compte actiu d'AWS Academy amb permisos EC2, VPC i EIP. Clau `.pem` de laboratori (`labsuser.pem`).

---

## 🚀 Desplegament Ràpid

### 1. Preparació de la clau SSH

```bash
# Renombrar i fixar permisos de la clau de laboratori
cp labsuser.pem innovateadmin_key
chmod 400 innovateadmin_key

# Generar la clau pública per a Ansible
ssh-keygen -y -f ./innovateadmin_key > ./innovateadmin_key.pub

# Desactivar verificació de host per a entorns de lab
export ANSIBLE_HOST_KEY_CHECKING=False
```

### 2. Desplegament per servei

Cada servei es desplega de forma independent. Segueix l'ordre recomanat per respectar les dependències (OpenLDAP i Base de Dades primer):

```bash
# ── 1. Directori central OpenLDAP ──────────────────────────────
cd Ansible-Playbooks/OpenLDAP
ansible-playbook main.yml

# ── 2. Base de dades MariaDB ───────────────────────────────────
cd ../Database
ansible-playbook deploy_innovatetech_aws.yml

# ── 3. Servidor de logs (Elastic Stack) ───────────────────────
cd ../Logs
ansible-playbook deploy_innovatetech_aws.yml

# ── 4. Frontend Web + SFTP (en 3 fases) ──────────────────────
cd ../Web-sFTP
ansible-playbook 1_infra_i_serveis_base.yml           # Crea la màquina
ansible-playbook -i hosts.ini 2_webapp_config.yml     # Desplega la web app
ansible-playbook -i hosts.ini 3_logs_config.yml       # Integra Auditbeat

# ── 5. Streaming d'Àudio ──────────────────────────────────────
cd ../Audio
ansible-playbook 1_audio_infra_base.yml
ansible-playbook -i hosts_audio.ini 2_audio_services_config.yml -u ubuntu

# ── 6. Streaming de Vídeo (Jellyfin) ─────────────────────────
cd ../Video
ansible-playbook video.yml

# ── 7. Agent Auditbeat (nodes clients) ───────────────────────
cd ../AuditBeat
ansible-playbook -i inventory.ini deploy_innovatetech_aws.yml
```

### 3. Alta d'usuaris a la base de dades

```bash
# Executar el script interactiu d'alta d'usuaris (des del servidor DB)
sudo /usr/local/bin/crear_usuaris

# Verificar que les taules s'han creat correctament
mysql -u innovateadmin -p -e "SHOW TABLES FROM innovatetech_gestio;"
```

---

## 🔐 Seguretat

### Política de Ports (Security Groups AWS)

| Servei | Port | Protocol | Origen |
|---|---|---|---|
| SSH (tots els nodes) | 22 | TCP | 0.0.0.0/0 |
| MariaDB | 3306 | TCP | 0.0.0.0/0 |
| OpenLDAP | 389 | TCP | 0.0.0.0/0 |
| HTTP (Web/Icecast) | 80 | TCP | 0.0.0.0/0 |
| SFTP | 2222 | TCP | 0.0.0.0/0 |
| Elasticsearch API | 9200 | TCP | 0.0.0.0/0 |
| Kibana | 5601 | TCP | 0.0.0.0/0 |
| Jitsi HTTP/HTTPS | 8000, 8443 | TCP | 0.0.0.0/0 |

### Mesures de seguretat lògica implementades

- ✅ **MFA i principi de mínim privilegi** per a tots els comptes operadors
- ✅ **Hardening SSH:** deshabilitació de login `root` i autenticació per contrasenya
- ✅ **Auditoria SIEM** centralitzada via Auditbeat → Elasticsearch
- ✅ **RBAC MariaDB** amb 4 rols estrictament segmentats
- ✅ **Triggers d'auditoria** que bloquegen i registren violacions de rols
- ✅ **Backups diaris** amb registre a `Control_Backups`
- ✅ **Regla 3-2-1** per a còpies de seguretat (local + cloud + off-site)

---

## 📚 Documentació Detallada

Consulta els documents tècnics complets a la carpeta `/Docs/`:

| Document | Contingut |
|---|---|
| [`Docs/Prova.md`](Docs/Documentació_Completa.md) | Documentació tècnica completa: CPD físic, infraestructura IT, elèctrica, càlculs SAI, tots els serveis |
| [`Docs/Database.md`](Docs/Database.md) | Especificació de la base de dades: schema, rols, backups, triggers |

### 🎤 Recursos de la Presentació

| Recurs | Enllaç |
|---|---|
| 📊 **Presentació (Google Slides)** | [Veure presentació](https://docs.google.com/presentation/d/1F9vSjPPJOJtc7TT_TxCwdN4sm2sx6JBO/edit?usp=sharing&ouid=108465664889522379423&rtpof=true&sd=true) |
| 🎥 **Vídeo del projecte** | [Veure vídeo](https://drive.google.com/file/d/1DZKWJuokzrjm2ZgxcjQZKTy9d5_SxF2-/view?usp=sharing) |

---

## 👥 Autors

Projecte desenvolupat com a treball de curs del **Cicle Formatiu de Grau Superior d'Administració de Sistemes Informàtics en Xarxa (ASIX)**.

**Grup:** `asixc1D-g1`

---

<div align="center">

**InnovateTech CPD** · Projecte ASIX · 2026

</div>
