# Document de Projecte: Disseny, Implementació i Seguretat de la Infraestructura del CPD de Innovate Tech

## 1. Proposta del Centre de Processament de Dades (CPD)

### 1.1 Ubicació Física de la Sala
El disseny de l'espai físic destinat als servidors s'ha realitzat prioritzant la seguretat estructural, l'eficiència energètica i la continuïtat del negoci, des de la selecció estratègica de la planta fins al control ambiental i mecànic.

#### 1.1.1 Localització i Mesures de Camuflatge
S'ha determinat ubicar el CPD a la primera planta de l'edifici corporatiu. Aquesta selecció es justifica tècnicament per minimitzar els riscos ambientals següents:
*   **Inundacions:** S'exclou el soterrani i la planta baixa per mitigar l'impacte de fuites d'aigua generals, trencaments de canonades de gran cabal o inundacions per precipitacions extremes de la xarxa urbana.
*   **Filtracions i Càrrega Tèrmica:** S'exclou l'última planta de l'edifici amb l'objectiu d'evitar la radiació solar directa sobre el sostre (reduint l'estrès tèrmic i el consum elèctric de la climatització) i el risc de filtracions d'aigua pluvial procedents de la teulada.

La sala s'ha ubicat en una zona interior i cega (sense finestres perimetrals cap a la via pública), envoltada per despatxos administratius comuns per oferir un aïllament físic addicional.

Amb la finalitat d'evitar la identificació externa de la infraestructura crítica per a personal aliè a l'administració de sistemes, es despleguen tres mesures d'ocultació i camuflatge:
1.  **Senyalització Neutra:** Es descarta l'ús de rètols que indiquin "CPD", "Sala de Servidors" o terminologia similar. La porta d'accés s'identificarà mitjançant un codi d'inventari neutre, per exemple, "Sala de Manteniment 1.04" o "Arxiu".
2.  **Modificació de Plànols d'Ús Públic:** En els mapes d'evacuació i emergència exposats en els passadissos i zones comunes de l'edifici, aquesta dependència figurarà exclusivament sota la denominació de "Magatzem".
3.  **Opacitat Estructural:** Es descarta qualsevol tipus d'obertura de vidre o visor a la porta d'accés. L'accés estarà protegit per una porta blindada completament opaca.

#### 1.1.2 Infraestructura Tècnica: Terra, Sostre i Canals de Distribució
La distribució de l'espai interior es divideix en tres nivells estructurals per garantir el correcte manteniment i la seguretat elèctrica i de dades:
*   **Terra Tècnic Elevat:** S'instal·la un sistema de terra fals amb una elevació de 45 cm respecte a la solera estructural de l'edifici. Les plaques utilitzades reben un reforç mecànic estructural per suportar el pes estàtic combinat dels bastidors (racks), servidors i Unitats de Subministrament Ininterromput (SAI). L'acabat exterior disposa d'un revestiment de vinil antiestàtic dissenyat per dissipar l'electricitat estàtica i protegir els components electrònics d'alt valor.
*   **Sostre Tècnic:** Es disposa un fals sostre modular situat a una alçada de 2,60 metres. Es compon de plaques de fibra d'alta densitat que proporcionen aïllament acústic (per mitigar el soroll d'alta freqüència dels sistemes de ventilació dels servidors) i propietats ignífugues certificades.
*   **Segregació de Canals de Distribució (Cablejat):** Amb el propòsit d'eliminar les interferències electromagnètiques (EMI) en la transmissió de dades i facilitar el diagnòstic d'avaries, es defineix una separació física estricta de les línies elèctriques i de xarxa:
    *   *Canals d'Alimentació Elèctrica:* El cablejat de potència elèctrica es distribueix exclusivament per l'espai inferior (sota el terra tècnic) contingut en canalitzacions metàl·liques tancades i connectades a terra.
    *   *Safates d'Electrònica de Dades:* El cablejat de xarxa (coure de categoria 6A i fibra òptica) es distribueix de forma aèria a través de safates metàl·liques suspeses del sostre tècnic, posicionades directament sobre la vertical dels armaris de distribució.

#### 1.1.3 Climatització i Control Ambiental
La càrrega tèrmica continuada generada per la infraestructura IT operativa s'ha calculat en **3,72 kW de calor sensible** (equivalent a 12.693 BTU/h). El sistema de climatització s'ha dissenyat per absorbir aquest flux tèrmic de forma ininterrompuda.

Es disposen dues màquines d'aire condicionat de precisió per a sales de dades (CRAC) configurades en un esquema d'alta disponibilitat **N+1** (una unitat activa i una unitat en reserva), amb una política d'alimentació commutada d'emergència:
*   **Règim de Funcionament Nominal:** Ambdós equips CRAC reben alimentació des de l'escomesa elèctrica general de l'edifici. Una única màquina absorbeix la totalitat dels 3,72 kW de calor sensible, mantenint el segon equip en mode de repòs actiu (*standby*).
*   **Règim d'Emergència (Tall de Subministrament Exterior):** En cas d'interrupció del servei elèctric de la xarxa urbana, els servidors mantenen l'operativitat de forma instantània mitjançant els mòduls SAI (amb una autonomia de bateria de 30 minuts). Atès que els SAIs no dimensionen potència elèctrica per a elements inductius d'alt consum com els compressors de climatització, s'activa el grup electrogen de combustió de l'edifici:
    *   Una de les línies d'alimentació d'un equip CRAC està connectada de manera exclusiva al quadre de commutació d'emergència d'aquest generador.
    *   Un cop el generador s'estabilitza de forma automàtica, subministra potència a l'aire condicionat designat. Això assegura la continuïtat de la climatització durant els 30 minuts de marge en què es realitza un apagat lògic i controlat dels servidors, evitant l'estrès tèrmic destructiu de l'electrònica per acumulació de calor.

El flux d'aire a l'interior de la sala s'organitza mitjançant la metodologia de **Passadís Fred / Passadís Calent**:
*   L'equip CRAC actiu injecta el cabal d'aire fred a pressió directament a l'espai contingut sota el terra tècnic.
*   L'aire fred emergeix exclusivament al passadís frontal dels bastidors (Passadís Fred) mitjançant reixetes i plaques perforades específiques.
*   Els ventiladors interns dels servidors aspiren l'aire cold des de la part frontal, rebaixen la temperatura dels processadors i expulsen l'aire escalfat (càrrega tèrmica) cap a la part posterior (Passadís Calent).
*   L'aire calent acumulat al passadís posterior s'eleva cap a la zona superior del fals sostre, retornant a l'aspiració de la màquina CRAC per reiniciar el cicle de refrigeració.

Els paràmetres nominals de funcionament que cal mantenir de manera automatitzada són els següents:
*   **Temperatura d'Operació:** Fixada de manera constant a $22^\circ\text{C}$ (admetent un rang dinàmic de tolerància entre $20^\circ\text{C}$ i $24^\circ\text{C}$ com a màxim).
*   **Humitat Relativa:** Regulada contínuament al 45%. Un descens crític d'humitat sota el 40% eleva el risc de descàrregues electroestàtiques, mentre que un augment superior al 55% provoca condensació d'humitat sobre les plaques electròniques, generant curtcircuits.
*   **Filtració i Pressió Positiva:** Les unitats CRAC incorporen filtres d'alta eficiència mecànica per retenir partícules de pols suspenses. Així mateix, la injecció d'aire es calibra per generar un estat de **pressió positiva** a l'interior del CPD; en obrir la porta d'accés, el diferencial de pressió obliga l'aire a sortir de la sala, impedint l'entrada de pols o partícules contaminants dels passadissos comuns.

---

### 1.2 Seguretat Física del Centre de Dades

#### 1.2.1 Control d'Accés Físic i Perimetral
S'estableix una política de control d'accés estructurada en nivells de seguretat concèntrics per impedir intrusions i registrar la traçabilitat del personal:
*   **Registre Perimetral Obligatori:** Totes les visites, proveïdors externs i personal intern han de registrar-se formalment a la recepció centralitzada de l'edifici abans d'accedir a les àrees tècniques.
*   **Perímetre de l'Edifici (Nivell 1):** Control d'accés mitjançant lectors de targetes intel·ligents amb tecnologia RFID per al personal autoritzat de l'organització.
*   **Accés Exclusiu al CPD (Nivell 2):** La porta blindada del CPD requereix de manera obligatòria una autenticació biomètrica. L'accés lògic està restringit univocament als administradors de sistemes designats.
*   **Seguretat en Bastidors (Nivell 3):** Els armaris rack romanen bloquejats mecànicament. Disposen de sensors d'obertura connectats al sistema d'alarma central, registre lògic individualitzat d'obertures i panells de protecció mecànica que blinden el cablejat interior.

#### 1.2.2 Circuit Tancat de Televisió (CCTV)
El monitoratge visual es realitza de forma continuada mitjançant una xarxa de videovigilància IP intel·ligent:
*   **Especificacions Tècniques:** Càmeres amb resolució nativa 4K, sensors de visió nocturna per infrarojos (IR), enregistrament continu adaptatiu per detecció de moviment i monitoratge centralitzat les 24 hores del dia, els 7 dies de la setmana ($24/7$).
*   **Àrees de Cobertura Crítica:** Monitoratge fix de les portes d'accés i sortides d'emergència, visualització completa de la línia del passadís fred i passadís calent, i cobertura de la sala elèctrica annexa.
*   **Política de Retenció:** Les gravacions de vídeo s'emmagatzemen en un sistema independent protegit durant un període mínim de 30 dies, garantint el compliment de la normativa vigent en matèria de protecció de dades (RGPD / LOPDGDD).

