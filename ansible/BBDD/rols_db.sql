- Creació dels Rols
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'vendes';
CREATE ROLE IF NOT EXISTS 'administracio';
CREATE ROLE IF NOT EXISTS 'treballador';

-- ==========================================
-- 1. Permisos ROL: admin
-- ==========================================
GRANT ALL PRIVILEGES ON *.* TO 'admin' WITH GRANT OPTION;
GRANT FILE ON *.* TO 'admin'; -- Permís especial per a backups

-- ==========================================
-- 2. Permisos ROL: vendes
-- ==========================================
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.clients TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.comandes TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.productes TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.cistell TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Registre_Trucades TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.avisos TO 'vendes';
-- Nota: La restricció de "no poder modificar nòmines" es compleix per defecte al no tenir el GRANT.

-- ==========================================
-- 3. Permisos ROL: administracio
-- ==========================================
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.personal TO 'administracio';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.nomines TO 'administracio';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Departaments TO 'administracio';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.grup_nivell TO 'administracio';

-- ==========================================
-- 4. Permisos ROL: treballador
-- ==========================================
GRANT SELECT ON innovatetech_gestio.productes TO 'treballador';
GRANT SELECT ON innovatetech_gestio.videos TO 'treballador';
GRANT SELECT ON innovatetech_gestio.Configuracio_Servidor TO 'treballador';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Registre_Trucades TO 'treballador';

FLUSH PRIVILEGES;
