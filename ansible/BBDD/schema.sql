-- Creació de les taules (respectant l'ordre per les claus foranes)
CREATE TABLE IF NOT EXISTS Departaments (
    codi_departament VARCHAR(10) PRIMARY KEY,
    nom_departament VARCHAR(100) NOT NULL,
    telefon_departament VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Empleats (
    dni VARCHAR(20) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    adreca VARCHAR(255),
    telefon VARCHAR(20),
    codi_departament VARCHAR(10) NOT NULL,
    CONSTRAINT fk_empleats_dept FOREIGN KEY (codi_departament) REFERENCES Departaments(codi_departament) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Perfils_Qualitat (
    id_perfil INT AUTO_INCREMENT PRIMARY KEY,
    nom_perfil VARCHAR(50) NOT NULL,
    detalls_tecnics VARCHAR(255),
    id_perfil_inferior INT NULL,
    CONSTRAINT fk_qualitat_fallback FOREIGN KEY (id_perfil_inferior) REFERENCES Perfils_Qualitat(id_perfil) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Usuaris (
    id_usuari INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    id_extensio VARCHAR(20) NOT NULL UNIQUE,
    estat ENUM('Actiu', 'Bloquejat') DEFAULT 'Actiu',
    enllaç_trucada VARCHAR(255),
    rol VARCHAR(50) NOT NULL,
    tipus_usuari ENUM('Intern', 'Extern') NOT NULL,
    dni_empleat VARCHAR(20) NULL,
    CONSTRAINT fk_usuaris_empleats FOREIGN KEY (dni_empleat) REFERENCES Empleats(dni) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Configuracio_Servidor (
    parametre VARCHAR(100) PRIMARY KEY,
    valor VARCHAR(255) NOT NULL,
    descripcio TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Registre_Trucades (
    id_trucada INT AUTO_INCREMENT PRIMARY KEY,
    id_origen INT NOT NULL,
    id_destinacio INT NOT NULL,
    data_hora_inici DATETIME NOT NULL,
    data_hora_fi DATETIME NOT NULL,
    durada INT,
    id_perfil_usat INT NOT NULL,
    puntuacio TINYINT NULL CHECK (puntuacio BETWEEN 1 AND 5),
    comentari TEXT,
    CONSTRAINT fk_origen FOREIGN KEY (id_origen) REFERENCES Usuaris(id_usuari),
    CONSTRAINT fk_desti FOREIGN KEY (id_destinacio) REFERENCES Usuaris(id_usuari),
    CONSTRAINT fk_perfil_usat FOREIGN KEY (id_perfil_usat) REFERENCES Perfils_Qualitat(id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Mesures_Banda (
    id_mesura INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_usuari_mesurat INT NOT NULL,
    equip_mesurat VARCHAR(100),
    velocitat_baixada DECIMAL(6,2) NOT NULL,
    velocitat_pujada DECIMAL(6,2) NOT NULL,
    latencia INT NOT NULL,
    resultat ENUM('Acceptable', 'No acceptable') NOT NULL,
    id_operari INT NOT NULL,
    observacions TEXT,
    CONSTRAINT fk_usuari_mesurat FOREIGN KEY (id_usuari_mesurat) REFERENCES Usuaris(id_usuari),
    CONSTRAINT fk_operari FOREIGN KEY (id_operari) REFERENCES Usuaris(id_usuari)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