#### 1.2.3 Prevenció, Detecció i Extinció d'Incendis
Es desplega una solució d'extinció no destructiva dissenyada per a entorns de computació d'alta densitat:
*   **Detecció Avançada (VESDA):** Sistema d'aspiració contínua d'aire d'alta sensibilitat. Analitza per làser mostres ambientals per detectar micropartícules de combustió o sobreescalfament de plàstics i cables abans que es generi fum visible o flama oberta.
*   **Supressió Automàtica per Gas Inert:** En cas de confirmació d'incendi, s'activa un sistema d'inundació total mitjançant el compost químic **FK-5-1-12** (fluid de protecció contra incendis). Aquest gas extingeix el foc absorbint la calor sense reduir críticament l'oxigen en les fases inicials, sense deixar cap residu químic, evitant danys elèctrics o mecànics en els servidors, components de xarxa i cablejat.
*   **Contenció Structural i Ambiental:** Les parets perimetrals i les portes d'accés disposen de certificació estructural resistent al foc **RF-120**, garantint l'aïllament del foc exterior durant un temps mínim de 120 minuts. L'estructura compta amb segellats estancs per evitar filtracions d'aigua i amortidors mecànics per absorbir vibracions o esdeveniments sísmics menors.

#### 1.2.4 Vies d'Evacuació i Emergència
*   **Rutes de Sortida Senyalitzades:** Camins d'evacuació clarament definits i lliures d'obstacles, equipats amb senyalització fotoluminescent i unitats d'il·luminació d'emergència LED autònomes de baix consum.
*   **Mecanismes d'Obertura d'Emergència:** Les portes de sortida disposen de barres antipànic de pressió mecànica per a l'obertura cap a l'exterior de la sala. Aquests elements estan integrats en l'electrònica del control d'accés, garantint el desbloqueig magnètic instantani en cas d'activació de l'alarma d'incendi o ordre d'evacuació declarada pel sistema de seguretat central.

---

### 1.3 Seguretat Lògica de la Infraestructura

#### 1.3.1 Autenticació, Autorització i Control d'Accessos
*   **Segregació de Funcions:** S'aplica una separació estricta entre els processos d'Autenticació (verificació de la identitat mitjançant protocols multifactor - MFA) i l'Autorització (assignació de permisos concrets sobre els recursos).
*   **Gestió de Perfils d'Usuari:** Els comptes dels operadors s'estructuren sota el principi del menor privilegi, associant rols administratius específics i tancats (administradors de xarxa, d'infraestructura o de bases de dades). Totes les accions executives i consultes crítiques es registren en un repositori de logs centralitzat, protegit contra alteracions i auditable externament.

#### 1.3.2 Arquitectura de Firewalls i Segmentació de Xarxa
*   **Seguretat Perimetral (NGFW):** Es disposen Firewalls de Nova Generació (Next-Generation Firewalls) que realitzen inspecció profunda de paquets fins a la capa d'aplicació (Capa 7 de l'esquema OSI), bloquejant accessos anòmals, connexions no autoritzades i vectors d'atac externs procedents de xarxes de comunicació públiques.
*   **Segmentació Interna mitjançant VLANs:** Es blinda el trànsit de comunicacions mitjançant la creació de xarxes lògiques virtuals (VLANs) aïllades per firewalls interns. Aquesta configuració separa estrictament la xarxa de gestió administrativa dels servidors de la xarxa de producció corporativa i de la Zona Desmilitaritzada (DMZ) on s'allotgen els serveis de cara al públic.

#### 1.3.3 Monitoratge i Gestió d'Esdeveniments (SIEM)
*   **Centralització de Logs:** Tota l'activitat lògica i de seguretat dels nodes es recol·lecta de manera unificada mitjançant la Pila Elastic (Elasticsearch, Logstash i Kibana).
*   **Auditoria de Hosts:** Els servidors executen l'agent de seguretat `Auditbeat`, la configuració del qual s'orquestra i unifica centralitzadament mitjançant playbooks de l'eina d'automatització Ansible. El sistema monitoritza canvis en el sistema de fitxers, modificacions de configuracions i registres d'autenticació erronis, generant alertes visualitzables en panells de control de Kibana en cas de detecció d'esdeveniments crítics o intents de login fallits.

#### 1.3.4 Estratègia de Còpies de Seguretat (Regla 3-2-1)
La salvaguarda de la informació es regeix estrictament per la metodologia professional de protecció de dades:
*   **3 Còpies de Dades:** Existència d'una còpia activa de producció en temps real i dues rèpliques de seguretat redundants actualitzades periòdicament.
*   **2 Suports Diferents:** Emmagatzematge primari local estructurat en blocs de disc d'alt rendiment a la cabina SAN de l'empresa, i una segona còpia enviada a un volum d'emmagatzematge d'objectes immutable al núvol.
*   **1 Còpia Fora de Línia (Off-site):** Localització d'una còpia de seguretat totalment aïllada i fora de les instal·lacions físiques de l'empresa per permetre la restauració catastròfica (*Disaster Recovery*) en cas de destrucció total del CPD físic.

#### 1.3.5 Redundància de Maquinari de Disc (Arquitectures RAID)
Per neutralitzar l'impacte d'avaries mecàniques o elèctriques en unitats de disc físiques, es configuren estructures de disc redundants a nivell local i centralitzat:
*   **RAID 1 (Mirall) per a Sistemes Operatius:** Les unitats de disc d'arrencada allotjades localment a cada xassís de servidor es configuren en mode RAID 1. Si un disc pateix una avaria elèctrica o mecànica, el segon manté l'operativitat del node sense caiguda del servei, permetent la substitució del component danyat en calent (*Hot-Swap*) pels operaris.
*   **RAID 10 / RAID 6 per a Emmagatzematge Massiu de Dades:** La cabina centralitzada d'emmagatzematge de producció (SAN) i els servidors de logs es configuren combinant estructures avançades com RAID 10 (divisió de miralls) o RAID 6 (doble paritat distribuïda). D'aquesta manera s'obté un alt rendiment en operacions d'escriptura/lectura aleatòria de bases de dades i una alta tolerància a fallades simultànies de discs sense pèrdua d'informació.

---

## 2. Infraestructura IT i Disseny Elèctric

### 2.1 Especificacions de Maquinari i Segregació de Rols
S'ha adoptat una política de segregació estricta de serveis col·locant les diferents càrregues de treball en nodes físics de computació independents. S'utilitzen xassissos de gamma corporativa de Dell Technologies per optimitzar el consum i la gestió d'espai:

| Node ID | Rol i Serveis Allotjats | Model de Servidor | Configuració de Maquinari Clau | Consum Nominal |
| :--- | :--- | :--- | :--- | :--- |
| **Servidor 1** | Front-End Web Corporatiu i Transferència Segura SFTP | Dell PowerEdge R450 (1U) | 1x Intel Xeon Silver 4314 (16 Cores), 64GB RAM, 2x 960GB SSD SATA (RAID 1) | 350 W |
| **Servidor 2** | Motor Relacional de Base de Dades (MariaDB) | Dell PowerEdge R760 (2U) | 2x Intel Xeon Silver 4410Y (24 Cores tot.), 128GB RAM, 4x 1.2TB NVMe SSD (RAID 10) | 500 W |
| **Servidor 3** | Centralització de Seguretat i Logs (Pila Elastic) | Dell PowerEdge R760 (2U) | 2x Intel Xeon Silver 4414U (32 Cores tot.), 256GB RAM, 6x 2.4TB SAS (RAID 6) | 500 W |
| **Servidor 4** | Difusió de Fluxos d'Àudio Digital (Icecast2 / Ezstream) | Dell PowerEdge R450 (1U) | 1x Intel Xeon Silver 4310 (12 Cores), 64GB RAM, 2x 480GB SSD SATA (RAID 1) | 300 W |
| **Servidor 5** | Processament Multimèdia de Vídeo i Streaming (Jellyfin) | Dell PowerEdge R760 (2U) | 2x Intel Xeon Gold 5415+ (32 Cores tot.), 128GB RAM, 2x Intel DC GPU Flex 140 | 550 W |
| **Servidor 6** | Servei de Directori Actiu i Autenticació (OpenLDAP) | Dell PowerEdge R450 (1U) | 1x Intel Xeon Silver 4310 (12 Cores), 32GB RAM, 2x 480GB SSD SATA (RAID 1) | 250 W |
| **SAN 1** | Cabina centralitzada d'emmagatzematge massiu persistent | Dell PowerVault ME5024 (2U) | Controladora Dual Activa, 12x 2TB HDD SAS 10K (RAID 10) | 350 W |
| **Xarxa** | Comunicacions i Firewalls Perimetrals de la Sala | Cisco / Fortinet | 2x Cisco Catalyst 9300L (Stacking lògic) + Firewalls FortiGate 100F HA | 300 W |

---

### 2.2 Electrònica de Xarxa i Arquitectura de Connexió
L'arquitectura de xarxa interna s'ha estructurat per eliminar punts únics de fallada lògica o física:
*   **Switches Principals en Alta Disponibilitat:** Es disposen 2 switches gestionables Cisco Catalyst 9300L de 48 ports Gigabit Ethernet que incorporen 4 uplinks de 10G SFP+. Els equips estan interconnectats físicament configurant un clúster o apilament lògic (*Stacking*), funcionant operativament com una única entitat lògica. En cas de fallada elèctrica o d'escompassament de la unitat principal, el segon switch assumeix la totalitat de la càrrega de dades sense talls en les sessions actives.
*   **Patch Panels de Distribució:** S'instal·len 2 panells de connexió (Patch Panels) de 24 ports per a cablejat estructurat de coure de categoria 6A UTP ocupant 1U d'alçada cadascun, destinats a centralitzar les connexions dels servidors corporatius. Addicionalment, es disposa d'1 Patch Panel de Fibra Òptica LC-Duplex (1U) exclusiu per a l'enllaç d'alta velocitat de la cabina d'emmagatzematge SAN i la recepció de les línies dedicades del proveïdor d'accés a Internet (ISP).

---

### 2.3 Disseny d'Elevació de Bastidors (Rack Elevation)
Els dispositius s'organitzen físicament en 2 armaris bastidors bastidors estàndard de 42U d'alçada, 19 polzades d'amplada i 1000 mm de profunditat. La distribució s'ha determinat aplicant criteris de segregació lògica de trànsit de xarxa, optimització de distàncies de cablejat i equilibri de càrrega elèctrica:

