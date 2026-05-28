# InnovateTech Database Infrastructure System

This document outlines technical specifications, deployment architecture, and security structures for the **InnovateTech** database system. The infrastructure is fully automated, secure, and ready for deployment on an isolated virtual environment.

---

## 1. Project Overview & Context

### 1.1. Introduction & Executive Summary
InnovateTech relies on an internal departmental structure encompassing Sales (`vendes`), Technical Support (`suport tècnic`), Administration (`administració`), and Logistics (`logística`). To facilitate collaboration, the company requires an integrated communication suite featuring internal voice/video calls and audio/video media streaming capabilities. 

### 1.2. System Objectives
This infrastructure implements an Relational Database configured to meet three core goals:
* **Organizational Management:** Efficient tracking of personnel and company departments.
* **Internal Communication & Streaming Suite:** Logging of real-time video calls and video catalog management.
* **Security & Auditing:** Access control with distinct user roles, automated provisioning scripts, and automated audit logging.

---

## 2. Database Design & Deployment Architecture

### 2.1. Infrastructure & SGBD Selection Justification
To avoid expensive cloud resource overheads (such as AWS RDS), the database is deployed on a virtual instance (EC2).
* **Database Engine:** **MariaDB Server** (coupled with `python3-pymysql` for automation interfaces).
* **Hosting Platform:** **AWS Academy EC2 Instance** (`t3.small`) running Ubuntu Linux with an associated static Elastic IP address (`44.198.194.136`).
* **Deployment:** Fully automated via an **Ansible Playbook** (`deploy_innovatetech_aws.yml`).

### 2.2. Network Security Group Settings
The firewall configuration restricts incoming traffic to essential vectors only:

| Protocol | Destination Port | Source Network | Purpose |
| :--- | :--- | :--- | :--- |
| **TCP** | `22` | `0.0.0.0/0` | Secure Shell (SSH) Remote Management |
| **TCP** | `3306` | `0.0.0.0/0` | MariaDB Remote Client Traffic (bound to `0.0.0.0`) |

---

## 3. Database Schema Implementation

The database structure is fully defined within the repository file: `schema.sql`.

### 3.1. Relational Model Schema
The configuration defines **16 operational tables** with strict constraints:
[Departaments] ──🔑 Codi_Departament (PK)
│
└───► [Empleats] ──🔑 Dni (PK) ──🔗 FK: Codi_Departament
│
├───► [Nomines] ──🔑 Id_Nomina (PK) ──🔗 FK: Dni_Empleat
│
└───► [Usuaris] ──🔑 Id_Usuari (PK) ──🔗 FK: Dni_Empleat, Id_Client
│
├───► [Registre_Trucades] ──🔗 FK: Id_Origen, Id_Destinacio
├───► [Mesura_Banda]       ──🔗 FK: Id_Usuari_Mesurat, Id_Operari
└───► [Taula_Avisos]       ──🔗 FK: Id_Usuari

### 3.2. Script Referencing
* **DDL Schema Script:** Refer to the structural definition file: `[schema_creation.sql](./schema.sql)`. This file includes primary keys and constraint properties.
* **Data Verification Strategy:** To verify structural health on the EC2 server, run:
    ```bash
    mysql -u innovateadmin -p -e "SHOW TABLES FROM innovatetech_gestio;"
    ```

---

## 4. Functional Requirements & Data Specifications

### 4.1. Communication and Quality of Service (QoS)
* **`Usuaris`:** Represents the directory for communications, differentiating between internal workers and external clients, tracking states (`actiu`/`bloquejat`) and call-limits.
* **`Grup_Qualitat` & `Registre_Trucades`:** Manages profiles for stream quality variables (`alta`, `mitja`, `baixa`) with recursive references (`id_qualitat_inferior`) to scale down call.

### 4.2. Video Streaming and Bandwidth Monitoring
* **`Videos_Streaming`:** Catalog index searchable by title, category, or classification keywords.
* **`Mesura_Banda`:** Logs network stats (download, upload, latency) associated with individual technicians.

---

