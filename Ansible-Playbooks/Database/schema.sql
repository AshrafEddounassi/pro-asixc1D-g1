-- ==========================================
-- CREACIÓ DE TAULES
-- ==========================================

CREATE TABLE Departaments (
    codi_departament VARCHAR(50) NOT NULL,
    nom_departament VARCHAR(100),
    telefon_departament VARCHAR(20)
);

CREATE TABLE Grup_Nivell (
    id_grup INT NOT NULL,
    nom_grup VARCHAR(100),
    salari_base DECIMAL(10, 2)
);

CREATE TABLE Empleats (
    dni VARCHAR(20) NOT NULL,
    nom VARCHAR(50),
    cognoms VARCHAR(100),
    adreca TEXT,
    telefon VARCHAR(20),
    codi_departament VARCHAR(50),
    id_grup INT
);

CREATE TABLE Nomines (
    id_nomina INT NOT NULL,
    dni_empleat VARCHAR(20),
    mes INT,
    any INT,
    import_total DECIMAL(10, 2)
);

CREATE TABLE Clients (
    id_client INT NOT NULL,
    nom_empresa VARCHAR(100),
    contacte VARCHAR(100),
    email VARCHAR(100),
    telefon VARCHAR(20)
);

CREATE TABLE Productes (
    id_producte INT NOT NULL,
    nom VARCHAR(100),
    descripcio TEXT,
    preu DECIMAL(10, 2)
);

CREATE TABLE Comandes (
    id_comanda INT NOT NULL,
    id_client INT,
    data_comanda TIMESTAMP,
    total DECIMAL(10, 2)
);

CREATE TABLE Cistell (
    id_cistell INT NOT NULL,
    id_client INT,
    id_producte INT,
    quantitat INT
);

CREATE TABLE Usuaris (
    id_usuari INT NOT NULL,
    nom_complet VARCHAR(150),
    email VARCHAR(100), -- Es farà UNIQUE al final
    extensio_trucades VARCHAR(10),
    estat VARCHAR(20) COMMENT 'actiu o bloquejat',
    enllac_trucada VARCHAR(255),
    tipus_usuari VARCHAR(20) COMMENT 'intern o extern',
    rol VARCHAR(50) COMMENT 'admin, vendes, administracio, treballador',
    dni_empleat VARCHAR(20) COMMENT 'Nul si es client',
    id_client INT COMMENT 'Nul si es empleat intern',
    limit_minuts_mes INT COMMENT 'Per al control de quotes (triggers)',
    limit_trucades_dia INT COMMENT 'Per al control de quotes (triggers)'
);

CREATE TABLE Grup_Qualitat (
    id_qualitat INT NOT NULL,
    nom_perfil VARCHAR(50) COMMENT 'alta, mitja, baixa',
    resolucio VARCHAR(20),
    bitrate INT,
    id_qualitat_inferior INT COMMENT 'Autoreferència per baixar qualitat si falla la xarxa'
);

CREATE TABLE Configuracio_Servidor (
    id_configuracio INT NOT NULL,
    parametre VARCHAR(100),
    valor VARCHAR(255),
    port INT,
    protocol VARCHAR(20),
    descripcio TEXT
);

CREATE TABLE Registre_Trucades (
    id_trucada INT NOT NULL,
    id_origen INT,
    id_destinacio INT,
    data_hora_inici TIMESTAMP NULL DEFAULT NULL,
    data_hora_fi TIMESTAMP NULL DEFAULT NULL,
    durada_minuts INT,
    id_qualitat INT,
    puntuacio INT,
    comentari TEXT
);

CREATE TABLE Videos_Streaming (
    id_video INT NOT NULL,
    titol VARCHAR(200),
    descripcio TEXT,
    categoria VARCHAR(100),
    durada_minuts INT,
    data_publicacio TIMESTAMP,
    enllac_servidor VARCHAR(255)
);

CREATE TABLE Mesura_Banda (
    id_mesura INT NOT NULL,
    data_hora TIMESTAMP,
    id_usuari_mesurat INT,
    equip_mesurat VARCHAR(100),
    velocitat_baixada DECIMAL(10, 2),
    velocitat_pujada DECIMAL(10, 2),
    latencia INT,
    resultat VARCHAR(50) COMMENT 'acceptable o no acceptable',
    id_operari INT,
    observacions TEXT
);

CREATE TABLE Taula_Avisos (
    id_avis INT NOT NULL,
    id_usuari INT,
    taula_afectada VARCHAR(100),
    operacio_intentada VARCHAR(100),
    data_hora TIMESTAMP,
    detall_error TEXT
);