```
Alçada (U)    | RACK 1: Front-End i Serveis Públics       | RACK 2: Back-End i Seguretat Lògica
-------------------------------------------------------------------------------------------------
U40 - U42     | Patch Panels de Fibra Òptica i Cat6A      | Patch Panels de Distribució Interna
U38 - U39     | Switch Core Cisco Catalyst 9300L (Línia A) | Switch Distribució Cisco 9300L (Línia B)
U35 - U36     | Firewalls FortiGate 100F (Alta Dispo.)     | Pasacables Horitzontal de Seguretat
U25 - U26     | Servidor 5: Vídeo & Streaming (Jellyfin)  | Espai Reservat per a Ampliacions
U20 - U21     | Servidor 1: Web & SFTP (NGINX/ProFTPD)    | Servidor 2: Motor de Base de Dades (MariaDB)
U17 - U18     | Pasacables Horitzontal de Distribució     | Servidor 6: Directori Central OpenLDAP
U14 - U15     | Servidor 4: Àudio Streaming (Icecast2)    | Servidor 3: Centralització de Logs (Elastic)
U10 - U11     | Buit de Ventilació Estructural             | Cabina d'Emmagatzematge SAN PowerVault
U01 - U04     | Mòdul SAI APC Smart-UPS 3kVA (Línia A)    | Mòdul SAI APC Smart-UPS 3kVA (Línia B)
```

*   **RACK 1 (Front-End i Serveis Públics):** Agrupa els elements de xarxa i servidors que reben peticions directes des d'Internet. Això redueix el recorregut físic dels cables de coure cap als Firewalls FortiGate i aïlla el soroll electromagnètic extern.
*   **RACK 2 (Back-End, Dades i Seguretat Lògica):** Concentra els servidors que gestionen el trànsit privat de l'empresa (consultes internes a la base de dades, escriptura massiva de logs estructurats i trànsit block-level cap a la cabina SAN). L'enllaç local d'aquests nodes en un mateix switch resol el 80% de les peticions de forma interna, evitant la saturació del tronc de comunicació general.
*   **Interconnexió de Bastidors (Backbone):** Els switches principals de cada bastidor estan enllaçats per fibra òptica multimode combinant ports mitjançant protocol d'agregació d'enllaços (LACP de 2x10G SFP+), generant una autopista dedicada de comunicació de **20 Gbps** per a l'intercanvi dinàmic de dades de la xarxa corporativa.

---

### 2.4 Disseny de la Infraestructura Elèctrica i Commutació Redundant
Per tal d'assegurar la continuïtat elèctrica concurrentment mantenible i tolerant a fallades de tipus Tier III, s'implanta un disseny de doble ruta elèctrica independent (**Línia A + Línia B**):
1.  **Fonts d'Alimentació Duals (Dual PSU):** Tots els servidors, switches d'infraestructura i controladores de la cabina de dades disposen de dues fonts d'alimentació redundants que operen en mode actiu-actiu amb equilibratge automàtic de càrrega elèctrica.
2.  **Segregació de Rutes d'Alimentació:** Cada armari bastidor disposa de dues Unitats de Distribució de Potència intel·ligents (PDU). La font d'alimentació primària (PSU 1) de cada equip es connecta directament a la línia elèctrica controlada pel SAI 1 (Línia A), mentre que la font d'alimentació secundària (PSU 2) es connecta a la línia independent del SAI 2 (Línia B). Davant de qualsevol avaria d'un quadre o microtall elèctric exterior, el node de computació es manté operatiu a través de la línia elèctrica alternativa sense interrupcions lògiques.

---

### 2.5 Enginyeria de Càlcul del Subministrament Elèctric d'Emergència (SAI)
Es descriu el procediment matemàtic formal realitzat per dimensionar el banc de bateries i els elements del SAI per garantir una autonomia de **30 minuts (0,5 hores)** davant d'un tall absolut de potència de la xarxa urbana.

#### Pas 1: Determinació de la Càrrega Activa Total
Es desglossa i se suma el consum nominal en Watts (W) de la totalitat de la infraestructura del CPD:
*   **Càrrega Activa del RACK 1 (Front-End):**
    $$\text{Càrrega}_{\text{Rack1}} = 350\text{ W (Web)} + 300\text{ W (Àudio)} + 550\text{ W (Vídeo)} + 300\text{ W (Xarxa/FW)} = 1.500\text{ Watts}$$
*   **Càrrega Activa del RACK 2 (Back-End):**
    $$\text{Càrrega}_{\text{Rack2}} = 500\text{ W (BBDD)} + 500\text{ W (Logs)} + 250\text{ W (LDAP)} + 350\text{ W (SAN)} = 1.600\text{ Watts}$$
*   **Càrrega Activa de la Sala:**
    $$\text{Potència}_{\text{Activa}} = 1.500\text{ W} + 1.600\text{ W} = 3.100\text{ Watts (3,10 kW)}$$

#### Pas 2: Aplicació del Marge de Seguretat i Escalabilitat
S'introdueix un factor d'expansió del 20% ($1,20$) sobre el consum actual calculat, reservant potència elèctrica disponible per a la futura incorporació de nous nodes de computació sense sobrecarregar els elements protectors:
$$\text{Potència}_{\text{Disseny}} (D) = 3.100\text{ W} \times 1,20 = 3.720\text{ Watts (3,72 kW)}$$

#### Pas 3: Dimensionament Aparent dels Sistemes SAI (Volt-Ampers)
Per obtenir la potència aparent mínima indispensable per a cada armari, es realitza la conversió considerant un Factor de Potència (FP) d'eficiència informàtica global de $0,90$, fet que permet absorbir corrents inductius de pic generats pels ventiladors dels xassissos:
*   **Disseny de Càrrega i Capacitat per al RACK 1:**
    $$1.500\text{ W} \times 1,20 = 1.800\text{ W} \longrightarrow \frac{1.800\text{ W}}{0,90} = 2.000\text{ VA (2,0 kVA)}$$
*   **Disseny de Càrrega i Capacitat per al RACK 2:**
    $$1.600\text{ W} \times 1,20 = 1.920\text{ W} \longrightarrow \frac{1.920\text{ W}}{0,90} = 2.133,33\text{ VA (2,13 kVA)}$$

**Decisió d'Enginyeria Aplicada:** Per estandarditzar els components estructurals i reduir els costos de manteniment de recanvis, es determina instal·lar un model homologat de SAI modular **APC Smart-UPS de 3.000 VA (3 kVA / 2.700 W)** a la base de cadascun dels racks, assegurant un marge dinàmic superior a les necessitats mínimes de disseny elèctric.

#### Pas 4: Càlcul de la Capacitat del Banc de Bateries
Es calcula el requeriment basant-se en el RACK 2, atès que representa el pitjor escenari d'estrès elèctric de la sala ($1.920\text{ W}$ de disseny):
*   L'energia neta constant que demanen els nodes durant 30 minuts ($0,5\text{ h}$) és:
    $$\text{Energia}_{\text{Útil}} = 1.920\text{ W} \times 0,5\text{ h} = 960\text{ Wh (Watt-hores)}$$
*   Per calcular la capacitat real que ha de tenir el banc físic de cel·les de plom, es divideix pel rendiment intern de l'inversor de corrent continu a corrent altern del SAI (estimat en un $90\%$ o $0,90$) i es respecta un límit màxim de descàrrega profunda de seguretat del $80\%$ ($0,80$) per evitar la degradació química primerenca de les cel·les:
    $$\text{Energia}_{\text{Real}} = \frac{960\text{ Wh}}{0,90 \times 0,80} = \frac{960\text{ Wh}}{0,72} = 1.333,33\text{ Wh}$$