## 5. Security: User Management, Roles, and Privileges

The access control schema is separated into distinct layers as defined within `rols_db.sql`.

### 5.1. Privileges Matrix
The system establishes four database roles with clear permisions:

| Role Name | Granted Privileges | Operational Constraints / Scope |
| :--- | :--- | :--- |
| **`admin`** | `ALL PRIVILEGES ON *.* WITH GRANT OPTION`, `GRANT FILE` | Complete administrative access, security auditing, and backup execution capabilities. |
| **`vendes`** | `SELECT`, `INSERT`, `UPDATE` on `Clients`, `Comandes`, `Productes`, `Cistell`, `Registre_Trucades`, `Taula_Avisos`. | Client profile management and commercial call analysis. **No access to corporate payroll/personnel tables.** |
| **`administracio`** | `SELECT`, `INSERT`, `UPDATE` on `Empleats`, `Nomines`, `Departaments`, `Grup_Nivell`. | Human resources administration. **Explicitly restricted from joining client calls or streaming systems.** |
| **`treballador`** | `SELECT` on `Productes`, `Videos_Streaming`, `Configuracio_Servidor`. `SELECT`, `INSERT`, `UPDATE` on `Registre_Trucades`. | General internal usage, streaming resource consumption, and call self-registration. |

### 5.2. User Provisioning Automation Script
User provisioning is fully automated using the Python execution agent deployed to the server environment at `/usr/local/bin/crear_usuaris` (`crear_usuaris.py`).

* **Execution Flow:**
    1. Interactive console loop queries user handles, passwords, and target roles.
    2. Enforces input validation against a hardcoded array of permissible roles (`ROLS_VALIDS`).
    3. Programmatically formats safe, ready-to-execute SQL outputs containing clean syntax boundaries:
        ```sql
        CREATE USER IF NOT EXISTS 'username'@'%' IDENTIFIED BY 'password';
        GRANT 'role_name' TO 'username'@'%';
        SET DEFAULT ROLE 'role_name' FOR 'username'@'%';
        ```
    4. Bundles operations safely within an output execution script (`usuaris_generats.sql`) ending with a declarative `FLUSH PRIVILEGES;` sequence.

---

## 6. Advanced Programmability & System Maintenance

### 6.1. Audit Trail System Architecture
Malicious or accidental authorization breaches are handled at the schema level using an evaluation ledger:
* **`Taula_Avisos`:** Captures data alteration warnings, recording unauthorized transactions with deep event context parameters (`id_usuari`, `taula_afectada`, `operacio_intentada`, `data_hora`).

### 6.2. Scheduled Maintenance & Backup Automation
System backups avoid commercial runtime wrappers by utilizing native OS components combined with low-level MariaDB mechanisms configured via Ansible.

* **Storage Framework:** The system utilizes the local destination folder `/var/lib/mysql-files/backups`, aligning perfectly with the engine's strict `secure_file_priv` variable constraints.
* **Automation Agent (`backup_dades.sh`):** A shell execution script triggered daily at **02:00 AM** via a system `crontab` daemon profile.
* **Mechanism Actions:**
    1. Dynamically identifies the next chronological sequence index without relying on auto-increment fields: `SELECT COALESCE(MAX(id_backup), 0) + 1 FROM Control_Backups;`.
    2. Performs lightning-fast data extractions using raw CSV serialization lines:
       ```sql
       SELECT * INTO OUTFILE '/path/to/file.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' FROM target_table;
       ```
    3. Backs up critical tracking components: `Empleats`, `Clients`, `Comandes`, and `Registre_Activitat_Trucades`.
    4. Commits runtime evaluation statuses (`Èxit` / `Error`) and metadata targets straight into the operational tracking table `Control_Backups`.

---

## 7. Extended Features

### 7.1. Alert Hooks Expansion
The structural foundation includes hooks within the auditing tables allowing administrators to attach simple Python or Bash webhook components. These triggers can instantly push emergency notifications to monitoring tools (such as Discord, Telegram, or corporate email relays) whenever a security breach is intercepted by the audit logging engine.