CREATE TABLE Control_Backups (
    id_backup INT NOT NULL,
    data_hora TIMESTAMP,
    taules_incloses TEXT,
    resultat VARCHAR(50),
    ruta_fitxer VARCHAR(255)
);

-- ==========================================
-- CLAUS PRIMÀRIES (PRIMARY KEYS) I ÚNIQUES
-- ==========================================

ALTER TABLE Departaments ADD PRIMARY KEY (codi_departament);
ALTER TABLE Grup_Nivell ADD PRIMARY KEY (id_grup);
ALTER TABLE Empleats ADD PRIMARY KEY (dni);
ALTER TABLE Nomines ADD PRIMARY KEY (id_nomina);
ALTER TABLE Clients ADD PRIMARY KEY (id_client);
ALTER TABLE Productes ADD PRIMARY KEY (id_producte);
ALTER TABLE Comandes ADD PRIMARY KEY (id_comanda);
ALTER TABLE Cistell ADD PRIMARY KEY (id_cistell);
ALTER TABLE Usuaris ADD PRIMARY KEY (id_usuari);
ALTER TABLE Usuaris ADD UNIQUE (email); -- Restricció UNIQUE definida a l'esquema
ALTER TABLE Grup_Qualitat ADD PRIMARY KEY (id_qualitat);
ALTER TABLE Configuracio_Servidor ADD PRIMARY KEY (id_configuracio);
ALTER TABLE Registre_Trucades ADD PRIMARY KEY (id_trucada);
ALTER TABLE Videos_Streaming ADD PRIMARY KEY (id_video);
ALTER TABLE Mesura_Banda ADD PRIMARY KEY (id_mesura);
ALTER TABLE Taula_Avisos ADD PRIMARY KEY (id_avis);
ALTER TABLE Control_Backups ADD PRIMARY KEY (id_backup);

-- ==========================================
-- CLAUS FORANES (FOREIGN KEYS)
-- ==========================================

ALTER TABLE Empleats 
    ADD CONSTRAINT FK_Empleats_Departament FOREIGN KEY (codi_departament) REFERENCES Departaments(codi_departament),
    ADD CONSTRAINT FK_Empleats_GrupNivell FOREIGN KEY (id_grup) REFERENCES Grup_Nivell(id_grup);

ALTER TABLE Nomines 
    ADD CONSTRAINT FK_Nomines_Empleats FOREIGN KEY (dni_empleat) REFERENCES Empleats(dni);

ALTER TABLE Comandes 
    ADD CONSTRAINT FK_Comandes_Clients FOREIGN KEY (id_client) REFERENCES Clients(id_client);

ALTER TABLE Cistell 
    ADD CONSTRAINT FK_Cistell_Clients FOREIGN KEY (id_client) REFERENCES Clients(id_client),
    ADD CONSTRAINT FK_Cistell_Productes FOREIGN KEY (id_producte) REFERENCES Productes(id_producte);

ALTER TABLE Usuaris 
    ADD CONSTRAINT FK_Usuaris_Empleats FOREIGN KEY (dni_empleat) REFERENCES Empleats(dni),
    ADD CONSTRAINT FK_Usuaris_Clients FOREIGN KEY (id_client) REFERENCES Clients(id_client);

ALTER TABLE Grup_Qualitat 
    ADD CONSTRAINT FK_GrupQualitat_Inferior FOREIGN KEY (id_qualitat_inferior) REFERENCES Grup_Qualitat(id_qualitat);

ALTER TABLE Registre_Trucades 
    ADD CONSTRAINT FK_Trucades_Origen FOREIGN KEY (id_origen) REFERENCES Usuaris(id_usuari),
    ADD CONSTRAINT FK_Trucades_Destinacio FOREIGN KEY (id_destinacio) REFERENCES Usuaris(id_usuari),
    ADD CONSTRAINT FK_Trucades_Qualitat FOREIGN KEY (id_qualitat) REFERENCES Grup_Qualitat(id_qualitat);

ALTER TABLE Mesura_Banda 
    ADD CONSTRAINT FK_Mesura_UsuariMesurat FOREIGN KEY (id_usuari_mesurat) REFERENCES Usuaris(id_usuari),
    ADD CONSTRAINT FK_Mesura_Operari FOREIGN KEY (id_operari) REFERENCES Usuaris(id_usuari);

ALTER TABLE Taula_Avisos 
    ADD CONSTRAINT FK_Avisos_Usuari FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari);


-- ==========================================
-- TRIGGERS (CONTROL DE QUOTES I AUDITORIA)
-- ==========================================

DELIMITER //