#### Pas 5: Conversió de la Capacitat a Ampers-Hora (Ah)
El bus de corrent continu intern de la unitat SAI professional de 3kVA està dissenyat per operar a una tensió nominal de **48 Volts CC** (obtinguda mitjançant l'acoblament elèctric en sèrie de 4 bateries estàndard de 12V):
$$\text{Capacitat}_{\text{Necessària}} = \frac{1.333,33\text{ Wh}}{48\text{ V}} = 27,77\text{ Ah}$$

**Conclusió del Dimensionament:** Cada unitat SAI s'enllaça a un armari de bateries extern que allotja 4 bateries de 12V connectades en sèrie. Se selecciona el model comercial estàndard de **35 Ah**. Com que aquest valor és significativament superior als 27,77 Ah requerits de forma teòrica, queda garantit el subministrament continu i ininterromput dels serveis lògics durant els 30 minuts establerts com a marge segur d'actuació.

---

## 3. Implementació de Serveis Automàtics a AWS mitjançant Ansible

### 3.1 Centralització d'Identitats: Servidor OpenLDAP
Amb l'objectiu de centralitzar la gestió d'accessos i l'autenticació creuada d'usuaris en entorns heterogenis (com les validacions del servidor ProFTPD), es desplega una instància dedicada de directori actiu OpenLDAP. Tot el procés s'ha automatitzat mitjançant un fitxer d'orquestració principal (`main.yml`) organitzat en dues fases d'execució seqüencials:

#### Fase 1: Aprovisionament d'Infraestructura a AWS (`maquina.yml`)
Aquest playbook realitza les connexions amb l'API d'Amazon Web Services per aixecar l'entorn de xarxa i la màquina virtual:
*   **Filtre Dinàmic de Recursos:** Identifica i selecciona de manera automàtica la VPC predeterminada del compte, una subxarxa continguda a la regió `us-east-1` i localitza l'identificador de la darrera imatge oficial (AMI) d'Ubuntu 24.04 LTS.
*   **Regles de Seguretat Perimetral (`sg_openldap`):** Configura de manera restrictiva el grup de seguretat de la instància d'AWS (tallafocs de xarxa), habilitant exclusivament l'entrada de trànsit pel port 22/TCP (SSH d'administració segura) i el port 389/TCP (LDAP per a consultes estructurades de l'arbre de directori).
*   **Instància Virtual i Assignació de Direcció Fixa:** Crea una instància de tipus `t3.small` associada a un volum de disc dur de 20 GB i li vincula una Adreça IP Elàstica d'AWS (Elastic IP), blindant el node de canvis d'adreça IP pública després de reinicis.
*   **Configuració d'Usuari de Gestió:** Crea l'usuari local de sistema `innovateadmin` amb intèrpret de comandaments Bash, injecta les claus públiques SSH d'administració al fitxer de seguretat `authorized_keys` i li assigna permisos d'execució immediata com a superusuari sense requerir contrasenya a la ruta `/etc/sudoers.d/innovateadmin`.

#### Fase 2: Configuració del Servei de Directori (`openldap.yml`)
Aquest component s'encarrega d'executar les ordres de configuració interna del sistema operatiu:
*   **Preconfiguració Automàtica amb Debconf:** S'injecten de forma desatesa els paràmetres corporatius del domini complet (`innovatetech.cat`), el nom de l'organització (`Innovate Tech`) i la contrasenya hash de l'administrador mestre (`@ITB2026`) abans d'iniciar el desplegament. Això evita que els binaris d'instal·lació del sistema operatiu Linux s'aturin sol·licitant dades de forma interactiva.
*   **Instal·lació de Dominis i Dimonis:** Realitza la descàrrega i instal·lació dels paquets de programari `slapd` i `ldap-utils` a través de l'eina de gestió `apt`, habilitant el servei en l'arrencada del sistema operatiu.
*   **Creació de l'Usuari de Servei de Comunicacions:** Es genera automàticament un fitxer d'estructura de dades format LDIF a la ruta `/tmp/ftpadmin.ldif` per injectar el compte d'usuari de servei `ftpadmin` dins de l'arbre jeràrquic del directori sota el Distinguished Name `dc=innovatetech,dc=cat`. Aquest compte s'utilitza per validar les peticions de sistemes externs connectats sense comprometre les credencials del compte administrador global.

---

### 3.2 Frontend de Serveis Corporatius: Servidor Web i FTP
Es desplega un servidor que actua com a portal central de l'empresa (Frontend Web basat en NGINX i PHP) i gestor de fitxers compartits d'alta velocitat (SFTP basat en ProFTPD). El control de l'entorn s'executa mitjançant l'acoblament de tres playbooks d'Ansible:

#### Fase 1: Aprovisionament d'Infraestructura i Serveis Base (`1_infra_i_serveis_base.yml`)
*   **Grup de Seguretat Dedicat:** Configura les regles a AWS definint l'entorn `innovatetech-web-sftp-sg`, obrint exclusivament les connexions de xarxa per als ports: 22/TCP (SSH d'administració), 80/TCP (Web pública HTTP) i el port 2222/TCP (SFTP tancat per a usuaris de l'empresa).
*   **Instància de Computació:** S'aixeca una instància de tipus `t2.micro` a la qual es vincula una Adreça IP Elàstica corporativa, registrant de manera automatitzada el nou host a l'inventari actiu d'Ansible per a les fases posteriors.
*   **Enduriment del Sistema Operatiu (Hardening):** Es desactiva el servei de tallafocs de la imatge (`ufw`) per evitar conflictes natius d'encaminament dins d'AWS, es crea l'usuari de control `innovateadmin` amb drets de superusuari i es modifica la configuració del dimoni SSH principal de la màquina deshabilitant el login extern de l'usuari `root` i l'autenticació mitjançant contrasenyes de text pla.
*   **Integració Lògica ProFTPD i LDAP:** S'instal·len els binaris d'NGINX, PHP i ProFTPD de forma unificada. S'activen els mòduls interns del gestor de fitxers `mod_sftp` i `mod_ldap`, substituint la configuració per defecte per establir un VirtualHost escoltant al port 2222. El programari ProFTPD valida les credencials dels usuaris externs llançant consultes directes contra l'adreça IP fixa del servidor OpenLDAP central (`54.174.227.251`), configurant la directiva `RequireValidShell off` i el mòdul de generació dinàmica d'estructures de carpetes personals home al primer accés d'un usuari vàlid.

#### Fase 2: Configuració de l'Aplicació Web Dinàmica (`2_webapp_config.yml`)
*   **Portal d'Inici Corporatiu (Landing Page):** Es purguen els fitxers de benvinguda predeterminats d'NGINX i es desplega un fitxer dissenyat a mida en codi HTML (`index.html`). Aquest document actua com a panell gràfic per als treballadors, oferint hipervíncles directes per accedir a la consola d'administració de la base de dades, el portal de streaming d'àudio, el catàleg de vídeos Jellyfin i les consoles de videotrucada.
*   **Connexió Segura a la Base de Dades Remota:** Es configura i allotja el codi de programació PHP `consulta_bbdd.php`, el qual genera connexions de dades de tipus PDO xifrades apuntant cap a la direcció IP pública de la instància MariaDB externa (`44.198.194.136`).
*   **Visualització Extreta de Dades:** El frontend web connectat realitza consultes estructurades SQL, extreu la llista de treballadors i en realitza un emmascarament dinàmic de seguretat (ocultant caràcters crítics d'elements sensibles com el DNI), el llistat complet de fitxers multimèdia del catàleg de vídeo i l'històric d'activitat de trucades.
*   **Lògica de Control d'Accessos:** S'implementa l'arxiu lògic de processament `procesar_trucada.php` per capturar la inserció de nous registres de comunicacions. El codi executa de forma autònoma un procés de validació que comprova la persistència de l'empleat a la base de dades, verifica la coincidència del PIN d'accés amb el número de DNI registrat i avalua que el compte disposi del rol estricte de `vendes` abans d'autoritzar l'escriptura a la taula transaccional de l'SGBD.

#### Fase 3: Monitoratge i Centralització de Seguretat (`3_logs_config.yml`)
*   **Instal·lació de l'Agent d'Auditoria:** S'importen de forma automatitzada les claus digitals de seguretat GPG i els repositoris de distribució d'Elastic per instal·lar de manera nativa el programari `Auditbeat` (versió mestre 8.x).
*   **Regles d'Integritat de Fitxers (FIM) i Canvis d'Estat:** Es configura el programari per auditar contínuament qualsevol intent de modificació o escriptura sobre directoris i binaris clau de l'estructura del sistema operatiu (`/etc`, `/bin`, `/sbin`) i fitxers d'identitat crítics (`passwd`, `shadow`). S'estableixen regles per registrar de manera immediata canvis de contrasenyes, inicis de sessions interactives o execucions de binaris mitjançant l'enregistrament dels conjunts de metadades `login`, `process` i `user`.
*   **Enviament cap al SIEM Central:** Tota la telemetria i traces de seguretat capturades s'encaminen mitjançant connexió xifrada cap a l'adreça IP fixa de la pila Elastic d'auditoria de l'empresa (`23.21.142.115`), important de manera transparent els quadres de comandament integrats per a la seva monitorització per part dels responsables de ciberseguretat.

---

### 3.3 Centralització de Telemetria i Auditories: Servidor de Logs
Es detalla el mètode d'orquestració de la plataforma centralitzada destinada a l'anàlisi de vulnerabilitats i emmagatzematge de logs de seguretat distribuïts en la infraestructura:

#### Fase 1: Automatització del Servidor Central d'Auditoria i Entorn Elastic
*   **Aprovisionament d'Infraestructura a AWS:** Mitjançant la definició de l'inventari de configuració `inventory.ini` i playbooks de provisió d'AWS, s'aixeca una instància de computació EC2 denominada `Innovate Tech-Logs-Server`, configurada sota el perfil de rendiment de maquinari de tipus `t3.large` amb 50 GB de volum de disc dur sota tecnologia d'estat sòlid gp3.
*   **Configuració de Firewalls de Node (`elastic-security-group`):** S'estableixen les regles del tallafocs perimetral de la instància d'AWS, permetent l'entrada de trànsit de xarxa exclusivament pels ports: 22/TCP (SSH d'administració de sistemes), 9200/TCP (interfície de comunicació API del motor Elasticsearch) i el port 5601/TCP (accés gràfic a la consola web Kibana). Per estabilitzar l'enllaç de recepció de dades dels agents clients, es vincula al node l'Adreça IP Elàstica de xarxa pública `23.21.142.115`.
*   **Configuració de Comptes i Privilegis Corporatius:** El playbook genera el compte d'usuari de gestió corporativa `innovateadmin` amb intèrpret Bash, configurant permisos totals d'execució com a superusuari root sense contrasenya (NOPASSWD) dins de l'estructura de directori `/etc/sudoers.d/`.
*   **Instal·lació de la Infraestructura de la Pila Elastic:** Es configuren de manera automatitzada els canals oficials de descàrrega de programari d'Elastic (v8.x) per instal·lar les aplicacions `Elasticsearch` i `Kibana`. Es modifiquen els arxius de configuració natius per obrir les interfícies de xarxa a l'escolta global de peticions (`0.0.0.0`) actuant en mode unificat (*single-node*). S'estableixen de manera segura les contrasenyes complexes d'accés global, desant les credencials del compte administrador `elastic` en el fitxer de text de seguretat local `/home/innovateadmin/elastic_credentials.txt`.

#### Fase 2: Desplegament de l'Agent de Seguretat Auditbeat en Nodes Clients
Un cop el node de recepció es troba actiu, s'executa un playbook dirigit a la totalitat de les màquines virtuals de la xarxa que actuen com a clients de producció (com el servidor distribuidor de base de dades `db_servers` localitzat a la IP pública `44.198.194.136` segons reflecteix l'inventari):
*   **Homogeneïtat de Versions i Control de Binaris:** El codi importa la clau pública oficial d'encriptació GPG d'Elastic i configura el canal de descàrrega APT per realitzar la instal·lació desatesa del paquet `auditbeat`, fixant la paritat de versions amb la versió del servidor central (v8.x).
*   **Assegurament del Fitxer de Configuració:** Es sobreescriu l'arxiu principal `/etc/auditbeat/auditbeat.yml` establint permisos interns del sistema operatiu altament restrictius (màscara de fitxer `0600`), evitant la lectura de les credencials del clúster per part de processos no autoritzats del propi host client.
*   **Configuració dels Mòduls d'Auditoria del Sistema:** L'agent es programa per capturar de manera nativa mètriques d'estat de la màquina, llistats de processos executats pels usuaris, així com els fitxers d'historial d'accessos locals `/var/log/wtmp` i `/var/log/btmp` amb el propòsit d'identificar de forma primerenca intents fallits de login o atacs de força bruta.
*   **Orquestració i Càrrega de Dashboards:** Es defineix la ruta d'enviament de la telemetria cap a l'Adreça IP Elàstica del servidor de logs central fent ús de l'usuari mestre `elastic`. En l'arrencada inicial, el playbook executa la instrucció remota `auditbeat setup`, la qual carrega de manera automàtica l'estructura completa de panells de visualització interactius a la consola web Kibana. El servei es deixa habilitat per arrencar de manera automàtica amb el sistema mitjançant un controlador (*handler*) que reinicia el procés davant de qualsevol canvi estructural en la configuració.

