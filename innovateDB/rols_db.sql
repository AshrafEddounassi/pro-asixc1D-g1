-- Creació dels Rols
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
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Clients TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Comandes TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Productes TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Cistell TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Registre_Trucades TO 'vendes';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Taula_Avisos TO 'vendes'; -- Corregit: avisos -> Taula_Avisos

-- Nota: La restricció de "no poder modificar nòmines" es compleix per defecte al no tenir el GRANT.

-- ==========================================
-- 3. Permisos ROL: administracio
-- ==========================================
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Empleats TO 'administracio'; -- Corregit: personal -> Empleats
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Nomines TO 'administracio';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Departaments TO 'administracio';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Grup_Nivell TO 'administracio';

-- ==========================================
-- 4. Permisos ROL: treballador
-- ==========================================
GRANT SELECT ON innovatetech_gestio.Productes TO 'treballador';
GRANT SELECT ON innovatetech_gestio.Videos_Streaming TO 'treballador'; -- Corregit: videos -> Videos_Streaming
GRANT SELECT ON innovatetech_gestio.Configuracio_Servidor TO 'treballador';
GRANT SELECT, INSERT, UPDATE ON innovatetech_gestio.Registre_Trucades TO 'treballador';

-- Refrescar els privilegis perquè s'apliquin els canvis
FLUSH PRIVILEGES;