-- =====================================================================
-- 1. TRIGGER: Control de trucades diàries i minuts mensuals
-- =====================================================================
CREATE TRIGGER trg_control_quotes_trucades
BEFORE INSERT ON Registre_Trucades
FOR EACH ROW
BEGIN
    DECLARE v_limit_minuts INT;
    DECLARE v_minuts_consumits INT;
    DECLARE v_limit_trucades INT;
    DECLARE v_trucades_avui INT;
    DECLARE v_id_avis INT;
    
    -- Obtenim els límits de l'usuari que fa la trucada (origen)
    SELECT limit_minuts_mes, limit_trucades_dia 
    INTO v_limit_minuts, v_limit_trucades
    FROM Usuaris 
    WHERE id_usuari = NEW.id_origen;
    
    -- A. Control de trucades diàries
    IF v_limit_trucades IS NOT NULL THEN
        -- Comptem les trucades fetes avui per aquest usuari
        SELECT COUNT(*) INTO v_trucades_avui
        FROM Registre_Trucades
        WHERE id_origen = NEW.id_origen 
          AND DATE(data_hora_inici) = DATE(NEW.data_hora_inici);
          
        IF v_trucades_avui >= v_limit_trucades THEN
            -- Generem el proper ID per a la Taula_Avisos (ja que no és AUTO_INCREMENT a l'esquema)
            SELECT COALESCE(MAX(id_avis), 0) + 1 INTO v_id_avis FROM Taula_Avisos;
            
            -- Registrem l'avís d'auditoria
            INSERT INTO Taula_Avisos (id_avis, id_usuari, taula_afectada, operacio_intentada, data_hora, detall_error)
            VALUES (v_id_avis, NEW.id_origen, 'Registre_Trucades', 'INSERT', NOW(), 'S''ha superat el límit de trucades diàries.');
            
            -- Bloquegem la inserció
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Límit de trucades diàries superat.';
        END IF;
    END IF;

    -- B. Control de minuts mensuals
    IF v_limit_minuts IS NOT NULL THEN
        -- Sumem els minuts consumits aquest mes per l'usuari
        SELECT COALESCE(SUM(durada_minuts), 0) INTO v_minuts_consumits
        FROM Registre_Trucades
        WHERE id_origen = NEW.id_origen 
          AND MONTH(data_hora_inici) = MONTH(NEW.data_hora_inici)
          AND YEAR(data_hora_inici) = YEAR(NEW.data_hora_inici);
          
        -- Comprovem si amb la trucada actual se supera el límit
        IF (v_minuts_consumits + NEW.durada_minuts) > v_limit_minuts THEN
            SELECT COALESCE(MAX(id_avis), 0) + 1 INTO v_id_avis FROM Taula_Avisos;
            
            INSERT INTO Taula_Avisos (id_avis, id_usuari, taula_afectada, operacio_intentada, data_hora, detall_error)
            VALUES (v_id_avis, NEW.id_origen, 'Registre_Trucades', 'INSERT', NOW(), 'S''ha superat el límit de minuts mensuals.');
            
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Límit de minuts mensuals superat.';
        END IF;
    END IF;
END//

-- =====================================================================
-- 2. TRIGGER: Auditoria d'accés no autoritzat a taules restringides
-- =====================================================================
-- Aquest trigger s'activa si un usuari de la base de dades associat a vendes o treballador
-- intenta fer un UPDATE a la taula 'Nomines' (pots crear triggers idèntics per INSERT o DELETE).
CREATE TRIGGER trg_auditoria_nomines_update
BEFORE UPDATE ON Nomines
FOR EACH ROW
BEGIN
    DECLARE v_id_avis INT;
    
    -- S'utilitza CURRENT_USER() per detectar quin usuari de BD està llançant la consulta.
    -- Això comprova si el ROL pertany a 'vendes' o 'treballador'.
    IF CURRENT_USER() LIKE 'vendes@%' OR CURRENT_USER() LIKE 'treballador@%' THEN
        SELECT COALESCE(MAX(id_avis), 0) + 1 INTO v_id_avis FROM Taula_Avisos;
        
        -- Registrem l'intent al log d'auditoria
        INSERT INTO Taula_Avisos (id_avis, id_usuari, taula_afectada, operacio_intentada, data_hora, detall_error)
        VALUES (v_id_avis, NULL, 'Nomines', 'UPDATE', NOW(), CONCAT('Intent de modificació no autoritzat per: ', CURRENT_USER()));
        
        -- Bloquegem l'operació
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Accés denegat: El teu rol no permet modificar les nòmines.';
    END IF;
END//

DELIMITER ;