---

## 4. Serveis Multimèdia: Àudio, Vídeo i Videoconferència

### 4.1 Infraestructura de Transmissió d'Àudio Digital
Es desplega una plataforma d'emissió d'àudio contínua orientada a donar suport a canals de comunicació i ràdio interna:

1.  **Arquitectura de Programari Escollida:** S'utilitza el programari de codi obert **Icecast2** com a servidor principal de distribució de contingut i **Ezstream** actuant en el rol de client emissor de l'origen de dades (*source client*). El servidor Icecast2 rep de forma centralitzada els fluxos d'àudio generats per Ezstream i s'encarrega d'encaminar i multiplicar el senyal cap als diferents navegadors o reproductors web externs dels usuaris que es connecten a través del protocol HTTP, oferint una alta escalabilitat horitzontal.
2.  **Instal·lació i Automatització Tècnica:** El desplegament complet de la plataforma s'executa sobre una instància d'AWS que utilitza el sistema operatiu Ubuntu 24.04 LTS controlada per playbooks d'Ansible. Es fa ús dels binaris `debconf-utils` per injectar de forma prèvia i desatesa els paràmetres crítics sol·licitats pel programari, fixant de manera xifrada la contrasenya d'administració global (`AdminPassword2026!`) i les credencials de connexió d'emissió del flux d'àudio d'origen (`SourcePassword2026!`), descarregant posteriorment el servei mitjançant l'eina `apt`.
3.  **Configuració de Canals i Àmbit de Xarxa:** Per obrir l'accés a les connexions des de l'exterior d'Internet, es modifica el fitxer principal d'Icecast2 substituint l'adreça de bucle local `<bind-address>127.0.0.1</bind-address>` per la directiva global `<bind-address>0.0.0.0</bind-address>`. A través de la configuració interna del programari emissor, s'estableix de manera estable la distribució de dos canals d'àudio independents:
    *   `/radio`: Canal principal corporatiu configurat per a emissions generals contínues en bucle.
    *   `/premium`: Canal alternatiu destinat a continguts formatius o emissions restringides.
4.  **Configuració i Automatització del Client d'Origen (Ezstream):** S'instal·la el paquet `ezstream` a través d'APT. Per automatitzar i estabilitzar el flux de contingut d'àudio continu cap al servidor centralitzat sense intervenció manual, es realitzen les accions següents:
    *   S'emmagatzemen els arxius de dades d'àudio de proves dins de la ruta de configuració `/etc/ezstream/`.
    *   Se generen fitxers d'índex de text pla amb format de llista de reproducció (`.txt`) que contenen les rutes absolutes del sistema operatiu cap als arxius d'àudio descarregats.
    *   Es creen fitxers XML d'estructura de dades per a Ezstream on es defineix la connexió cap al servei local (`127.0.0.1:8000`), la contrasenya validada de l'emissor (*source password*) i els punts concrets de muntatge de cadascun dels canals del servidor.
    *   Es creen de manera nativa fitxers d'unitat de control per al dimoni del sistema operatiu `systemd` (`ezstream-radio.service` i `ezstream-premium.service`), assegurant d'aquesta manera que els clients emissors s'executin en segon pla de forma ininterrompuda i es reiniciïn de forma automatitzada davant de talls inesperats.
