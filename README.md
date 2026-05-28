# proves md

<a name="indice"></a>
# Índice

    * [1. Seguretat Física](#1-seguretat-fisica)
      * [A. Control d’Accés Físic](#a-control-d-acces-fisic)
      * [B. Videovigilància (CCTV)](#b-videovigilancia-cctv)
      * [C. Sistemes de Prevenció, Detecció i Supressió d'Incendis i Contingències](#c-sistemes-de-prevencio-deteccio-i-supressio-d-incendis-i-contingencies)
      * [D. Vies d'Evacuació](#d-vies-d-evacuacio)
      * [E. Diagrames i Planells (Proposta de Disseny per a Markdown)](#e-diagrames-i-planells-proposta-de-disseny-per-a-markdown)
  * [2. Seguretat Lògica](#2-seguretat-logica)
    * [A. Restricció d'Accés per Autorització](#a-restriccio-d-acces-per-autoritzacio)
    * [B. Firewalls (Tallafocs)](#b-firewalls-tallafocs)
    * [C. Monitorització](#c-monitoritzacio)
    * [D. Còpies de Seguretat (Backups)](#d-copies-de-seguretat-backups)
    * [E. RAIDs (Redundant Array of Independent Disks)](#e-raids-redundant-array-of-independent-disks)
* [1. PROPOSTA DE CPD: INFRAESTRUCTURA IT I ELÈCTRICA](#1-proposta-de-cpd-infraestructura-it-i-electrica)
  * [1.1 MATRIU DE DEPENDÈNCIES I INTERRELACIONS DEL CPD](#11-matriu-de-dependencies-i-interrelacions-del-cpd)
  * [1.2 INFRAESTRUCTURA IT](#12-infraestructura-it)
    * [1.2.1 Servidors: Segregació de Rols i Models de Maquinari](#121-servidors-segregacio-de-rols-i-models-de-maquinari)
    * [1.2.3 Estructuració dels Racks i Fluxos de Comunicació (Rack Elevation)](#123-estructuracio-dels-racks-i-fluxos-de-comunicacio-rack-elevation)
      * [Distribució de l'Alçada dels Racks (Plànol d'Elevació)](#distribucio-de-l-alcada-dels-racks-planol-d-elevacio)
  * [1.3 INFRAESTRUCTURA ELÈCTRICA](#13-infraestructura-electrica)
    * [1.3.1 Sistemes d’Alimentació Redundant (Ruta A+B)](#131-sistemes-d-alimentacio-redundant-ruta-ab)
    * [1.3.2 Càlcul de Capacitat del SAI (UPS) i Autonomia de Bateries](#132-calcul-de-capacitat-del-sai-ups-i-autonomia-de-bateries)
      * [Pas 1: Determinació de la Càrrega Activa Total](#pas-1-determinacio-de-la-carrega-activa-total)
      * [Pas 2: Aplicació del Marge de Seguretat (Factor d'Escalabilitat)](#pas-2-aplicacio-del-marge-de-seguretat-factor-d-escalabilitat)
      * [Pas 3: Dimensionament Individual dels SAIs (Volt-Ampers)](#pas-3-dimensionament-individual-dels-sais-volt-ampers)
      * [Pas 4: Càlcul del Banc de Bateries (Exemple sobre el Rack 2, el de màxima càrrega)](#pas-4-calcul-del-banc-de-bateries-exemple-sobre-el-rack-2-el-de-maxima-carrega)
      * [Pas 5: Càlcul de la Capacitat en Ampers-Hora (Ah)](#pas-5-calcul-de-la-capacitat-en-ampers-hora-ah)

---

<div align="justify">

1 Proposta de CPD <br><br>
</div>

<a name="1-seguretat-fisica"></a>
### <a href="#1-seguretat-fisica">1. Seguretat Física</a>
[↑ Volver al índice](#indice)



<a name="a-control-d-acces-fisic"></a>
#### <a href="#a-control-d-acces-fisic">A. Control d’Accés Físic</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Per evitar la intrusió de personal no autoritzat i garantir la continuïtat del negoci, s'estableix un sistema de control d’accés mitjançant barreres amb diferents nivells de seguretat:<br><br>
* Registre d’entrada: Control d'accés perimetral amb un registre centralitzat i obligatori de totes les visites i del personal.
* Perímetre exterior: Control mitjançant targetes d’identificació i RFID intel·ligents per al personal general de l'empresa.
* Perímetre del CPD: Requerirà nivells d'autenticació biomètrics restringits exclusivament als administradors autoritzats.
* Accés als racks de servidors: Armaris bloquejats mecànicament amb sensors d’obertura, registre lògic d’accés i protecció física del sistema de cablejat.

</div>

<a name="b-videovigilancia-cctv"></a>
#### <a href="#b-videovigilancia-cctv">B. Videovigilància (CCTV)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

El CPD incorpora un circuit tancat de televisió (CCTV) intel·ligent amb càmeres de seguretat per a una cobertura integral.<br><br>
* Característiques principals:
* Càmeres IP amb resolució 4K.
* Visió nocturna infraroja.
* Enregistrament continu i monitorització 24/7.
* Zones monitoritzades:
* Entrades, sortides i punts d'accés crítics.
* Passadissos freds i calents dins de la sala de racks.
* Sala elèctrica i de sistemes de suport.
* Retenció de dades: Emmagatzematge dels enregistraments durant un mínim de 30 dies en compliment amb les normatives vigents de protecció de dades (RGPD/LOPDGDD).

</div>

<a name="c-sistemes-de-prevencio-deteccio-i-supressio-d-incendis-i-contingencies"></a>
#### <a href="#c-sistemes-de-prevencio-deteccio-i-supressio-d-incendis-i-contingencies">C. Sistemes de Prevenció, Detecció i Supressió d'Incendis i Contingències</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Garanteix la integritat del maquinari combinant la seguretat ambiental i les precaucions antiincendis:<br><br>
* Detecció Avançada (VESDA): Sistema d'aspiració d'alta sensibilitat capaç d'identificar partícules de sobreescalfament abans de la generació de flames actives.
* Supressió per Gas Inert (FK-5-1-12): Sistema d'extinció automàtic per inundació total que redueix l'oxigen o absorbeix la calor sense deixar residus i sense fer malbé el material informàtic ni el cablatge.
* Mesures de contenció ambiental: Aïllament estructural amb parets i portes tallafocs amb certificació RF-120 (resistents durant 120 minuts), acompanyat de sistemes de control davant d'inundacions i terratrèmols.

</div>

<a name="d-vies-d-evacuacio"></a>
#### <a href="#d-vies-d-evacuacio">D. Vies d'Evacuació</a>
[↑ Volver al índice](#indice)

<div align='justify'>

* Rutes senyalitzades: Establiment de vies d'evacuació perfectament lliures d'obstacles i clarament il·luminades mitjançant llums LED d'emergència autònomes de baix consum.
* Portes de sortida d'emergència: Equipades amb barres antipànic d'obertura exclusiva des de l'interior cap a l'exterior, interconnectades amb el sistema de control d'accessos per al seu alliberament automàtic en cas d'evacuació declarada.

</div>

<a name="e-diagrames-i-planells-proposta-de-disseny-per-a-markdown"></a>
#### <a href="#e-diagrames-i-planells-proposta-de-disseny-per-a-markdown">E. Diagrames i Planells (Proposta de Disseny per a Markdown)</a>
[↑ Volver al índice](#indice)



<a name="2-seguretat-logica"></a>
## <a href="#2-seguretat-logica">2. Seguretat Lògica</a>
[↑ Volver al índice](#indice)



<a name="a-restriccio-d-acces-per-autoritzacio"></a>
### <a href="#a-restriccio-d-acces-per-autoritzacio">A. Restricció d'Accés per Autorització</a>
[↑ Volver al índice](#indice)



<a name="b-firewalls-tallafocs"></a>
### <a href="#b-firewalls-tallafocs">B. Firewalls (Tallafocs)</a>
[↑ Volver al índice](#indice)



<a name="c-monitoritzacio"></a>
### <a href="#c-monitoritzacio">C. Monitorització</a>
[↑ Volver al índice](#indice)

<div align='justify'>

* Recollida de Logs: Centralització de registres d'activitat mitjançant Elastic Search, alimentat per AuditBeat en els servidors configurats per Ansible.
* Monitorització: Monitorització de intents de login fallits amb Kibana.

</div>

<a name="d-copies-de-seguretat-backups"></a>
### <a href="#d-copies-de-seguretat-backups">D. Còpies de Seguretat (Backups)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

S'aplica de forma estricta la <strong>regla 3-2-1</strong>:<br><br>
* 3 còpies de dades: Una de producció i dues rèpliques de seguretat.
* 2 suports diferents: Guardades localment en format d'emmagatzematge tradicional de blocs de disc i una segona rèplica en format d'emmagatzematge d'objectes immutable al núvol.
* 1 còpia fora de línia: Fora de les instal·lacions físiques de l'empresa per garantir la resiliència del sistema informàtic.

</div>

<a name="e-raids-redundant-array-of-independent-disks"></a>
### <a href="#e-raids-redundant-array-of-independent-disks">E. RAIDs (Redundant Array of Independent Disks)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Per evitar que la fallada d'un component físic provoqui una interrupció lògica del servei o la pèrdua d'informació, els servidors utilitzen arquitectures de discs redundants:<br><br>
* RAID locals per a Sistemes Operatius: Els discs connectats directament a cada servidor s'estructuren en RAID 1 (Mirall), de manera que si un disc falla, l'altre manté l'equip en funcionament permetent la substitució del maquinari defectuós en calent.
* RAID massius per a dades (Matrius de discs): L'emmagatzematge centralitzat de producció es configura mitjançant combinacions avançades com RAID 10 (divisió de miralls) o RAID 0+1, optimitzant tant la velocitat de lectura/escriptura aleatòria com la tolerància a fallades simultànies de discs sense pèrdua de dades.

2 Implementació de la proposta de CPD a AWS.<br><br>
</div>

<a name="1-proposta-de-cpd-infraestructura-it-i-electrica"></a>
# <a href="#1-proposta-de-cpd-infraestructura-it-i-electrica">1. PROPOSTA DE CPD: INFRAESTRUCTURA IT I ELÈCTRICA</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Aquesta secció detalla el disseny tècnic definitiu de la infraestructura de Tecnologies de la Informació (IT), la topologia de xarxa i el sistema de subministrament elèctric del nou Centre de Processament de Dades (CPD) d'Innovate Tech. El disseny s'ha orientat a complir els requisits d'alta disponibilitat, segregació estricte de rols, seguretat i escalabilitat.<br><br>
</div>

<a name="11-matriu-de-dependencies-i-interrelacions-del-cpd"></a>
## <a href="#11-matriu-de-dependencies-i-interrelacions-del-cpd">1.1 MATRIU DE DEPENDÈNCIES I INTERRELACIONS DEL CPD</a>
[↑ Volver al índice](#indice)

<div align='justify'>

El disseny arquitectònic d'aquest CPD s'ha plantejat com un ecosistema interconnectat. Les decisions de dimensionament de la infraestructura IT i elèctrica tenen un impacte directe sobre la resta d'àrees del projecte.<br><br>
</div>

<a name="12-infraestructura-it"></a>
## <a href="#12-infraestructura-it">1.2 INFRAESTRUCTURA IT</a>
[↑ Volver al índice](#indice)



<a name="121-servidors-segregacio-de-rols-i-models-de-maquinari"></a>
### <a href="#121-servidors-segregacio-de-rols-i-models-de-maquinari">1.2.1 Servidors: Segregació de Rols i Models de Maquinari</a>
[↑ Volver al índice](#indice)



| Servidor / Node | Rol i Serveis Allotjats | Model de Servidor | Configuració de Maquinari Clau | Consum Nominal |
| --- | --- | --- | --- | --- |
| Servidor 1: Web & SFTP | Allotjament de la web i servei de transferència de fitxers segur. | Dell PowerEdge R450 (1U) | 1x Intel Xeon Silver 4314 (16 Cores), 64GB RAM, 2x 960GB SSD SATA (RAID 1) | 350 W |
| Servidor 2:Base de Dades (BBDD) | Motor relacional exclusiu per a la persistència de dades de l'aplicació web. Alta taxa d'I/O. | Dell PowerEdge R760 (2U) | 2x Intel Xeon Silver 4410Y (24 Cores tot.), 128GB RAM, 4x 1.2TB NVMe SSD (RAID 10) | 500 W |
| Servidor 3:Logs & SIEM | Plataforma de centralització de mètriques i seguretat (Elasticsearch, Logstash, Kibana). | Dell PowerEdge R760 (2U) | 2x Intel Xeon Silver 4414U (32 Cores tot.), 256GB RAM, 6x 2.4TB SAS (RAID 6) | 500 W |
| Servidor 4:Àudio Streaming | Difusió contínua de ràdio digital multicanal (Servidor Icecast2 + clients Ezstream). | Dell PowerEdge R450 (1U) | 1x Intel Xeon Silver 4310 (12 Cores), 64GB RAM, 2x 480GB SSD SATA (RAID 1) | 300 W |
| Servidor 5:Vídeo & Meet | Processament multimèdia i gestió de fluxos de videoconferència en temps real. | Dell PowerEdge R760 (2U) | 2x Intel Xeon Gold 5415+ (32 Cores tot.), 128GB RAM, 2x Intel DC GPU Flex 140 | 550 W |
| Servidor 6:LDAP & Auth | Servei de directori actiu centralitzat per a l'autenticació de la infraestructura (OpenLDAP). | Dell PowerEdge R450 (1U) | 1x Intel Xeon Silver 4310 (12 Cores), 32GB RAM, 2x 480GB SSD SATA (RAID 1) | 250 W |
| EmmagatzematgeCentralitzat (SAN) | Cabina de discs per a snapshots, còpies de seguretat i volums de dades persistents compartides. | Dell PowerVault ME5024 (2U) | Controladora Dual Activa, 12x 2TB HDD SAS 10K (Configuració en RAID 10) | 350 W |

<div align='justify'>

Amb l'objectiu de minimitzar el radi d'impacte en cas d'incident o fallada de programari, s'ha implementat una política estricte de segregació de rols en servidors físics independents de la gamma corporativa de Dell Technologies:1.2.2 Electrònica de Xarxa i Patch Panels<br><br>
Per evitar colls d'ampolla i eliminar punts únics de fallada (Single Points of Failure), l'arquitectura de xarxa es dissenya de la següent manera:<br><br>
* Switches principals: Es disposen 2 switches gestionables Cisco Catalyst 9300L de 48 ports Gigabit Ethernet i 4 uplinks de 10G SFP+. Funcionen configurats en mode Stack (apilament lògic), actuant com un sol equip. Si un switch físic s'avaria, el segon assumeix el trànsit instantàniament. (Consum: 150W per unitat; 300 W en total amb firewalls inclosos).
* Patch Panels: S'instal·len 2 Patch Panels de 24 ports Cat6A UTP (1U) per a la interconnexió del cablejat de coure dels servidors, i 1 Patch Panel de Fibra Òptica LC-Duplex (1U) per als enllaços de la cabina d'emmagatzematge SAN i la connexió externa cap al proveïdor d'Interne
* t (ISP).

</div>

<a name="123-estructuracio-dels-racks-i-fluxos-de-comunicacio-rack-elevation"></a>
### <a href="#123-estructuracio-dels-racks-i-fluxos-de-comunicacio-rack-elevation">1.2.3 Estructuració dels Racks i Fluxos de Comunicació (Rack Elevation)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Es disposen 2 Racks estàndard de 42U (19 polzades d'amplada, 1000 mm de profunditat) col·locats de costat sota una configuració de passadís fred / passadís calent. La distribució del maquinari s'ha optimitzat mitjançant criteris de <strong>proximitat lògica de xarxa</strong> i <strong>repartiment de la càrrega elèctrica</strong>:<br><br>
* RACK 1 (Front-End i Serveis Públics): Concentra els servidors que tenen exposició directa o reben trànsit extern des d'Internet. Això minimitza el recorregut físic dels cables cap als Firewalls FortiGate protectors i aïlla el soroll de la xarxa pública.
* RACK 2 (Back-End, Dades i Seguretat Lògica): Agrupa els servidors interns que mouen volums de dades massius (consultes a la base de dades, escriptura de milers de logs d'Auditbeat per segon i còpies de seguretat cap a la SAN). Al col·locar-los junts en el mateix switch d'aquest rack, el 80% del trànsit privat es resol localment sense haver de viatjar constantment a través del cablejat que uneix els dos racks.
* Interconnexió (Backbone): Els switches dels dos racks estan enllaçats per fibra òptica mitjançant una agregació de ports (LACP de 2 x 10G SFP+), oferint una autopista dedicada de 20 Gbps per a la comunicació interna (com les consultes del servidor Web del Rack 1 cap a la Base de Dades del Rack 2).

</div>

<a name="distribucio-de-l-alcada-dels-racks-planol-d-elevacio"></a>
#### <a href="#distribucio-de-l-alcada-dels-racks-planol-d-elevacio">Distribució de l'Alçada dels Racks (Plànol d'Elevació)</a>
[↑ Volver al índice](#indice)



| Alçada (U) | RACK 1: Front-End i Transmissió (Públic) | RACK 2: Back-End i Seguretat Lògica (Privat) |
| --- | --- | --- |
| U40 - U42 | Patch Panels de Fibra Òptica i Cat6A | Patch Panels de Distribució Interna |
| U38 - U39 | Switch Core Cisco Catalyst 9300L (Línia A) | Switch Distribució Cisco Catalyst 9300L (Línia B) |
| U35 - U36 | Firewalls FortiGate 100F (Alta Disponibilitat) | Buit de ventilació / Pasacables horitzontal |
| U25 - U26 | Servidor 5: Vídeo & Meet (2U) | Espai reservat per a ampliacions futures |
| U20 - U21 | Servidor 1: Web & SFTP (1U) | Servidor 2: Base de Dades - BBDD (2U) |
| U17 - U18 | Buit / Passacables horitzontal | Servidor 6: Directori LDAP & Auth (1U) |
| U14 - U15 | Servidor 4: Àudio Streaming (1U) | Servidor 3: Central de Logs & SIEM (2U) |
| U10 - U11 | Buit de ventilació | Cabina d'Emmagatzematge SAN PowerVault (2U) |
| U01 - U04 | Mòdul SAI APC Smart-UPS 3kVA (Línia A) | Mòdul SAI APC Smart-UPS 3kVA (Línia B) |



<a name="13-infraestructura-electrica"></a>
## <a href="#13-infraestructura-electrica">1.3 INFRAESTRUCTURA ELÈCTRICA</a>
[↑ Volver al índice](#indice)



<a name="131-sistemes-d-alimentacio-redundant-ruta-ab"></a>
### <a href="#131-sistemes-d-alimentacio-redundant-ruta-ab">1.3.1 Sistemes d’Alimentació Redundant (Ruta A+B)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Per assolir un disseny concurrentment mantenible de tolerància a Fallades (equivalent a criteris Tier III), s'estableix una arquitectura de doble línia elèctrica independent:<br><br>
* Fonts d'alimentació redundants (Dual PSU): Tots els servidors, switches i controladores de la cabina de discs incorporen dues fonts d'alimentació que funcionen en mode actiu-actiu amb repartiment de càrrega elèctrica automàtic.
* Distribució de Rutes (Línia A + Línia B): Cada rack compta amb dues barres de distribució elèctrica intel·ligents (PDU). La font d'alimentació 1 (PSU 1) de cada servidor es connecta a la línia A (SAI 1), i la font d'alimentació 2 (PSU 2) es connecta a la línia B (SAI 2). Si una de les escomeses generals elèctriques de l'edifici pateix una avaria o es crema un quadre, l'altra línia manté el node funcionant sense cap microtall.

</div>

<a name="132-calcul-de-capacitat-del-sai-ups-i-autonomia-de-bateries"></a>
### <a href="#132-calcul-de-capacitat-del-sai-ups-i-autonomia-de-bateries">1.3.2 Càlcul de Capacitat del SAI (UPS) i Autonomia de Bateries</a>
[↑ Volver al índice](#indice)

<div align='justify'>

L'objectiu de disseny elèctric determina que, davant d'una fallada elèctrica total i absoluta de la xarxa elèctrica exterior, el banc de bateries ha de mantenir la totalitat dels servidors operatius durant un temps mínim de <strong>30 minuts (0,5 hores)</strong>. Aquest temps garanteix un marge segur per a l'arrencada de grups electrògens o per realitzar un apagat controlat i seqüencial dels sistemes de fitxers i bases de dades.<br><br>
</div>

<a name="pas-1-determinacio-de-la-carrega-activa-total"></a>
#### <a href="#pas-1-determinacio-de-la-carrega-activa-total">Pas 1: Determinació de la Càrrega Activa Total</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Es desglossa i se suma el consum real en Watts de tots els elements que s'han d'alimentar simultàniament:<br><br>
* Equips del Rack 1: Servidor Web (350W) + Servidor Àudio (300W) + Servidor Video (550W) + Switches/Firewalls (300 W) = 1.500 W
* Equips del Rack 2: Servidor BBDD (500W) + Servidor Logs (500 W) + Servidor LDAP (250 W) + Emmagatzematge SAN (350 W) = 1.600 W
* Càrrega Activa Total de la Sala = 1.500 W + 1.600 W = 3.100 Watts

</div>

<a name="pas-2-aplicacio-del-marge-de-seguretat-factor-d-escalabilitat"></a>
#### <a href="#pas-2-aplicacio-del-marge-de-seguretat-factor-d-escalabilitat">Pas 2: Aplicació del Marge de Seguretat (Factor d'Escalabilitat)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

S'aplica un factor d'expansió del 20% sobre el consum actual per permetre la incorporació futura de noves unitats de computació sense sobrecarregar el sistema elèctric:<br><br>
Potència de Disseny del CPD = 3.100 W X 1,20 = 3.720 Watts (3,72 kW)<br><br>
</div>

<a name="pas-3-dimensionament-individual-dels-sais-volt-ampers"></a>
#### <a href="#pas-3-dimensionament-individual-dels-sais-volt-ampers">Pas 3: Dimensionament Individual dels SAIs (Volt-Ampers)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

Es calcula el requeriment d'energia per separat per a cada armari, considerant un factor de potència (FP) d'eficiència informàtica de 0,90 per absorbir pics d'arrencada inductius dels ventiladors:<br><br>
* Disseny de Càrrega Rack 1: 1.500 W X 1,20 = 1.800 W — 1.800W / 0,90 = 2.000 VA
* Disseny de Càrrega Rack 2: 1.600 W X 1,20 = 1.920 W — 1.920 W / 0,9 = 2.133VA

<em>Decisió d'Enginyeria:</em> Per estandarditzar components, s'instal·larà un <strong>SAI modular APC Smart-UPS de 3.000 VA (3 kVA / 2.700 W)</strong> a la base de cada rack. D'aquesta manera, tots dos disposen d'un marge de seguretat òptim superior a les exigències mínimes.<br><br>
</div>

<a name="pas-4-calcul-del-banc-de-bateries-exemple-sobre-el-rack-2-el-de-maxima-carrega"></a>
#### <a href="#pas-4-calcul-del-banc-de-bateries-exemple-sobre-el-rack-2-el-de-maxima-carrega">Pas 4: Càlcul del Banc de Bateries (Exemple sobre el Rack 2, el de màxima càrrega)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

L'energia neta que han de lliurar les bateries per subministrar una potència constant de 1.920 Watts durant 0,5 hores és:<br><br>
Energia Útil Requerida = 1.920 W X 0,5 h = 960 Wh (Watt-hores)<br><br>
Per determinar la capacitat real del banc físic de bateries, s'ha d'introduir l'eficiència de l'inversor de corrent continu a corrent altern del SAI (estimada en un 90%) i respectar el límit de descàrrega profunda de seguretat (fixat en el 80% per evitar la degradació química prematura de les cel·les de plom):<br><br>
Energia Real del Banc = 960 Wh / (0,90 X 0,80) = 1.333,3 Wh (Watt-hores)<br><br>
</div>

<a name="pas-5-calcul-de-la-capacitat-en-ampers-hora-ah"></a>
#### <a href="#pas-5-calcul-de-la-capacitat-en-ampers-hora-ah">Pas 5: Càlcul de la Capacitat en Ampers-Hora (Ah)</a>
[↑ Volver al índice](#indice)

<div align='justify'>

El bus intern de corrent continu d'un SAI professional de 3kVA treballa a una tensió nominal de 48 Volts CC (aconseguit mitjançant l'associació en sèrie de 4 bateries clàssiques de 12V):Capacitat Necessària del Banc = 1.333,3 Wh / 48 V = 27,77 Ah (Ampers-Hora)<br><br>
<strong>Conclusió del dimensionament elèctric:</strong> Cada SAI anirà connectat a un mòdul extern de bateries format per 4 unitats de 12V en sèrie. Seleccionarem el model comercial estàndard de <strong>35Ah</strong>, el qual supera folgadament el requisit de 27,77 Ah calculat, garantint que la totalitat dels 6 servidors i cabines d'Innovate Tech mantindran una disponibilitat ininterrompuda de 30 minuts davant d'una apagada general de la xarxa urbana.<br><br>
2.1 Servidor OpenLDAP<br><br>
Per centralitzar l'autenticació del projecte (com les credencials del servidor ProFTPD), s'ha desplegat un directori OpenLDAP. Tot el procés s'ha automatitzat mitjançant un fitxer mestre (main.yml) que executa dues fases:<br><br>
Fase 1: Aprovisionament d'Infraestructura a AWS (maquina.yml)<br><br>
Aquest playbook crea l'entorn de xarxa i la màquina virtual en local connectant-se a AWS:<br><br>
Filtre dinàmic: Selecciona la VPC per defecte, una subxarxa de la regió us-east-1 i la darrera AMI oficial d'Ubuntu 24.04 LTS.<br><br>
Grup de seguretat (sg_openldap): Configura el tallafocs de la instància obrint només els ports 22/TCP (SSH) per a administració i 389/TCP (LDAP) per a les consultes de directori.<br><br>
Instància i IP Fixa: Aixeca una màquina t3.small (20 GB de disc) i li assigna una Elastic IP per garantir que l'adreça pública no canviï.<br><br>
Usuari del Sistema: Crea l'usuari innovateadmin amb entorn Bash, li clona les claus SSH permeses (authorized_keys) i li dóna permisos de root sense contrasenya a /etc/sudoers.d/innovateadmin.<br><br>
Fase 2: Configuració del Directori (openldap.yml)<br><br>
Aquest playbook es connecta a la instància i configura el servei de directori de l'empresa:<br><br>
Preconfiguració amb Debconf: S'injecten les respostes del domini (innovatetech.cat), l'organització (InnovateTech) i la contrasenya d'administrador (@ITB2026) abans d'instal·lar. Això evita que l'instal·lador de Linux demani dades de forma interactiva i rompi l'automatització.<br><br>
Instal·lació i Dimoni: S'instal·len els paquets slapd i ldap-utils, i s'activa el servei perquè arrenqui automàticament amb el sistema.<br><br>
Creació d'Usuari de Servei: Es genera un fitxer de dades format LDIF (/tmp/ftpadmin.ldif) per injectar l'usuari ftpadmin sota el Distinguished Name dc=innovatetech,dc=cat. Aquest usuari servirà per validar les connexions de serveis externs sense utilitzar el compte d'administrador global.<br><br>
La implementació d'OpenLDAP centralitza la gestió d'identitats de l'empresa de forma segura, permetent que serveis com ProFTPD autentiquin els seus usuaris des d'un únic directori actiu. A més, l'automatització d'aquest entorn amb Ansible garanteix un desplegament àgil, escalable i lliure d'errors en la infraestructura d'AWS. <br><br>
2.2 Servidor web i FTP.<br><br>
Per allotjar el portal de serveis corporatiu i permetre la transferència segura de fitxers (amb l'autenticació delegada al directori actiu), s'ha desplegat un servidor híbrid Web (NGINX/PHP) i SFTP (ProFTPD). L'automatització i configuració d'aquest entorn s'ha realitzat mitjançant l'execució de tres playbooks d'Ansible:<br><br>
Fase 1: Aprovisionament d'Infraestructura i Serveis Base (1_infra_i_serveis_base.yml)<br><br>
Aquest playbook s'encarrega de preparar el terreny a AWS i instal·lar els paquets fonamentals:<br><br>
Filtre dinàmic i Grup de Seguretat: Es selecciona la darrera AMI d'Ubuntu 24.04 LTS a la regió us-east-1. Es crea el grup de seguretat innovatetech-web-sftp-sg obrint únicament els ports 22/TCP (SSH d'administració), 80/TCP (Web pública) i 2222/TCP (SFTP per a usuaris).<br><br>
Instància i IP Fixa: S'aixeca una instància t2.micro i se li vincula una Elastic IP, injectant-la automàticament a l'inventari d'Ansible per a la resta de tasques.<br><br>
Seguretat del Sistema: Es desactiva l'UFW (per evitar bloquejos natius d'Ubuntu a AWS) i es crea l'usuari innovateadmin amb accés sudo sense contrasenya i autenticació exclusiva per claus SSH públiques. A més, s'endureix el servei SSH desactivant el login per contrasenya i l'usuari root.<br><br>
Servei SFTP integrat amb LDAP: S'instal·len NGINX, PHP i ProFTPD. S'activen els mòduls mod_sftp i mod_ldap, configurant un VirtualHost al port 2222 perquè ProFTPD validi els inicis de sessió directament contra el servidor OpenLDAP central (54.174.227.251), establint RequireValidShell off i la creació dinàmica de carpetes home.<br><br>
Fase 2: Configuració de l'Aplicació Web Dinàmica (2_webapp_config.yml)<br><br>
Un cop la infraestructura base està a punt, aquest playbook desplega el codi i l'enllaça amb el motor de dades corporatiu:<br><br>
Portal d'Inici (Landing Page): Es substitueixen els fitxers per defecte de NGINX per un fitxer HTML (index.html) dissenyat a mida. Aquest actua com a menú central (CPD) per accedir a la gestió de BBDD, la plataforma d'àudio, el servidor de vídeo i les sales de Meet.<br><br>
Connexió a Base de Dades Remota: Es desplega l'script consulta_bbdd.php, el qual estableix una connexió PDO segura contra el servidor MariaDB extern (44.198.194.136).<br><br>
Dashboard i Visualització: El panell web extreu i formatta llistats d'usuaris (emmascarant dades sensibles com el DNI), el catàleg de vídeos en streaming i l'històric de trucades.<br><br>
Lògica de Negoci i Seguretat d'Accessos: S'implementa processar_trucada.php per permetre la inserció de noves trucades al registre. Aquest script inclou un sistema d'autenticació propi que comprova que l'empleat existeixi a la BBDD, verifica que el PIN coincideixi amb el seu DNI i valida que el seu rol sigui estrictament vendes abans de permetre l'escriptura.<br><br>
Fase 3: Monitoratge i Centralització de Logs (3_logs_config.yml)<br><br>
Per complir amb les normatives de ciberseguretat i auditoria de l'empresa, s'afegeix una capa de recol·lecció d'esdeveniments:<br><br>
Instal·lació de l'Agent: S'afegeixen les claus GPG i repositoris oficials d'Elastic per instal·lar Auditbeat (versió 8.x).<br><br>
Regles d'Auditoria (Auditd i FIM): Es configura l'agent per vigilar modificacions en directoris crítics del sistema (/etc, /bin, /sbin) i arxius d'identitat (passwd, shadow). També es configuren regles per registrar canvis de contrasenyes, inicis de sessió i execucions de processos (mitjançant conjunts de dades login, process i user).<br><br>
Enviament al SIEM: Tota la telemetria s'envia de manera xifrada i autenticada cap al servidor central d'Elasticsearch i Kibana (23.21.142.115), instal·lant automàticament els quadres de comandament (dashboards) per a l'equip de seguretat.<br><br>
La combinació d'aquests tres playbooks ens dona com a resultat una arquitectura robusta, integrant perfectament un frontend web de serveis amb un backend d'emmagatzematge i autenticació, garantint alhora l'escalabilitat del codi i la centralització de la seguretat gràcies a l'enviament continu de logs.<br><br>
2.3 Servidor Logs<br><br>
Per centralitzar la monitorització de seguretat s'ha desplegat l'agent Auditbeat. Aquest servei s'encarrega de recol·lectar de forma contínua els esdeveniments del sistema operatiu i enviar-los cap al clúster d'Elasticsearch centralitzat. El procés s'ha estructurat i automatitzat mitjançant playbooks d'Ansible dividits en dues fases clarament definides:<br><br>
Fase 1: Automatització del Servidor Central de Logs i Entorn Elastic<br><br>
Abans de desplegar els agents, es gestiona la infraestructura central a AWS per rebre les dades (utilitzant l'inventari inventory.ini i el playbook de provisió):<br><br>
Aprovisionament a AWS i Xarxa: Es crea la instància EC2 anomenada InnovateTech-Logs-Server (de tipus t3.large amb 50 GB de disc gp3) i es configura el grup de seguretat (elastic-security-group). Aquest obre els ports directes d'administració 22/TCP (SSH), el motor de cerca 9200/TCP (Elasticsearch) i la interfície web 5601/TCP (Kibana). Per fixar el punt de recepció de logs, se li associa la IP Elàstica pública 23.21.142.115.<br><br>
Configuració de l'Usuari del Sistema: Es connecta inicialment com a l'usuari ubuntu per crear l'usuari d'administració corporatiu innovateadmin amb entorn Bash, heretant les claus SSH autoritzades i configurant permisos de superusuari sense contrasenya (NOPASSWD) a /etc/sudoers.d/.<br><br>
Desplegament de la Pila Elastic: Es configuren els repositoris oficials d'Elastic (v8.x) per instal·lar Elasticsearch i Kibana. Es reescriuen els fitxers de configuració perquè escoltin en obert (0.0.0.0) de forma unificada (single-node). Finalment, es reestableixen de forma segura les contrasenyes del sistema, desant les credencials d'accés web de l'usuari mestre elastic al fitxer /home/innovateadmin/elastic_credentials.txt.<br><br>
Fase 2: Desplegament de l'Agent de Seguretat a Clients (Auditbeat)<br><br>
Un cop el node central està operatiu, es realitza el desplegament d'Auditbeat orientat a tots els servidors de la infraestructura excepte el propi de logs (com el servidor de bases de dades db_servers especificat a inventory.ini amb la IP 44.198.194.136):<br><br>
Instal·lació del Paquet: El playbook afegeix la clau GPG oficial d'Elastic i el seu repositori per instal·lar de manera automatitzada el paquet auditbeat mitjançant el gestor apt, garantint la homogeneïtat de versions (v8.x).<br><br>
Configuració Modular de Seguretat: Es sobreescriu el fitxer /etc/auditbeat/auditbeat.yml amb permisos d'accés molt restrictius (0600) per protegir les credencials del servidor.<br><br>
Mòdul de Sistema: Recull mètriques de l'estat del host, accessos d'usuaris (analitzant els fitxers /var/log/wtmp i /var/log/btmp per detectar inicis de sessió fallits), llistat de processos actius i canvis de contrasenyes.<br><br>
Connexió i Orquestració de Dashboards: Es defineix la sortida de les dades cap a la IP elàstica del servidor de logs utilitzant l'usuari elastic i la contrasenya xifrada del clúster. Durant el primer desplegament, s'executa l'ordre auditbeat setup per carregar automàticament els taulers de control (dashboards) interactius a Kibana. El servei es deixa actiu i habilitat en l'arrencada del sistema amb un handler automatitzat que reinicia el dimoni davant de qualsevol canvi de configuració.<br><br>
3 Implantació dels serveis d'àudio i vídeo <br><br>
`3``.1 Descripció general `<br><br>
<strong>InnovateTech </strong>requereix la implantació d’una infraestructura de serveis multimèdia dins del seu Centre de Processament de Dades (CPD), amb l’objectiu de donar suport a la comunicació interna, la formació corporativa i la distribució de continguts als clients. <br><br>
Aquesta infraestructura haurà de permetre: <br><br>
● La distribució de continguts d’àudio en streaming. <br><br>
● La distribució de continguts de vídeo en streaming. <br><br>
● La realització de videoconferències. <br><br>
● L’accés als serveis tant des de clients locals com mitjançant navegadors web. ● La integració amb el sistema de comunicació interna definit a l’apartat corresponent del projecte. <br><br>
Els serveis s’hauran d’implantar utilitzant tecnologies estàndard i configuracions realistes d’entorn empresarial. <br><br>
<strong>  2. Implantació del servei d’àudio – RA7 </strong><br><br>
<strong>  Objectiu </strong><br><br>
Implementar un servei d’àudio que permeti la transmissió en temps real o sota demanda, accessible des d’un client i, si és possible, també des del navegador<br><br>
1. Descriviu breument la funcionalitat del servei d’àudio escollit. <br><br>
`S'ha escollit Icecast2 com a servidor principal i Ezstream com a client d'origen (source client). Icecast2 és un servidor de streaming multimèdia que actua com a distribuïdor: rep un flux d'àudio d'un o diversos "source clients" i el transmet simultàniament a tots els oients que s'hi connecten per HTTP. És altament escalable i estàndard en ràdios per internet.`<br><br>
2. Instal·leu un servidor d’àudio, com ara Icecast o equivalent. <br><br>
`La instal·lació d'Icecast2 s'ha automatitzat mitjançant Ansible en un servidor Ubuntu 24.04 (AWS EC2). S'ha utilitzat el paquet ``debconf-utils`` per preconfigurar de forma desatesa (silenciosa) els paràmetres crítics durant la instal·lació, com el nom de la màquina i les contrasenyes d'administració (``AdminPassword2026!``) i d'emissió (``SourcePassword2026!``). Després s'ha instal·lat el paquet mitjançant el gestor APT. `<br><br>
3. Configureu el servei perquè permeti com a mínim un canal d’àudio funcional. <br><br>
`Icecast2 s'ha configurat perquè estigui disponible públicament reemplaçant la directiva &lt;bind-address&gt;127.0.0.1&lt;/bind-address&gt; per &lt;bind-address&gt;0.0.0.0&lt;/bind-address&gt; al seu fitxer principal. A més, a través del programari d'emissió, s'han generat dos canals independents i funcionals:`<br><br>
`/radio: Canal principal d'emissió contínua.`<br><br>
`/premium: Canal de contingut alternatiu.`<br><br>
4. Instal·leu i configureu el client/source client necessari per enviar l’àudio al servidor. <br><br>
`S'ha instal·lat Ezstream via APT. Per automatitzar l'enviament d'àudio cap a l'Icecast:`<br><br>
`S'han descarregat fitxers d'àudio de prova al directori /etc/ezstream/.`<br><br>
`S'han generat fitxers de llista de reproducció (.txt) apuntant als arxius descarregats.`<br><br>
`S'han creat fitxers XML de configuració d'Ezstream on s'especifica l'adreça local (127.0.0.1:8000), la contrasenya del "source" i els punts de muntatge de cada canal.`<br><br>
`S'han creat serveis systemd (ezstream-radio.service i ezstream-premium.service) per garantir que el client d'origen s'executi automàticament i en bucle al servidor.`<br><br>
5. Utilitzeu com a mínim un format d’àudio digital: MP3, AAC o OGG. <br><br>
`El sistema s'ha configurat per utilitzar el format MP3. Les cançons descarregades per a les proves tenen extensió .mp3 i la configuració d'Ezstream declara explícitament l'etiqueta &lt;format&gt;MP3&lt;/format&gt; abans de fer l'enviament al servidor Icecast.A més, un cop comprovat el correcte funcionament dels audios de provas, hem pujat una serie de cançons amb format mp3 i modificat els arxius de playlist de cada canal per incloure-les.`<br><br>
6. Comproveu el consum del streaming des d’un client. <br><br>
`Hem comprovat que al client es poden escoltar els dos canals correctamnet i sense talls. A la vegada hem comprovat l’Ample de banda que ocupa el fet de tenir mes o menys clients, i la conclusió es que la diferència és mínima. Poden haber-hi molts clients escoltant les radios sense problemes.`<br><br>
7. Verifiqueu l’accés via navegador web. <br><br>
`S'ha desplegat un servidor NGINX configurat com a proxy invers al port 80. Aquest proxy redirigeix tot el trànsit transparentment cap al port 8000 d'Icecast. Això permet que els usuaris no hagin d'obrir ports especials.`<br><br>
`A més, s'ha injectat un fitxer index.html personalitzat a /usr/share/icecast2/web/ que proporciona una interfície gràfica HTML5, permetent escoltar qualsevol dels dos canals directament des d'un navegador web convencional visitant http://&lt;IP_ELASTICA_DEL_SERVIDOR&gt;.`<br><br>
8. Documenteu tots els fitxers de configuració modificats. <br><br>
`Aquests són els fitxers que s'han creat o modificat respecte a la instal·lació base per fer funcionar la plataforma:`<br><br>
`/etc/icecast2/icecast.xml: S'ha modificat la directiva &lt;bind-address&gt; a 0.0.0.0.`<br><br>
`/etc/nginx/sites-available/default: S'ha reescrit totalment per fer un proxy invers (proxy_pass) cap a http://127.0.0.1:8000.`<br><br>
`/usr/share/icecast2/web/index.html: Sobrescrit amb una pàgina web pròpia continguent les etiquetes &lt;audio&gt; d'HTML5.`<br><br>
`/etc/ezstream/ezstream_radio.xml i /etc/ezstream/ezstream_premium.xml: Fitxers creats per definir com Ezstream es connecta a l'Icecast per cada canal.`<br><br>
`/etc/ezstream/playlist_radio.txt i /etc/ezstream/playlist_premium.txt: Llistes de reproducció amb les rutes absolutes als .mp3.`<br><br>
`/etc/systemd/system/ezstream-radio.service i /etc/systemd/system/ezstream-premium.service: Fitxers units de Systemd creats per gestionar l'emissió com a serveis del sistema.`<br><br>
9. Afegiu captures de pantalla del servei funcionant. <br><br>
</div>

<p align="center">
  <img src="images/img_1.png" alt="Imagen 1" />
</p>

<div align="justify">
<strong>Evidències obligatòries </strong><br><br>
● Captura del servidor d’àudio instal·lat. <br><br>
</div>

<p align="center">
  <img src="images/img_2.png" alt="Imagen 2" />
</p>

<div align="justify">
● Captura de la configuració del servei. (Configuració completa als playbooks al Github)<br><br>
</div>

<p align="center">
  <img src="images/img_3.png" alt="Imagen 3" />
</p>



<p align="center">
  <img src="images/img_4.png" alt="Imagen 4" />
</p>



<p align="center">
  <img src="images/img_5.png" alt="Imagen 5" />
</p>

<div align="justify">
● Captura del source client funcionant. <br><br>
</div>

<p align="center">
  <img src="images/img_6.png" alt="Imagen 6" />
</p>

<div align="justify">
● Captura del client reproduint l’àudio. (Navegador)<br><br>
</div>

<p align="center">
  <img src="images/img_7.png" alt="Imagen 7" />
</p>

<div align="justify">
● Explicació dels formats d’àudio utilitzats. <br><br>
`Hem decidit utilitzar el format MP3 (MPEG Audio Layer III) principalment per la seva compatibilitat universal. En desplegar un reproductor web basat en l'etiqueta &lt;audio&gt; d'HTML5, l'MP3 garanteix que qualsevol client i navegador (Chrome, Firefox, Safari, dispositius mòbils) pugui reproduir l'emissió de manera nativa sense necessitat d'instal·lar cap connector o programari extern. A més, l'MP3 ofereix un equilibri òptim entre qualitat de so i compressió, la qual cosa és fonamental per minimitzar el consum d'ample de banda de la nostra instància d'AWS (t2.small) mantenint una experiència d'escolta fluida.`<br><br>
● Validació final del servei. <br><br>
`La validació final del servei és altament positiva. La plataforma funciona molt bé i la resposta a l'hora de servir i reproduir l'àudio és pràcticament immediata, sense talls ni latències notables durant l'streaming. A nivell d'administració, la implementació no ens ha donat gaires problemes; la creació dels playbooks d'Ansible ha estat un procés fluid que ens ha permès automatitzar i aixecar tota la infraestructura (des de la seguretat i el proxy invers fins als serveis d'emissió en bucle) de manera ràpida, robusta i sense interrupcions.`<br><br>
<strong>2. Implantació del servei de vídeo i videoconferència – RA8 </strong><br><br>
<strong>1. Descriviu la funcionalitat del servei de vídeo escollit. </strong><br><br>
Per cobrir les necessitats d’emissió de contingut multimèdia sota demanda dins d’InnovateTech, s’ha implementat el servei Jellyfin, una solució open-source que permet gestionar mitjans digitals. <br><br>
<strong>2. Instal·leu un servidor de vídeo, com ara NGINX amb RTMP, Jellyfin o equivalent. </strong><br><br>
El desplegament del servidor s’ha fet sobre un sistema operatiu Ubuntu 24.04 a AWS, desplegant la instància amb ansible. Jellyfin s’ha desplegat mitjançant un script d’instal·lació oficial. Aquest mètode automatitzat assegura què s’afegeixen correctament totes les dependències necessàries del sistema.<br><br>
Un cop executat l’script d’instal·lació, el servei queda integrat a la màquina com un dimoni independent. Garantint l’arrencada automàtica en cas d’aturada o reinici del servidor. <br><br>
També s’ha configurat la redirecció de qualsevol petició per HTTP a HTTPS amb certificats autosignats.<br><br>
<strong>3. Configureu el servei de streaming utilitzant RTMP, HLS o tecnologia similar. </strong><br><br>
Per la distribució dels vídeos a través de la xarxa, Jellyfin utilitza el protocol de streaming HLS (HTTP Live Streaming), desenvolupat per Apple i convertit en un estàndard de la indústria. <br><br>
HLS té el següent funcionament;<br><br>
* El servidor divideix el fitxer original en múltiples fragments d’alta resolució-
* Es genera un índex amb extensió .m3u8 que conté la seqüència dels fragments.
* El client descarrega l’índex per HTTPS i va sol·licitant els fragments de vídeo de manera progresiva.

<strong>4. Afegiu com a mínim un vídeo accessible des del servei. </strong><br><br>
</div>

<p align="center">
  <img src="images/img_8.png" alt="Imagen 8" />
</p>

<div align="justify">
<strong>5. Utilitzeu formats i còdecs de vídeo com H.264 i MP4. </strong><br><br>
Per assegurar la màxima compatibilitat sense haver de comprimir o transcodificar vídeos, augmentant el consum de CPU del servidor, hem decidit què els vídeos utilitzin els següents estàndards.<br><br>
</div>

| COMPONENT | TECNOLOGIA | JUSTIFICACIÓ |
| --- | --- | --- |
| Còdec | H.264 | Còdec capaç de ser reproduït per gairebé qualsevol processador modern. |
| Contenidor multimèdia | MP4 | Format de fitxer estàndard a internet. És directament reproduïble pels navegadors sense necessitat de dependències externes. |

<div align='justify'>

Quan a un fitxer s’utilitza MP4 amb codec H.264, Jellyfin realitza el mètode anomenat Direct Stream, enviant els blocs directament al navegador de l’usuari final, consumint pocs recursos del servidor.<br><br>
<strong>6. Verifiqueu la reproducció des d’un navegador i/o client. </strong><br><br>
El sistema està totalment operatiu i accesible des de l’exterior de la xarxa local. <br><br>
Es pot accedir mitjançant;<br><br>
* IP Pública: Connexió mitjançant l’adreça IP (Elastic IP)
* Redirecció Web:  L’usuari accedeix a la web de l’empresa on hi ha un hipervincle que redirigeix de la web al servidor de vídeo.

<strong>7. Instal·leu i configureu un servei de videoconferència, com ara Jitsi Meet o equivalent. </strong><br><br>
</div>

<p align="center">
  <img src="images/img_9.png" alt="Imagen 9" />
</p>

<div align="justify">
<strong>8. Realitzeu una prova real de videotrucada entre dos usuaris. </strong><br><br>
</div>

<p align="center">
  <img src="images/img_10.png" alt="Imagen 10" />
</p>

<div align="justify">
<strong>9. Descriviu els protocols utilitzats, especialment WebRTC. </strong><br><br>
WebRTC (Web Real-Time Communication): És l'estàndard web de codi obert integrat nativament en els navegadors moderns que permet la comunicació d'àudio, vídeo i dades directament entre clients (peer-to-peer) o entre client i servidor, sense necessitat d'instal·lar cap connector o programari extern. <br><br>
HTTPS / TLS con Certificats Autosignats: Atès que WebRTC exigeix estrictament un entorn segur per permetre l'accés a la càmera i al micròfon, el servidor web s'ha configurat amb protocols TLS (Transport Layer Security) sobre el port 443. Les claus i els certificats digitals utilitzats han estat autosignats pel propi servidor durant el desplegament de Docker.<br><br>
<strong>10.Documenteu la configuració i afegiu captures de pantalla. </strong><br><br>
Jitsi Meet instal·lat amb docker<br><br>
</div>

<p align="center">
  <img src="images/img_11.png" alt="Imagen 11" />
</p>

<div align="justify">
<strong>docker-jitsi-meet-web-1 </strong>(Imatge: jitsi/web:unstable): El frontend (Nginx) que serveix la web. Es veu clarament que està mapejat als teus ports 8000 i 8443.<br><br>
<strong>docker-jitsi-meet-jicofo-1</strong> (Imatge: jitsi/jicofo:unstable): El gestor que coordina la lògica de les trucades.<br><br>
<strong>docker-jitsi-meet-jvb-1</strong> (Imatge: jitsi/jvb:unstable): El Jitsi Videobridge, el motor de xarxa per on passa el vídeo WebRTC. Fixa't que té obert el port 10000/udp, que és precisament el port estàndard de Jitsi per enviar el vídeo i l'àudio en temps real per UDP per evitar el lag.<br><br>
<strong>docker-jitsi-meet-prosody-1</strong> (Imatge: jitsi/prosody:unstable): El servidor XMPP de senyalització i missatgeria interna.<br><br>
Dins on s’ha desplegat Jitsi, el fitxer .env conté la configuració de la xarxa. <br><br>
Els paràmetres modificats són;<br><br>
# Ruta: /home/innovateadmin/docker-jitsi-meet/.env<br><br>
# URL pública d'accés (IP de la instància d'AWS)<br><br>
PUBLIC_URL=https://video-innovatech.local:8443<br><br>
# Mapeig de ports cap al contenidor web (comprovat amb docker ps)<br><br>
HTTP_PORT=8000<br><br>
HTTPS_PORT=8443<br><br>
# Port UDP per al Jitsi Videobridge (Trànsit de vídeo en temps real)<br><br>
JVB_PORT=10000<br><br>
● Captura del vídeo publicat o disponible. <br><br>
</div>

<p align="center">
  <img src="images/img_12.png" alt="Imagen 12" />
</p>

<div align="justify">
● Captura de la reproducció des del navegador/client. <br><br>
</div>

<p align="center">
  <img src="images/img_13.png" alt="Imagen 13" />
</p>

<div align="justify">
● Captura del servei de videoconferència operatiu. <br><br>
</div>

<p align="center">
  <img src="images/img_14.png" alt="Imagen 14" />
</p>

<div align="justify">
● Explicació dels formats, còdecs i protocols utilitzats. <br><br>
A diferència de Jellyfin, Jitsi Meet no treballa amb fitxers (com MP4), sinó que transmet el flux de dades en temps real. Els protocols i còdecs clau utilitzats en la videotrucada són:<br><br>
<strong>WebRTC </strong>(Web Real-Time Communication): El framework principal. Permet que els navegadors dels usuaris transmetin àudio i vídeo directament sense necessitat d'instal·lar cap aplicació o connector extern.<br><br>
<strong>SRTP </strong>sobre <strong>UDP</strong>: Protocol encarregat d'encapsular i xifrar el flux multimèdia de punta a punta. S'utilitza UDP en comptes de TCP perquè prioritza la velocitat de transmissió i minimitza el retard (lag).<br><br>
<strong>XMPP </strong>(Prosody): Protocol de senyalització de text. S'encarrega de la gestió interna de la sala (controlar qui entra, qui surt i el xat de la reunió).<br><br>
<strong>HTTPS </strong>/ <strong>TLS </strong>(Certificats Autosignats): Canal web xifrat. És obligatori, ja que els navegadors web bloquegen l'accés a la càmera i al micròfon si la connexió no és segura.<br><br>
Còdec de Vídeo (<strong>H.264</strong>): S'encarrega de comprimir la imatge de la càmera. S'utilitza perquè és compatible amb l'acceleració per maquinari de qualsevol dispositiu, rebaixant l'ús de CPU.<br><br>
Còdec d'Àudio (<strong>Opus</strong>): Comprimeix el so de forma adaptativa. Si detecta que la xarxa es col·lapsa, redueix el consum de dades automàticament per evitar que la veu es talli.<br><br>
<strong>3. Amplada de banda </strong><br><br>
<strong>Audio: </strong><br><br>
</div>

<p align="center">
  <img src="images/img_15.png" alt="Imagen 15" />
</p>



<p align="center">
  <img src="images/img_16.png" alt="Imagen 16" />
</p>



<p align="center">
  <img src="images/img_17.png" alt="Imagen 17" />
</p>



<p align="center">
  <img src="images/img_18.png" alt="Imagen 18" />
</p>



| Escenario de Prueba | Tiempo (sec) | Transfer Total (MB) | Bitrate Total (Mbps) | Transfer Neto del Servicio (MB) | Bitrate Neto del Servicio (Mbps) |
| --- | --- | --- | --- | --- | --- |
| 1. Servidor Vacío | 10.49 | 52.1 | 41.7 | Es el control | Es el control |



| 1 Usuari Streaming (Jellyfin) | 10.14 | 98.5 | 81.5 | 46.4 MBb | 39.8 Mbps |
| --- | --- | --- | --- | --- | --- |
| 2 | ~10.14 | 144.9 | 121.3 | 92.8 MB | 79.6 Mbps |
| 5 | ~10.14 | 284.1 | 240.7 | 232.0 MB | 199.0 Mbps |



| Videollamada (Jitsi) 1 | 10.20 | 130.0 | 107.0 | 77.9 MB | 65.3 Mbps |
| --- | --- | --- | --- | --- | --- |
| 2 | ~10.20 | 207.9 | 172.3 | 155.8 MB | 130.6 Mbps |
| 5 | ~10.20 | 441.6 | 368.2 | 389.5 MB | 326.5 Mbps |

<div align='justify'>

La capacitat real de la línia ronda els 500 Mbps, un consum màxim de 326.5 Mbps amb 5 usuaris concurrents de Jitsi significa que el sistema és perfectament capaç i acceptable, ja que no arriba a saturar el canal (es queda al voltant del 65% de l'ús de la línia).<br><br>
● Proves d’amplada de banda<br><br>
Servidor d’Audio:<br><br>
Bitrate estable de 270 Mbits/sTransferencia estable d’uns 30 MbytesNo hi ha casi variació quan s’amplia el nombre de clients connectats a la vegada desde el navegador.<br><br>
Capacitat Nominal de la línia (Línia Base / Speedtest): ~544.09 Mbps (Velocitat de referència del canal).<br><br>
Velocitat de Descàrrega puntual (iperf3 Reverse): 25.9 Mbps de mitjana de flux net d'un únic fil de dades cap al client.<br><br>
Velocitat de Pujada puntual (iperf3): 57.3 Mbps de mitjana cap al servidor.<br><br>
Latència mitjana (Ping): 108.05 ms (estable, amb 0.0% de pèrdua de paquets).<br><br>
Anàlisi de la Taula de Serveis Actius i Concurrència:<br><br>
Comparant la capacitat total del nostre ample de banda (~544 Mbps) amb les dades d'estrès recollides a la taula de serveis, s'obtenen les següents conclusions de rendiment:<br><br>
Streaming de Vídeo (Jellyfin): Un usuari consumeix un net de 39.8 Mbps, escalant a 79.6 Mbps amb 2 usuaris i fins a 199.0 Mbps amb un escenari de 5 usuaris concurrents. Com que el sostre és de ~544 Mbps, 5 usuaris veient vídeo simultàniament només ocupen el 36,5% de la línia, deixant molt de marge a la xarxa.<br><br>
Videoconferència (Jitsi Meet): Un flux de videotrucada interactiva WebRTC demana 65.3 Mbps nets per usuari. En escalar a 2 usuaris passem a 130.6 Mbps i, en l'escenari més estressant de 5 usuaris, el consum net se situa en 326.5 Mbps.<br><br>
Avaluació de l'impacte: Fins i tot en el cas crític de tenir 5 persones connectades en videoconferència alhora, el consum total absorbit (326.5 Mbps) es troba notablement per sota dels ~544 Mbps de la línia. El sistema opera de manera folgada gastant aproximadament el 60% de l'amplada de banda disponible.<br><br>
Classificació del Sistema: ACCEPTABLE<br><br>
Justificació: La infraestructura actual és totalment viable. Les proves d'estrès demostren que el servidor i la xarxa d'AWS poden gestionar sense problemes una concurrència mitjana de 5 usuaris simultanis en qualsevol dels serveis instal·lats (Jellyfin o Jitsi), garantint que el trànsit no se saturi ni es generi pèrdua de paquets.<br><br>
● Propostes d’optimització: <br><br>
Actualment, Jellyfin i Jitsi utilitzen el còdec H.264, el qual, tot i tenir una gran compatibilitat, és poc eficient en la compressió i genera bitrates molt elevats (fins a 199 Mbps a Jellyfin i 326.5 Mbps a Jitsi per a 5 usuaris).<br><br>
Com a millora, es proposa migrar cap al còdec H.265 (HEVC) pels següents motius:<br><br>
Reducció del 50% del trànsit: L'H.265 és el doble d'eficient; permet transmetre la mateixa resolució (1080p) fent servir la meitat de dades per segon.<br><br>
Impacte real en la concurrència: El consum d'1 usuari de Jellyfin cauria de 39.8 Mbps a 19.9 Mbps, i el de Jitsi de 65.3 Mbps a ~32.6 Mbps.<br><br>
Millora d'escalabilitat: L'escenari crític de 5 usuaris a Jitsi passaria de consumir 326.5 Mbps (60% de la línia) a només 163.2 Mbps (30%), duplicant immediatament la capacitat de clients simultanis que pot absorbir la nostra línia de ~544 Mbps.<br><br>
3 Disseny i implementació d’una base de dades <br><br>
`3.1 Context del Projecte `<br><br>
A més de la infraestructura dedicada a la operativa de l'empresa, l'empresa disposa d'una estructura interna amb diferents departaments (vendes, suport tècnic, administració i logística), els quals necessiten eines de comunicació eficients, incloent-hi un sistema de videoconferències i trucades internes. <br><br>
</div>

| Objectiu de la part de Bases de Dades  Dissenyar i implementar una base de dades integral per a InnovateTech que doni suport a les següents funcionalitats:  • La gestió del personal i l'estructura organitzativa de l'empresa.  • El sistema de comunicació interna: videotrucades, i gestió de l'streaming d’audio i de vídeo.  • El control d'accés, seguretat i auditoria de la base i els sistemes instal·lats. |
| --- |

<div align='justify'>

`3.2 Disseny i Implementació de la Base de Dades `<br><br>
Es tracta de dissenyar i implementar una base de dades completa per a la gestió d'InnovateTech, i que serveixí per a gestionar els serveis que s’implementen de streaming d'àudio i de vídeo. Aquesta base de dades servirà com a font de dades per a una aplicació de gestió que residirà al servidor web que també s’ha d’instal·lar. <br><br>
A continuació s'especifiquen les entitats, atributs i requisits funcionals que ha de cobrir la base de dades. <br><br>
<u>`3.2.1 Gestió del Personal i Estructura Organitzativa`</u> <br><br>
La base de dades ha de gestionar tota la informació relacionada amb el personal de l'empresa. Concretament: <br><br>
<strong>Empleats </strong><br><br>
• Identificador principal: DNI (únic per a cada empleat). <br><br>
• Dades personals: nom, cognoms, adreça completa i telèfon de contacte. • Cada empleat pertany a un únic departament. <br><br>
<strong>Departaments </strong><br><br>
• Codi identificador (únic per a cada departament). <br><br>
• Nom complet del departament. <br><br>
• Telèfon del departament. <br><br>
`3.2.2 Sistema de Comunicació Interna (Videotrucades i Streaming) `<br><br>
<strong>InnovateTech </strong>disposa d'un sistema de videotrucades i streaming de vídeo per a la comunicació interna i per als seus clients. La base de dades ha de gestionar els aspectes que es detallen a continuació. <br><br>
<strong>Usuaris del sistema de comunicació (empleats) </strong><br><br>
• Dades dels usuaris: nom complet, correu electrònic, extensió/identificador de trucades, estat (actiu/bloquejat). <br><br>
• Per a cada usuari, s'ha de poder generar un enllaç per iniciar una videotrucada. • Distinció entre tipus d'usuari: clients externs i treballadors interns (amb els seus rols). <br><br>
<strong>Configuració de trucades i qualitat de servei </strong><br><br>
• S'ha d'emmagatzemar la configuració de qualitat de vídeo/àudio per a grups d'usuaris (per exemple: alta, mitja, baixa qualitat de streaming). <br><br>
• Quan un usuari té limitacions d'amplada de banda, el sistema ha de poder recuperar la configuració de qualitat inferior corresponent al seu grup. <br><br>
• Configuració del servidor de videotrucades: paràmetres generals del servei, ports, protocols. <br><br>
<strong>Registre d'activitat de trucades </strong><br><br>
• Registre de cada trucada realitzada: usuari/client originador, destinatari, data i hora d'inici, data i hora de fi, durada total, qualitat de servei usada. <br><br>
• Possibilitat de consultar les trucades per usuari o client (historial complet). • Valoració del servei per part de l'usuari (puntuació i comentari opcional). <br><br>
<strong>Gestió del catàleg de vídeos en streaming </strong><br><br>
• Emmagatzemar la informació dels vídeos disponibles al sistema d'streaming: títol, descripció, categoria, durada, data de publicació. <br><br>
• Per a cada vídeo, guardar l'enllaç al servidor d'streaming per poder-hi accedir directament. <br><br>
• Possibilitat de fer cerques de vídeos per títol, categoria o paraules clau. <br><br>
<strong>Anàlisi d'amplada de banda </strong><br><br>
• Emmagatzemar els resultats de les mesures d'amplada de banda realitzades pels operaris: data i hora de la mesura, usuari/equip mesurat, velocitat de baixada, velocitat de pujada, latència, resultat (acceptable/no acceptable). <br><br>
• Cal emmagatzemar l'operari que ha realitzat la mesura i qualsevol nota o observació addicional. <br><br>
</div>

| Integració valorada positivament  S'avaluarà positivament la integració automàtica del registre de mesures d'amplada de banda als scripts de comprovació, per sobre de la inserció manual mitjançant una aplicació, i aquesta per sobre de la inserció directa transformant logs manualment. |
| --- |

<div align='justify'>

      `3.3. Gestió d'Usuaris, Rols i Permisos `<br><br>
Aquesta secció és la part central de l'avaluació del mòdul 0377. Cal implementar un sistema complet de control d'accés a la base de dades, incloent-hi la creació d'usuaris, la definició de rols i l'assignació de permisos. <br><br>
`3.3.1 Definició de Rols `<br><br>
Cal crear com a mínim els rols següents, amb els permisos indicats: <br><br>
</div>

| Rol  | Permisos principals  | Restriccions específiques |
| --- | --- | --- |
| admin  | Accés total: SELECT, INSERT, UPDATE, DELETE, CREATE,  DROP, GRANT sobre totes les taules. | Pot veure i modificar la taula  d'avisos. Pot gestionar altres  usuaris. |
| vendes  | SELECT, INSERT, UPDATE sobre taules de clients, comandes,  productes, cistell i trucades. | Pot contactar i iniciar trucades amb clients. Pot consultar l'historial de trucades dels clients. |
| administracio  | SELECT, INSERT, UPDATE sobre taules de personal, nòmines,  departaments i grup-nivell. | No pot iniciar trucades amb clients ni accedir al sistema de  videotrucades de clients. |
| treballador  | SELECT sobre taules de productes, vídeos, configuració de trucades. Pot registrar la seva activitat de trucades. | No pot modificar taules de personal, nòmines ni dades de clients. |

<div align='justify'>

`3.3.2 Script de Creació Automatitzada d'Usuaris `<br><br>
Cal crear un script (en Bash o Python) que automatitzi la creació d'usuaris a la base de dades. L'script ha de: <br><br>
• Permetre donar d'alta un o més usuaris alhora, introduint el mínim de dades possible. <br><br>
• Executar les sentències CREATE USER i GRANT corresponents al rol assignat. • Generar un fitxer .sql amb les sentències SQL resultants, de manera que pugui ser revisat i executat posteriorment al SGBD. <br><br>
• Asignar el rol correcte a cada usuari en el moment de la creació. <br><br>
• Gestionar casos d'error: usuari ja existent, rol no vàlid, etc. <br><br>
• Permisos especials per generar bloquejos alhora de fer backups.( GRANT FILE) <br><br>
Els rols mínims a suportar per l'script són: admin, vendes, administració, treballador. <br><br>
</div>

| Nota sobre el SGBD  Podeu triar el SGBD que vulgueu per a la implementació (MySQL/MariaDB, PostgreSQL, Oracle, etc.). Recordar de no utilitzar RDS ja que té un cost elevat. Fer-ho des d’un EC2. Cal justificar l'elecció. |
| --- |

<div align='justify'>

`3.3.3 Triggers per al Control d'Accés i Auditoria `<br><br>
Cal implementar triggers que donin suport a la seguretat i auditoria de la base de dades: <br><br>
<strong>Control de quotes d'usuari (trucades) </strong><br><br>
• Trigger que controli la quota de minuts mensuals per usuari: si s'assoleix el límit, s'ha d'impedir la inserció d'una nova trucada i registrar l'avís. <br><br>
• Trigger que controli el nombre màxim de trucades diàries per usuari: si se supera, ha d'impedir noves trucades i registrar l'avís. <br><br>
<strong>Taula d'avisos i auditoria </strong><br><br>
• Existència d'una taula d'avisos (log d'auditoria) on es registren els intents no autoritzats d'accés o modificació. <br><br>
• Trigger que, quan un usuari amb rol treballador o vendes intenti modificar taules restringides (per exemple, nòmines, configuració de rols, dades de salaris), registri l'intent a la taula d'avisos amb: usuari, taula afectada, operació intentada, data i hora. <br><br>
• Trigger que, quan un usuari amb rol administració intenti accedir o modificar les taules del sistema de trucades de clients, registri l'intent a la taula d'avisos. <br><br>
<strong>Gestió de bloqueig d'usuaris </strong><br><br>
• Trigger que impedeixi realitzar o rebre trucades si l'usuari es troba en estat bloquejat. • El bloqueig es pot aplicar de manera temporal o indefinida. <br><br>
</div>

| Ampliació opcional (valorada positivament)  Es valorarà positivament implementar un procés que revisi la taula d'avisos i envii notificacions per correu electrònic, Telegram o Discord als administradors quan es detectin intents d'accés no autoritzat. |
| --- |

<div align='justify'>

<u>`3.3.4 Events Periòdics (Còpies de Seguretat)`</u> <br><br>
Cal crear almenys un event d'execució periòdica que realitzi còpies de seguretat de les dades crítiques. L'event ha de: <br><br>
• Executar-se de manera automàtica amb una periodicitat definida (diària, setmanal, etc. — cal justificar l'elecció). <br><br>
• Utilitzar la sentencia SELECT ... INTO OUTFILE (o equivalent al SGBD escollit) per desar les dades en un fitxer de backup. <br><br>
• Incloure com a mínim les taules de: empleats, clients, comandes i registre d'activitat de trucades. <br><br>
• Registrar a una taula de control els events de backup realitzats (data, hora, taules incloses, resultat). <br><br>
`3.4. Disseny Entitat-Relació i Model Relacional `<br><br>
A partir dels requisits especificats a les seccions anteriors, cal realitzar: 1. Diagrama Entitat-Relació (E/R) complet que representi totes les entitats, atributs i relacions de la base de dades. El diagrama ha de ser clar, llegible i correctament cardinalitzat. <br><br>
2. Transformació al model relacional: a partir del diagrama E/R, cal obtenir l'esquema relacional complet, indicant per a cada taula: nom, atributs, clau primària (PK) i claus foranes (FK). <br><br>
3. Implementació en el SGBD: creació de totes les taules amb les restriccions adequades (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK), amb un nombre significatiu de dades de prova inserides. <br><br>
Cal incloure en la documentació captures de pantalla que demostrin que les taules s'han creat correctament i que les dades s'han inserit. <br><br>
<strong>Disseny i implementació d’una base de dades </strong><br><br>
<strong>Context del Projecte </strong><br><br>
InnovateTech disposa d'una estructura interna amb diferents departaments (vendes, suport tècnic, administració i logística) que requereixen d'un sistema de comunicació integral (videotrucades i streaming d’àudio i vídeo). <br><br>
<strong>Objectiu de la part de Bases de Dades </strong><br><br>
Dissenyar i implementar una base de dades relacional que doni suport a:<br><br>
* La gestió del personal i l'estructura organitzativa.
* El sistema de comunicació interna (registre de trucades i catàleg d'streaming).
* El control d'accés, seguretat, rols i auditoria del sistema.

<strong>Disseny i Implementació de la Base de Dades </strong><br><br>
La base de dades s'ha implementat amb MariaDB en una instància Amazon EC2 (t3.small) amb Ubuntu Server (AWS Academy), evitant els costos elevats d'Amazon RDS.<br><br>
<strong>Gestió del Personal i Estructura Organitzativa </strong><br><br>
* Departaments: Emmagatzema el codi identificador (PK), nom complet i telèfon del departament.
* Grup_Nivell: Defineix les categories professionals i el seu salari base.
* Empleats: Registra els treballadors mitjançant el DNI (PK), dades personals i vinculació a un únic departament i grup nivell.
* Nomines: Emmagatzema el registre de pagaments mensuals associats al DNI de l'empleat.

<strong>Sistema de Comunicació Interna (Videotrucades i Streaming) </strong><br><br>
<strong>Usuaris:</strong> Gestiona empleats i clients externs, l'estat (actiu/bloquejat), enllaços de videotrucada i límits de quotes (minuts/trucades).<br><br>
<strong>Configuració i Qualitat:</strong> Grup_Qualitat inclou una relació autoreferencial (id_qualitat_inferior) per aplicar una degradació controlada de la qualitat si falla la xarxa. Configuracio_Servidor guarda els paràmetres, ports i protocols.<br><br>
<strong>Registre de Trucades:</strong> Historial que guarda origen, destí, dates d'inici/fi, durada total i valoració del servei.<br><br>
<strong>Catàleg de Vídeos:</strong> Emmagatzema títols, descripcions, categories i l'enllaç de streaming.<br><br>
<strong>Automatització de l'Inventari:</strong> S'ha implementat un script en Python que consulta periòdicament una API externa per obtenir els nous vídeos i realitza la inserció automàtica de dades al SGBD.<br><br>
<strong>Anàlisi d'Amplada de Banda (Mesura_Banda):</strong> Registra les mesures de xarxa (velocitats i latència) preses pels operaris.<br><br>
<strong>Gestió d'Usuaris, Rols i Permisos</strong><br><br>
<strong>Definició de Rols</strong><br><br>
Disseny de control d'accés basat en rols (RBAC) definit a rols_db.sql:<br><br>
</div>

| Rol | Permisos principals | Restriccions específiques |
| --- | --- | --- |
| admin | ALL PRIVILEGES i GRANT FILE (per a backups). | Accés total. Gestió d'usuaris i modificació de la taula d'avisos. |
| vendes | SELECT, INSERT, UPDATE en Clients, Comandes, Productes, Cistell i Registre_Trucades. | No pot accedir a nòmines ni dades de personal. |
| administracio | SELECT, INSERT, UPDATE en Empleats, Nomines, Departaments i Grup_Nivell. | No pot iniciar trucades amb clients ni accedir al seu sistema. |
| treballador | SELECT en Productes, Videos i Configuració. INSERT, UPDATE en Registre_Trucades. | No pot modificar personal, nòmines ni dades de clients. |

<div align='justify'>

<strong>Script de Creació Automatitzada d'Usuaris</strong><br><br>
L'script interactiu crear_usuaris.py (ubicat a /usr/local/bin/crear_usuaris) automatitza l'alta d'usuaris:<br><br>
* Sol·licita nom, contrasenya i rol, validant que estigui a la llista de rols permesos.
* Genera el fitxer usuaris_generats.sql amb les sentències CREATE USER IF NOT EXISTS.
* Aplica els GRANT corresponents i executa SET DEFAULT ROLE per activar el rol en iniciar sessió.

<strong>Triggers per al Control d'Accés i Auditoria</strong><br><br>
<strong>Control de quotes:</strong> Triggers BEFORE INSERT a Registre_Trucades que bloquegen la inserció de la trucada si l'usuari supera el seu limit_minuts_mes o limit_trucades_dia, desviant l'intent a Taula_Avisos.<br><br>
<strong>Bloqueig d'usuaris:</strong> Trigger que impedeix processar trucades si l'estat de l'usuari és 'bloquejat'.<br><br>
<strong>Auditoria de rols:</strong> Triggers que registren a Taula_Avisos (guardant usuari, taula, operació i hora) qualsevol intent d'un treballador/vendes d'alterar nòmines o salaris, o d'un membre d'administració d'accedir a les trucades de clients.<br><br>
<strong>Events Periòdics (Còpies de Seguretat)</strong><br><br>
L'automatització de les còpies de seguretat de les dades crítiques es realitza mitjançant:<br><br>
<strong>Planificació:</strong> Un script en Bash (backup_dades.sh) és executat diàriament a les 02:00 AM a través del dimoni Crontab de Linux.<br><br>
<strong>Procediment:</strong> L'script calcula el següent id_backup de forma dinàmica i executa la sentència SELECT ... INTO OUTFILE de MariaDB per exportar a fitxers .csv les taules: empleats, clients, comandes i registre_activitat_trucades.<br><br>
<strong>Control:</strong> El resultat de l'operació (Èxit o Error) es registra directament a la taula Control_Backups.<br><br>
<strong>Disseny Entitat-Relació i Model Relacional</strong><br><br>
<strong>Diagrama Entitat-Relació (E/R)</strong><br><br>
</div>

<p align="center">
  <img src="images/img_19.png" alt="Imagen 19" />
</p>

<div align="justify">
<strong>Model Relacional</strong><br><br>
A continuació es detalla l'esquema lògic resultant de la derivació del model E/R, estructurat amb les seves corresponents Claus Primàries (PK) i Claus Foranes (FK):<br><br>
<strong>Departaments</strong> (<strong>codi_departament</strong>, nom_departament, telefon_departament)<br><br>
<strong>Grup_Nivell</strong> (<strong>id_grup</strong>, nom_grup, salari_base)<br><br>
<strong>Empleats</strong> (<strong>dni</strong>, nom, cognoms, adreca, telefon, codi_departament, id_grup)<br><br>
* FK (codi_departament) → Departaments(codi_departament)
* FK (id_grup) → Grup_Nivell(id_grup)

<strong>Nomines</strong> (<strong>id_nomina</strong>, dni_empleat, mes, any, import_total)<br><br>
* FK (dni_empleat) → Empleats(dni)

<strong>Clients</strong> (<strong>id_client</strong>, nom_empresa, contacte, email, telefon)<br><br>
<strong>Productes</strong> (<strong>id_producte</strong>, nom, descripcio, preu)<br><br>
<strong>Comandes</strong> (<strong>id_comanda</strong>, id_client, data_comanda, total)<br><br>
* FK (id_client) → Clients(id_client)

<strong>Cistell </strong>(<strong>id_cistell</strong>, id_client, id_producte, quantitat)<br><br>
* FK (id_client) → Clients(id_client)
* FK (id_producte) → Productes(id_producte)

<strong>Usuaris</strong> (<strong>id_usuari</strong>, nom_complet, email [UNIQUE], extensio_trucades, estat, enllac_trucada, tipus_usuari, rol, dni_empleat, id_client, limit_minuts_mes, limit_trucades_dia)<br><br>
* FK (dni_empleat) → Empleats(dni)
* FK (id_client) → Clients(id_client)

<strong>Grup_Qualitat</strong> (id_qualitat, nom_perfil, resolucio, bitrate, id_qualitat_inferior)<br><br>
* FK (id_qualitat_inferior) → Grup_Qualitat(id_qualitat)

<strong>Configuracio_Servidor</strong> (<strong>id_configuracio</strong>, parametre, valor, port, protocol, descripcio)<br><br>
<strong>Registre_Trucades</strong> (<strong>id_trucada</strong>, id_origen, id_destinacio, data_hora_inici, data_hora_fi, durada_minuts, id_qualitat, puntuacio, comentari)<br><br>
* FK (id_origen) → Usuaris(id_usuari)
* FK (id_destinacio) → Usuaris(id_usuari)
* FK (id_qualitat) → Grup_Qualitat(id_qualitat)

<strong>Videos_Streaming</strong> (<strong>id_video</strong>, titol, descripcio, categoria, durada_minuts, data_publicacio, enllac_servidor)<br><br>
<strong>Mesura_Banda</strong> (<strong>id_mesura</strong>, data_hora, id_usuari_mesurat, equip_mesurat, velocitat_baixada, velocitat_pujada, latencia, resultat, id_operari, observacions)<br><br>
* FK (id_usuari_mesurat) → Usuaris(id_usuari)
* FK (id_operari) → Usuaris(id_usuari)

<strong>Taula_Avisos</strong> (<strong>id_avis</strong>, id_usuari, taula_afectada, operacio_intentada, data_hora, detall_error)<br><br>
* FK (id_usuari) → Usuaris(id_usuari)

<strong>Control_Backups</strong> (<strong>id_backup</strong>, data_hora, taules_incloses, resultat, ruta_fitxer)<br><br>
<strong>Captura de la Creació del Model Relacional a MariaDB</strong><br><br>
</div>

<p align="center">
  <img src="images/img_20.png" alt="Imagen 20" />
</p>

<div align="justify">
<strong>Captura d'Execució del Generador d'Usuaris en Python</strong><br><br>
</div>

<p align="center">
  <img src="images/img_21.png" alt="Imagen 21" />
</p>

<div align="justify">
<strong>Captura de l'Historial de Backups Realitzats</strong><br><br>
</div>

<p align="center">
  <img src="images/img_22.png" alt="Imagen 22" />
</p>

<div align="justify">
Configuració del crontab:<br><br>
</div>

<p align="center">
  <img src="images/img_23.png" alt="Imagen 23" />
</p>

<div align="justify">
4 Lliurament i presentació <br><br>
<strong>1. És obligatòria la presentació per poder avaluar les RAs. </strong><br><br>
2. Vídeo de 3 minuts el qual ha de tenir: <br><br>
a. Una Introducció on es plantegi un problema, una necessitat … i la solució proposada (Poc temps de duració) <br><br>
b. Una part amb la demo on es vegin el servidor i els clients en funcionament, i el manegament de les dades. <br><br>
c. Una conclusió, finalització del vídeo / presentació on justifiqueu perquè el vostre desplegament funciona i serveix per … <br><br>
3. Exposició de duració de 10-15 minuts explicant els punts i aspectes més importants del projecte transversal. Es valorarà: <br><br>
a. La qualitat del material de la presentació: claredat, estructura, faltes ortografia. <br><br>
b. Exposició realitzada del projecte i cenyida al temps disponible. c. Participació de tots els membres del grup de forma equitativa. d. Interacció i resposta a les preguntes al respecte. <br><br>
4. Enllaç publicat al GitHub del document en Markdown amb el recull d’evidències de tots els apartats i les respostes teòriques justificades <br><br>
Rúbriques <br><br>
Avaluació Projecte Transversal: <br><br>
Bloc 0371 Fonaments de maquinari: <br><br>
</div>

| PUNT DE CONTROL - RA4  ● Ubicació física (1 p)  ● Infraestructura IT (1 p)  ● SAI (1 p)  ● Seguretat física i lògica (2 p)  ● Implementació al núvol AWS (5 p)  ○ Web/sftp (1p)  ○ LDAP (0,5p)  ○ Logs centralitzats (1,5p)  ○ Ansible (1,5p)  ○ Usuaris administració (0,5p) |
| --- |

<div align='justify'>

Bloc 0375 Serveis de xarxes i internet: <br><br>
</div>

| PUNT DE CONTROL - RA7 (Servei d’audio) - Nota 80%  ● Servidor d’àudio instal·lat i funcional (1,5 p)  ● Configuració del servei (1 p)  ● Clients d’accés (1 p)  ● Formats d’àudio (1 p)  ● Streaming operatiu (1,5 p)  ● Accés via web (0,5 p)  ● Documentació tècnica (1 p)  ● Validació del servei (1,5 p)  ● Descripció del servei d’àudio (1 p) |
| --- |



| PUNT DE CONTROL - RA8 ((Serveis de vídeo i videoconferència) - Nota 80% ● Descripció de la funcionalitat del servei de vídeo (1 p)  ● Servidor de vídeo instal·lat i funcional (1,5 p)  ● Configuració del streaming (RTMP/HLS) (1 p)  ● Formats i còdecs de vídeo (H.264, MP4) (1 p)  ● Streaming de vídeo operatiu (1,5 p)  ● Accés via navegador i clients (1 p)  ● Servei de videoconferència (Jitsi Meet o equivalent) (1,5 p)  ● Prova real de videotrucada (1 p)  ● Protocols utilitzats (WebRTC, etc.) (0,5 p) |
| --- |
| PUNT DE CONTROL TRANSVERSAL - Amplada de banda (0375.7 i 0375.8) - Nota 20% ● Proves de velocitat (download/upload/latència) (1 p)  ● Anàlisi dels resultats (1 p)  ● Relació amb serveis (àudio, vídeo, videoconferència) (1 p)  ● Classificació del sistema (acceptable/no acceptable) (0,5 p)  ● Propostes d’optimització (0,5 p) |

<div align='justify'>

Bloc 0377 Administració de bases de dades: <br><br>
</div>

| PUNT DE CONTROL - RA3-RA4        ● CREACIÓ D'USUARIS (RA3) 4 punts                   ○ Script de creació automatitzada d'usuaris (Bash/Python) funcional. 1 p                   ○ El script genera correctament el fitxer .sql amb CREATE USER i GRANT. 1 p                   ○ Permisos especials de root (GRANT File) de l’SGDB ( boquig de fitxers, etc…) 1 p                  ○ L'script gestiona errors (usuari existent, rol no vàlid, etc.). 1 p  ● CREACIÓ DE ROLS (RA3) 2 punts  ○ S'han creat els rols admin, vendes, administració i treballador. 1 p  ○ Els rols tenen els permisos correctes i diferenciats. 1 p  ● GESTIÓ DE PERMISOS D'USUARI (RA3-RA4) 3,5 punts  ○ Triggers de control de quota de trucades (minuts i nombre). 0,5 p  ○ Taula d'avisos i triggers d'auditoria per accés no autoritzat. 1 p  ○ Trigger de bloqueig d'usuaris per a trucades. 1 p  ○ Event periòdic de backup (SELECT INTO) correctament configurat. 1 p  ● DISSENY I IMPLEMENTACIÓ BD (RA3-RA4) 0,5 punts  ○ Diagrama E/R complet i correcte. + BD correcta 0,2 p  ○ Model relacional ben transformat. + BD correcta 0,2 p  ○ Nombre significatiu de dades de prova. + BD correcta 0,1 p    |
| --- |

<div align='justify'>

Bloc 1665 Digitalització aplicada als sectors productius: <br><br>
</div>

| PUNT DE CONTROL - RA3  ● Publicació al GitHub (0,5p)  ● Ubicació física (0,5p) |
| --- |



| ● Crear una solució que optimitzi l'ús de la infraestructura. (2p) |
| --- |
| PUNT DE CONTROL - RA5  ● Avaluar la seguretat física de les dades (1,5p)  ● Avaluar la seguretat lògica de les dades (1p)  ● Importància de les dades (2p) |
| PUNT DE CONTROL - RA6  ● Transformació digital: canvis que s'han de produir en funció d’objectius de l'empresa. (2,5p) |

<div align='justify'>

Bloc Presentació i defensa 29 de maig: <br><br>
</div>

| PUNT DE CONTROL - Presentació i defensa  ● Qualitat (2,5 p)  ● Exposició (2,5 p)  ● Participació equitativa (2,5 p)  ● Interacció i resposta (2,5 p) |
| --- |