5.  **Format i Còdecs de So Utilitzats:** La plataforma es configura per treballar exclusivament sota l'estàndard d'àudio digital **MP3** (MPEG Audio Layer III). Els fitxers de so incorporats utilitzen l'extensió `.mp3` i la definició de dades dins dels arxius XML d'Ezstream detalla de manera estricta l'ús de l'etiqueta de format `<format>MP3</format>`. S'opta per l'MP3 a causa de la seva compatibilitat universal absoluta; el desplegament de reproductors web basats nativament en l'etiqueta `<audio>` de l'estàndard HTML5 garanteix que qualsevol client extern o navegador de mercat (Chrome, Firefox, Safari o plataformes mòbils) reprodueixi l'emissió de forma nativa sense necessitat d'instal·lar complements ni extensions de programari, oferint un equilibri òptim entre qualitat acústica i taxa de compressió de dades.
6.  **Validació i Anàlisi de Consum d'Ample de Banda:** Les proves d'estrès i validació realitzades demostren que la reproducció dels fluxos d'àudio des dels navegadors clients s'executa de forma estable, neta i sense talls ni latències perceptibles. L'anàlisi de l'ample de banda consumit en la línia de xarxa en variar de forma interactiva el nombre de connexions d'usuaris concurrents demostra que l'impacte incremental és mínim per al canal, el que permet l'accés simultani d'un gran volum de clients sense risc de degradació del servei.
7.  **Accés Integrat i Proxy Invers Web:** Per optimitzar la seguretat i evitar que els usuaris finals hagin de realitzar connexions obrint ports de xarxa no estàndard de tipus corporatiu (com el port d'Icecast 8000), es desplega un servidor web **NGINX** configurat en mode de **proxy invers** escoltant al port de comunicació estàndard 80. El programari redirigeix el trànsit web transparentment cap a la interfície local `http://127.0.0.1:8000`. Addicionalment, s'injecta un arxiu HTML personalitzat (`index.html`) a la ruta pública del servei, la qual cosa ofereix als treballadors una interfície visual polida i neta on poder seleccionar i activar els reproductors de so integrats de cada canal amb un únic clic des de qualsevol navegador web convencional.

---

### 4.2 Plataforma de Vídeo sota Demanda (Streaming Jellyfin)
Es dissenya una solució corporativa de catàleg de vídeo per donar suport a continguts audiovisuals corporatius:

*   **Descripció i Funcionalitat del Servei:** Per cobrir la publicació de continguts de vídeo sota demanda dins d'InnovateTech, s'implanta el servei **Jellyfin**, una solució de codi obert que permet l'organització, gestió i difusió de mitjans digitals sense restriccions de llicències.
*   **Instal·lació i Integració Establerta:** El servidor s'aixeca sobre una instància d'AWS que utilitza el sistema operatiu Ubuntu 24.04 LTS orquestrat per Ansible. El programari es desplega fent ús dels scripts oficials automatitzats del proveïdor, el que assegura la correcta resolució de les dependències de binaris del sistema i l'alta del servei com un dimoni independent de l'estructura del sistema operatiu, garantint d'aquesta manera l'arrencada automàtica del catàleg en cas de reinicis de la màquina virtual d'AWS.
*   **Protocol d'Encaminament de Streaming (HLS):** Per a la distribució eficient del flux de vídeo a través de la xarxa, Jellyfin implementa el protocol de streaming **HLS** (HTTP Live Streaming). El funcionament tècnic d'aquest estàndard es divideix en les següents fases lògiques:
    1.  El servidor segmenta el fitxer de vídeo original en múltiples blocs concrets d'alta resolució.
    2.  Es genera de manera automàtica un arxiu d'índex estructural amb extensió `.m3u8` que conté la seqüència exacta dels segments de vídeo.
    3.  El navegador client realitza la descàrrega de l'arxiu d'índex per canal segur HTTPS i sol·licita de forma progressiva els blocs de vídeo segons avança la visualització, adaptant-se dinàmicament a la qualitat de xarxa de l'usuari.
*   **Formats, Còdecs i Mètode de Transmissió Direct Stream:** Amb el propòsit d'eliminar la necessitat de realitzar processos continus de compressió i transcodificació de vídeo en temps real (tasques que elevarien críticament l'ús de la CPU de la instància d'AWS), s'estableix com a política d'empresa que la totalitat dels fitxers allotjats utilitzin el còdec de vídeo **H.264** integrat dins d'un contenidor multimèdia estàndard **MP4**. L'H.264 disposa de descodificació nativa per maquinari en gairebé qualsevol processador modern, i el format MP4 és directament compatible amb els navegadors d'Internet convencionals. En complir aquesta paritat de formats, Jellyfin activa el mètode de transmissió anomenat **Direct Stream**, on els blocs de dades s'envien de forma directa al client sense modificació prèvia, el que es tradueix en un consum de recursos de CPU proper al $0\%$.
*   **Mètodes d'Accés Extern:** El catàleg es troba accessible des de l'exterior del CPD mitjançant dos mecanismes de connexió estables:
    *   *Adreça IP Pública:* Connexió directa apuntant a l'Adreça IP Elàstica d'AWS assignada a la instància de vídeo.
    *   *Redirecció Web:* L'usuari navega pel portal web general de l'empresa (Frontend) on hi ha integrat un hipervíncle segur que el redirigeix cap a la interfície d'accés de la plataforma Jellyfin.

---

### 4.3 Sistema de Videoconferència Corporativa (Jitsi Meet)
Per permetre les comunicacions interactives en temps real de l'organització, s'implanta una plataforma de trucades de veu i vídeo basada en l'estàndard professional **Jitsi Meet** organitzada mitjançant contenidors Docker:

*   **Arquitectura Modular Basada en Contenidors:** La suite completa de serveis de Jitsi Meet s'estructura i aixeca de forma aïllada mitjançant l'ús de l'eina `Docker Compose`, dividint les funcions clau en quatre contenidors independents:
    1.  `docker-jitsi-meet-web-1` (Imatge: `jitsi/web`): Actua com el Frontend de la plataforma. Executa un servidor NGINX encarregat de servir la interfície gràfica d'usuari a la web i està mapejat de forma externa cap als ports d'accés de la màquina 8000 i 8443.
    2.  `docker-jitsi-meet-jicofo-1` (Imatge: `jitsi/jicofo`): Component de gestió central. S'encarrega de coordinar i governar la lògica interna de les sales de trucades, gestionar els usuaris connectats i assignar els recursos del sistema.
    3.  `docker-jitsi-meet-jvb-1` (Imatge: `jitsi/jvb` - *Jitsi Videobridge*): El motor de xarxa de la plataforma. S'encarrega d'encaminar els fluxos multimèdia d'àudio i vídeo directament entre els terminals dels usuaris connectats. Disposa de l'obertura del port crític **10000/UDP**, utilitzant el protocol UDP per transmetre la veu i el vídeo en temps real eliminant qualsevol tipus de retard o latència (*lag*).
    4.  `docker-jitsi-meet-prosody-1` (Imatge: `jitsi/prosody`): Servidor de comunicació que utilitza el protocol estàndard XMPP, encarregat d'executar els processos de senyalització web i l'enviament de missatgeria interna instantània de les sales de reunió.
*   **Paràmetres de Configuració de l'Entorn de Xarxa:** Les definicions de xarxa de la plataforma s'allotgen de forma centralitzada al fitxer de configuració d'entorn d'usuari `.env` localitzat a la ruta de l'administrador `/home/innovateadmin/docker-jitsi-meet/.env`, havent modificat de manera específica els següents paràmetres clau per a la producció del CPD:
    ```bash
    # URL pública d'accés (Adreça IP o domini assignat a la instància d'AWS)
    PUBLIC_URL=https://video-innovatech.local:8443

    # Mapeig de ports interns de comunicació cap al contenidor frontal web
    HTTP_PORT=8000
    HTTPS_PORT=8443

    # Port de transport UDP dedicat per al Jitsi Videobridge (Flux de vídeo interactiu)
    JVB_PORT=10000
    ```
*   **Anàlisi de Còdecs i Protocols de Comunicació Interactiva:** A diferència de les plataformes de catàleg de vídeo tradicionals (com Jellyfin), Jitsi Meet no transmet fitxers estàtics allotjats a disc, sinó que gestiona el transport dinàmic de dades interactives en temps real. El disseny de la plataforma es basa en l'acoblament dels següents estàndards tècnics:
    *   *Framework WebRTC (Web Real-Time Communication):* Estàndard de codi obert integrat nativament en els navegadors d'Internet que permet la transmissió de fluxos d'àudio, vídeo i dades directament entre els terminals clients (*peer-to-peer*) o cap al servidor sense requerir la instal·lació d'aplicacions externes.
    *   *Protocol SRTP sobre UDP:* Encarregat d'encapsular i xifrar de punta a punta la totalitat del flux de vídeo i àudio emès. S'utilitza de forma estricta el protocol de transport UDP en lloc del protocol TCP per prioritzar la immediatesa de les dades, tolerant petites pèrdues de paquets a canvi d'eliminar el retard de la videotrucada.
    *   *Canal Segur HTTPS / TLS amb Certificats Digitals:* Atès que l'estàndard WebRTC bloqueja per motius de seguretat l'accés físic a elements com la càmera o el micròfon del terminal de l'usuari si la connexió no és completament segura, el Frontend de la plataforma es configura obligatòriament sota el port xifrat 443 (o 8443 extern). Les claus de seguretat s'autogeren i signen pel propi servidor en el procés de desplegament inicial de Docker.
    *   *Còdec d'Àudio Adaptatiu Opus:* S'encarrega de realitzar la compressió acústica de la veu humana de forma adaptativa. Si l'algorisme detecta fenòmens de col·lapse de xarxa o pèrdua de cobertura en algun dels usuaris, redueix automàticament la taxa de bits (*bitrate*) per evitar talls en el so.

---

### 4.4 Enginyeria de Mesura de Càrregues i Ample de Banda de Xarxa
Per tal de verificar el correcte funcionament i avaluar la resiliència del CPD d'AWS davant d'escenaris d'alta concurrència, els operaris tècnics han realitzat un seguit de proves d'estrès utilitzant binaris de diagnòstic de xarxa professional com `iperf3`, `ping` i anàlisi de fluxos.

#### Definició de la Línia Base de la Xarxa Corporativa
Les mesures inicials obtingudes directament contra la instància d'AWS reflecteixen els següents paràmetres de capacitat de referència:
*   **Capacitat Nominal de la Línia (Sostre de Xarxa):** $\sim 544,09\text{ Mbps}$.
*   **Velocitat d'Escriptura / Pujada Puntual (iperf3):** $57,3\text{ Mbps}$ de mitjana constant de flux de dades cap al servidor.
*   **Velocitat de Lectura / Descàrrega Puntual (iperf3 Reverse):** $25,9\text{ Mbps}$ nets per fil de connexió d'usuari.
*   **Latència Mitjana del Canal (Ping):** $108,05\text{ ms}$ (mostrant estabilitat absoluta amb un $0,0\%$ de pèrdua de paquets de control).

#### Matriu de Consum de Serveis Actius i Escenaris de Concurrència
Es recullen les dades netes de volum d'informació transferida i consum d'ample de banda segons el nombre d'usuaris connectats de forma simultània:

| Escenari de Prova | Nombre d'Usuaris | Temps d'Anàlisi (s) | Transferència Total (MB) | Bitrate Total (Mbps) | Transferència Neta del Servei (MB) | Bitrate Net del Servei (Mbps) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Servidor Buid (Control)** | 0 | 10,49 | 52,1 | 41,7 | 0,0 | 0,0 |
| **Streaming de Vídeo (Jellyfin)** | 1 | 10,14 | 98,5 | 81,5 | 46,4 | 39,8 |
| **Streaming de Vídeo (Jellyfin)** | 2 | 10,14 | 144,9 | 121,3 | 92,8 | 79,6 |
| **Streaming de Vídeo (Jellyfin)** | 5 | 10,14 | 284,1 | 240,7 | 232,0 | 199,0 |
| **Videoconferència (Jitsi Meet)** | 1 | 10,20 | 130,0 | 107,0 | 77,9 | 65,3 |
| **Videoconferència (Jitsi Meet)** | 2 | 10,20 | 207,9 | 172,3 | 155,8 | 130,6 |
| **Videoconferència (Jitsi Meet)** | 5 | 10,20 | 441,6 | 368,2 | 389,5 | 326,5 |

#### Avaluació de l'Impacte i Classificació del Rendiment
L'anàlisi creuada de les dades d'estrès recollides respecte al sostre de xarxa nominal de la instància d'AWS ($\sim 544\text{ Mbps}$) permet extreure les conclusions següents:
*   **Comportament de Jellyfin:** En un escenari de concurrència de 5 usuaris visualitzant contingut multimèdia 1080p simultàniament, la plataforma genera un consum de xarxa combinat de **199,0 Mbps**. Això representa el **36,5%** de la capacitat de la línia, mantenint un ampli marge disponible.
*   **Comportament de Jitsi Meet:** La videoconferència interactiva representa la càrrega de treball més exigent per a la xarxa, requerint un flux de demanada net de 65,3 Mbps per cada usuari actiu. En l'escenari més estressant d'estrès amb 5 treballadors interactuant en una mateixa sala amb vídeo i àudio transmesos simultàniament, el consum net de xarxa és de **326,5 Mbps**. Aquesta dada implica que el sistema opera consumint aproximadament el **60%** de la capacitat de la línia base, evitant fenòmens de saturació o pèrdues de paquets de veu.

*   **Classificació Formal del Sistema:** **ACCEPTABLE**
*   **Justificació Tècnica:** La infraestructura implementada a AWS és plenament viable per a la producció corporativa. Les proves d'estrès realitzades demostren que tant els recursos hardware de processament de la instància com l'encaminament de xarxa absorbeixen sense dificultat una concurrència mitjana de 5 usuaris simultanis operant en qualsevol dels serveis multimèdia implantats.

#### Propostes d'Optimització Estructural de Xarxa
Actualment, tant la plataforma Jellyfin com la suite Jitsi Meet fan ús de l'estàndard de compressió de vídeo H.264. Malgrat oferir una compatibilitat universal excel·lent, aquest còdec presenta limitacions d'eficiència en la compressió de dades per a transmissions en temps real, fet que es tradueix en bitrates elevats a la xarxa.

Es proposa com a pla de millora tècnica la migració cap al còdec de vídeo **H.265 (HEVC - High Efficiency Video Coding)** avalada pels següents motius d'enginyeria:
*   **Reducció del 50% del Trànsit Corporatiu:** L'H.265 disposa d'algorismes de compressió que dupliquen l'eficiència de l'H.264. Això permet transmetre exactament la mateixa resolució d'imatge nativa (1080p) reduint a la meitat el volum de dades enviades per segon a la xarxa.
*   **Impacte Directe en el Canal:** El consum elèctric i de dades d'un usuari actiu a Jellyfin es reduiria de 39,8 Mbps a 19,9 Mbps, mentre que la demanda individual de les videotrucades de Jitsi Meet cauria de 65,3 Mbps a aproximadament **32,6 Mbps**.
*   **Multiplicació de l'Escalabilitat Horitzontal:** En el cas crític de 5 usuaris connectats a Jitsi Meet, la demanda neta total a la xarxa es reduiria de 326,5 Mbps (60% del canal) a només **163,2 Mbps (30% de l'ús de la línia)**. Aquesta optimització duplicaria de forma immediata la capacitat de concurrència d'usuaris que la línia de $\sim 544\text{ Mbps}$ pot suportar de manera simultània sense necessitat de contractar ampliacions d'ample de banda amb el proveïdor de cloud.

---

## 5. Disseny i Implementació de la Base de Dades Relacional

### 5.1 Context i Objectius de la Base de Dades
L'operativa interna d'InnovateTech s'organitza al voltant de quatre departaments funcionals (vendes, suport tècnic, administració i logística). Amb la finalitat de dotar l'organització d'una eina transaccional unificada, es dissenya i implementa una base de dades relacional robusta orientada a complir els objectius següents:
1.  **Gestió del Personal i Organització:** Control centralitzat de les fitxes dels treballadors, els departaments corporatius, les estructures salarials i el registre històric de les nòmines mensuals emeses.
2.  **Registre de Comunicacions i Serveis:** Inventari automatitzat del catàleg de vídeo, control d'enllaços d'àudio, registre transaccional complet de les videotrucades realitzades pels usuaris i integració d'auditories de proves de xarxa de banda.
3.  **Seguretat, Privilegis i Control d'Accés:** Arquitectura de seguretat basada en rols (RBAC), control automàtic de quotes de serveis mitjançant triggers, taules lògiques de registre d'avisos de seguretat i execució d'esdeveniments programats de backup.

**Justificació del SGBD i Entorn de Desplegament:** La base de dades s'ha implementat utilitzant el motor relacional **MariaDB**, integrat en una instància virtual pròpia d'Amazon EC2 (`t3.small`) executant el sistema operatiu Ubuntu Server. Es descarta formalment el desplegament del servei sobre la plataforma gestionada Amazon RDS (Relational Database Service). Aquesta decisió de disseny respon a una estratègia d'optimització de costos, evitant les altes taxes de facturació mensuals que comporta RDS en entorns acadèmics o fases inicials de projectes, assumint l'administració directa del motor, la seguretat de l'SGBD i l'orquestració de les còpies de seguretat a nivell de sistema operatiu.

---

### 5.2 Esquema de Model Relacional (Estructura de Taules)
A partir de la derivació lògica del Diagrama Entitat-Relació (E/R), es defineix l'esquema relacional complet, explicitant per a cada entitat el conjunt d'atributs, Clau Primària (PK) i restriccions de Clau Forana (FK):

1.  **Departaments** (Estructura de l'organigrama empresarial):
    *   `codi_departament` (int, PK, NOT NULL)
    *   `nom_departament` (varchar(100), NOT NULL, UNIQUE)
    *   `telefon_departament` (varchar(20))
2.  **Grup_Nivell** (Definició de categories professionals i salaris base):
    *   `id_grup` (int, PK, NOT NULL)
    *   `nom_grup` (varchar(50), NOT NULL)
    *   `salari_base` (decimal(10,2), NOT NULL)
3.  **Empleats** (Registre de les fitxes del personal internal de l'empresa):
    *   `dni` (varchar(9), PK, NOT NULL)
    *   `nom` (varchar(50), NOT NULL)
    *   `cognoms` (varchar(100), NOT NULL)
    *   `adreca` (varchar(150))
    *   `telefon` (varchar(20))
    *   `codi_departament` (int, NOT NULL)
    *   `id_grup` (int, NOT NULL)
    *   *Restriccions:*
        *   `FK_Empleats_Departaments`: `codi_departament` $\longrightarrow$ `Departaments(codi_departament)`
        *   `FK_Empleats_GrupNivell`: `id_grup` $\longrightarrow$ `Grup_Nivell(id_grup)`
4.  **Nomines** (Registre mensual d'emissions de pagaments associats al personal):
    *   `id_nomina` (int, PK, AUTO_INCREMENT)
    *   `dni_empleat` (varchar(9), NOT NULL)
    *   `mes` (int, NOT NULL)
    *   `any` (int, NOT NULL)
    *   `import_total` (decimal(10,2), NOT NULL)
    *   *Restriccions:*
        *   `FK_Nomines_Empleats`: `dni_empleat` $\longrightarrow$ `Empleats(dni)`
5.  **Clients** (Registre d'empreses i contactes externs de l'organització):
    *   `id_client` (int, PK, NOT NULL)
    *   `nom_empresa` (varchar(100), NOT NULL)
    *   `contacte` (varchar(100))
    *   `email` (varchar(100), UNIQUE)
    *   `telefon` (varchar(20))
6.  **Productes** (Catàleg comercial de productes de l'empresa):
    *   `id_producte` (int, PK, NOT NULL)
    *   `nom` (varchar(100), NOT NULL)
    *   `descripcio` (text)
    *   `preu` (decimal(10,2), NOT NULL)
7.  **Comandes** (Transaccions de vendes realitzades pels clients):
    *   `id_comanda` (int, PK, NOT NULL)
    *   `id_client` (int, NOT NULL)
    *   `data_comanda` (datetime, NOT NULL)
    *   `total` (decimal(10,2), NOT NULL)
    *   *Restriccions:*
        *   `FK_Comandes_Clients`: `id_client` $\longrightarrow$ `Clients(id_client)`
8.  **Cistell** (Registre temporal o persistent de productes seleccionats pels clients):
    *   `id_cistell` (int, PK, NOT NULL)
    *   `id_client` (int, NOT NULL)
    *   `id_producte` (int, NOT NULL)
    *   `quantitat` (int, NOT NULL)
    *   *Restriccions:*
        *   `FK_Cistell_Clients`: `id_client` $\longrightarrow$ `Clients(id_client)`
        *   `FK_Cistell_Productes`: `id_producte` $\longrightarrow$ `Productes(id_producte)`
9.  **Usuaris** (Comptes lògics del sistema de comunicació intern i extern):
    *   `id_usuari` (int, PK, NOT NULL)
    *   `nom_complet` (varchar(150), NOT NULL)
    *   `email` (varchar(100), NOT NULL, UNIQUE)
    *   `extensio_trucades` (varchar(10), UNIQUE)
    *   `estat` (varchar(20), NOT NULL) — Valors: 'actiu', 'bloquejat'
    *   `enllac_trucada` (varchar(255))
    *   `tipus_usuari` (varchar(30), NOT NULL) — Valors: 'client_extern', 'treballador_intern'
    *   `rol` (varchar(30)) — Valors: 'admin', 'vendes', 'administracio', 'treballador'
    *   `dni_empleat` (varchar(9), NULL)
    *   `id_client` (int, NULL)
    *   `limit_minuts_mes` (int, NOT NULL, DEFAULT 1000)
    *   `limit_trucades_dia` (int, NOT NULL, DEFAULT 50)
    *   *Restriccions:*
        *   `FK_Usuaris_Empleats`: `dni_empleat` $\longrightarrow$ `Empleats(dni)`
        *   `FK_Usuaris_Clients`: `id_client` $\longrightarrow$ `Clients(id_client)`
10. **Grup_Qualitat** (Perfils de configuració multimèdia amb degradació jeràrquica):
    *   `id_qualitat` (int, PK, NOT NULL)
    *   `nom_perfil` (varchar(50), NOT NULL) — Valors: 'alta', 'mitja', 'baixa'
    *   `resolucio` (varchar(20), NOT NULL)
    *   `bitrate` (varchar(20), NOT NULL)
    *   `id_qualitat_inferior` (int, NULL)
    *   *Restriccions:*
        *   `FK_GrupQualitat_Autoreferencial`: `id_qualitat_inferior` $\longrightarrow$ `Grup_Qualitat(id_qualitat)`
11. **Configuracio_Servidor** (Paràmetres tècnics d'operació de les suites de comunicació):
    *   `id_configuracio` (int, PK, NOT NULL)
    *   `parametre` (varchar(100), NOT NULL, UNIQUE)
    *   `valor` (varchar(255), NOT NULL)
    *   `port` (int)
    *   `protocol` (varchar(20))
    *   `descripcio` (text)
12. **Registre_Trucades** (Historial transaccional de trucades i videotrucades de la suite):
    *   `id_trucada` (int, PK, AUTO_INCREMENT)
    *   `id_origen` (int, NOT NULL)
    *   `id_destinacio` (int, NOT NULL)
    *   `data_hora_inici` (datetime, NOT NULL)
    *   `data_hora_fi` (datetime)
    *   `durada_minuts` (int)
    *   `id_qualitat` (int, NOT NULL)
    *   `puntuacio` (int, CHECK (puntuacio >= 1 AND puntuacio <= 5))
    *   `comentari` (text)
    *   *Restriccions:*
        *   `FK_Trucades_Origen`: `id_origen` $\longrightarrow$ `Usuaris(id_usuari)`
        *   `FK_Trucades_Desti`: `id_destinacio` $\longrightarrow$ `Usuaris(id_usuari)`
        *   `FK_Trucades_Qualitat`: `id_qualitat` $\longrightarrow$ `Grup_Qualitat(id_qualitat)`
13. **Videos_Streaming** (Catàleg i inventari del servei de vídeo Jellyfin):
    *   `id_video` (int, PK, NOT NULL)
    *   `titol` (varchar(150), NOT NULL)
    *   `descripcio` (text)
    *   `categoria` (varchar(50))
    *   `durada_minuts` (int, NOT NULL)
    *   `data_publicacio` (date)
    *   `enllac_servidor` (varchar(255), NOT NULL)
14. **Mesura_Banda** (Auditoria tècnica d'estat de les línies realitzada pels operaris):
    *   `id_mesura` (int, PK, AUTO_INCREMENT)
    *   `data_hora` (datetime, NOT NULL)
    *   `id_usuari_mesurat` (int, NOT NULL)
    *   `equip_mesurat` (varchar(100), NOT NULL)
    *   `velocitat_baixada` (decimal(6,2), NOT NULL)
    *   `velocitat_pujada` (decimal(6,2), NOT NULL)
    *   `latencia` (decimal(5,2), NOT NULL)
    *   `resultat` (varchar(20), NOT NULL) — Valors: 'acceptable', 'no acceptable'
    *   `id_operari` (int, NOT NULL)
    *   `observacions` (text)
    *   *Restriccions:*
        *   `FK_Mesura_Usuari`: `id_usuari_mesurat` $\longrightarrow$ `Usuaris(id_usuari)`
        *   `FK_Mesura_Operari`: `id_operari` $\longrightarrow$ `Usuaris(id_usuari)`
15. **Taula_Avisos** (Registre d'auditoria d'intents d'accessos o modificacions denegades):
    *   `id_avis` (int, PK, AUTO_INCREMENT)
    *   `id_usuari` (int, NOT NULL)
    *   `taula_afectada` (varchar(50), NOT NULL)
    *   `operacio_intentada` (varchar(20), NOT NULL) — Valors: 'INSERT', 'UPDATE', 'DELETE'
    *   `data_hora` (datetime, NOT NULL)
    *   `detall_error` (varchar(255))
    *   *Restriccions:*
        *   `FK_Avisos_Usuaris`: `id_usuari` $\longrightarrow$ `Usuaris(id_usuari)`
16. **Control_Backups** (Registre i control del resultat de les còpies de seguretat diàries):
    *   `id_backup` (int, PK, AUTO_INCREMENT)
    *   `data_hora` (datetime, NOT NULL)
    *   `taules_incloses` (varchar(255), NOT NULL)
    *   `resultat` (varchar(20), NOT NULL) — Valors: 'Èxit', 'Error'
    *   `ruta_fitxer` (varchar(255), NOT NULL)

*   **Sincronització del Catàleg Automàtic (Jellyfin API Integration):** Com a millora, s'ha implementat un script escrit en llenguatge Python (`sincronizar_jellyfin.py`) a la ruta `/opt/`. Aquest script s'executa en segon pla de forma programada cada 5 minuts (`*/5 * * * *`) a través del dimoni `cron` del sistema operatiu Linux. El codi connecta de manera automatitzada contra l'API web de Jellyfin, extreu les noves entrades de vídeo i realitza les operacions transaccionals d'inserció de dades a la taula `Videos_Streaming` de la base de dades MariaDB de forma desatesa.

---

### 5.3 Model de Seguretat Basat en Rols (RBAC)
Es dissenya una matriu de control d'accés lògic basat en rols (RBAC) definida mitjançant sentències SQL al fitxer `rols_db.sql`. Els privilegis s'estructuren de la forma següent:

| Rol de l'SGBD | Permisos Principals Assignats (Sentències GRANT) | Restriccions de Seguretat i Àmbit de Control |
| :--- | :--- | :--- |
| **admin** | `ALL PRIVILEGES` sobre la totalitat de les taules del sistema i dret d'assignació `WITH GRANT OPTION`. Privilegi especial `GRANT FILE` obligatori per a operacions físiques d'exportació de fitxers de backup. | Accés global a l'SGBD. Administració directa de comptes d'usuari i capacitat de purga de logs d'auditoria a la taula `Taula_Avisos`. |
| **vendes** | `SELECT`, `INSERT`, `UPDATE` sobre les taules transaccionals: `Clients`, `Comandes`, `Productes`, `Cistell` i `Registre_Trucades`. | Bloqueig absolut d'accés cap a les taules de gestió interna de personal (`Empleats`), estructures de salaris o taules de nòmines de l'empresa. |
| **administracio** | `SELECT`, `INSERT`, `UPDATE` sobre les taules d'estructura organitzativa i personal: `Empleats`, `Nomines`, `Departaments` i `Grup_Nivell`. | Restricció d'accés total sobre les taules comercials de clients de l'empresa i impossibilitat d'interactuar o inicialitzar llistats a la suite de videotrucades. |
| **treballador** | `SELECT` de consulta sobre les taules del catàleg: `Productes`, `Videos_Streaming` i `Configuracio_Servidor`. Permís d'escriptura `INSERT` i `UPDATE` restringit exclusivament a la taula `Registre_Trucades` per registrar la pròpia activitat. | Bloqueig de modificació de dades personals, consulta de registres econòmics de nòmines i lectura de fitxes de clients externs. |

---

### 5.4 Automatització de l'Alta d'Usuaris de l'SGBD
Es desenvolupa un script interactiu d'enginyeria en llenguatge Python denominat `crear_usuaris.py`, allotjat per a ús exclusiu de l'administrador de sistemes a la ruta de binaris globals de Linux `/usr/local/bin/crear_usuaris`. L'aplicació automatitza l'alta d'operadors a la instància MariaDB executant el flux lògic següent:
1.  **Captura i Validació Integrada:** Sol·licita per consola el nom del nou usuari, la contrasenya complexa i el perfil d'accés requerit, validant que el rol s'ajusti estrictament a la llista d'estàndards definits (`admin`, `vendes`, `administracio`, `treballador`). En cas de rol erroni o d'usuari preexistent al diccionari de dades, l'script gestiona l'error i avorta la transacció de forma segura.
2.  **Generació de Fitxer d'Auditoria SQL:** Genera automàticament un script de bases de dades a la ruta `/usr/local/bin/usuaris_generats.sql` que conté les instruccions estructurades en format text pla: `CREATE USER IF NOT EXISTS 'usuari'@'localhost' IDENTIFIED BY 'contrasenya';`.
3.  **Assignació de Rols i Privilegis:** Executa de manera directa les instruccions de seguretat `GRANT 'rol' TO 'usuari'@'localhost';` i estableix la directiva de sessió `SET DEFAULT ROLE 'rol' FOR 'usuari'@'localhost';`. Això garanteix que, en iniciar la sessió el treballador, els permisos continguts en el rol s'activin automàticament sense requerir l'execució manual de comandaments d'activació.

---

### 5.5 Arquitectura de Seguretat Avançada: Triggers d'Auditoria i Quotes
Es detalla la implementació lògica dels triggers programats en l'SGBD MariaDB per garantir el compliment de les polítiques de seguretat de l'empresa:

*   **Control de Quota de Comunicacions Mensual (Triggers BEFORE INSERT):** S'activa un trigger sobre la taula `Registre_Trucades`. Abans d'autoritzar la inserció del nou registre de trucada, el codi realitza un sumatori dels minuts consumits per l'usuari durant el mes en curs. Si el recompte supera el valor contingut a l'atribut `limit_minuts_mes` del seu perfil, l'SGBD llança una sentència de cancel·lació de transacció `SIGNAL SQLSTATE '45000'`, bloqueja de forma lògica la trucada i inserta de forma automàtica una traça d'alarma a la taula `Taula_Avisos`.
*   **Control de Quota Diària de Trucades:** Un trigger homòleg avalua el nombre total de trucades llançades pel compte durant la data vigent. Si el recompte supera el valor `limit_trucades_dia`, es bloqueja de forma immediata la inserció del registre transaccional.
*   **Bloqueig Lògic de Comptes d'Usuari:** S'implanta un trigger que avalua l'estat d'operació de l'usuari originador de la trucada. Si l'atribut `estat` de la taula `Usuaris` reflecteix el valor de `bloquejat` (ja sigui per sanció temporal o baixa indefinida de l'empresa), es denega l'escriptura a la taula, impedint de forma lògica l'ús de les suites de comunicació.
*   **Auditoria de Privilegis i Violació de Rols (Data Modification Logs):** Es despleguen triggers que actuen davant de qualsevol intent d'escriptura o modificació de dades en taules protegides. Si un operador que té assignat el rol de `treballador` o `vendes` intenta forçar de manera directa modificacions sobre la taula de `Nomines`, dades salarials de `Grup_Nivell` o paràmetres d'identitat de l'SGBD, el trigger bloqueja l'acció i inserta un registre detallat a la taula `Taula_Avisos` capturant el nom de l'usuari de la sessió de l'SGBD, la taula afectada, la instrucció executada (`INSERT`, `UPDATE`), la data i hora exacta i el text del detall de la violació del perfil. Un control idèntic s'aplica si un compte d'usuari associat al perfil de `administracio` intenta llançar consultes o extreure dades de la taula de trucades privades de clients.

---

### 5.6 Automatització de Còpies de Seguretat (Events Periòdics de l'SGBD)
La salvaguarda física de les estructures de dades crítiques corporatives s'orquestra combinant components del motor relacional i del propi sistema operatiu de la instància d'AWS:

*   **Planificació de Tasques d'Emergència:** Es descarta l'ús d'events interns de l'SGBD en cas de requerir escriptura física a disc a causa de les restriccions de seguretat de l'entorn de producció, implementant un script d'enginyeria en Bash denominat `backup_dades.sh` localitzat a la ruta de control `/usr/local/bin/`. L'script s'executa de manera desatesa en règim diari a les 02:00 AM (configurat en el servei de Crontab del sistema operatiu: `0 2 * * *`).
*   **Procediment d'Exportació Clean de Dades:** L'script executa connexions internes i calcula de forma dinàmica el següent identificador secuencial correlatiu (`id_backup`) avaluant l'historial. Posteriorment, llança de forma seqüencial la instrucció professional de MariaDB:
    ```sql
    SELECT * INTO OUTFILE '/var/lib/mysql-files/backup_taula.csv'
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    FROM taula;
    ```
    L'exportació a fitxers estructurats en format text `.csv` s'executa de forma unificada per a les quatre taules crítiques del negoci de l'organització: `Empleats`, `Clients`, `Comandes` i `Registre_Trucades`.
*   **Registre de Control i Traçabilitat:** Un cop finalitzat el procés de bolcat de dades físic a disc, l'script insereix de forma automàtica un registre de control a la taula `Control_Backups`, desant el timestamp exacte de finalització de la còpia, el llistat textual de les taules contingudes a l'exportació, la ruta absoluta del sistema de fitxers on s'ha desat l'arxiu i el resultat final de l'operació codificat sota els valors d'**Èxit** o **Error**, oferint un historial complet per a auditors externs de seguretat.
