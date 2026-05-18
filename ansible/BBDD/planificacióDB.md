Table Departaments {
  codi_departament varchar [primary key]
  nom_departament varchar 
  telefon_departament varchar 
}

Table Grup_Nivell {
  id_grup integer [primary key]
  nom_grup varchar
  salari_base decimal
}

Table Empleats {
  dni varchar [primary key]
  nom varchar 
  cognoms varchar 
  adreca text 
  telefon varchar 
  codi_departament varchar
  id_grup integer
}

Table Nomines {
  id_nomina integer [primary key]
  dni_empleat varchar
  mes integer
  any integer
  import_total decimal
}

Table Clients {
  id_client integer [primary key]
  nom_empresa varchar
  contacte varchar
  email varchar
  telefon varchar
}

Table Productes {
  id_producte integer [primary key]
  nom varchar
  descripcio text
  preu decimal
}

Table Comandes {
  id_comanda integer [primary key]
  id_client integer
  data_comanda timestamp
  total decimal
}

Table Cistell {
  id_cistell integer [primary key]
  id_client integer
  id_producte integer
  quantitat integer
}

Table Usuaris {
  id_usuari integer [primary key]
  nom_complet varchar
  email varchar [unique]
  extensio_trucades varchar
  estat varchar [note: 'actiu o bloquejat']
  enllac_trucada varchar
  tipus_usuari varchar [note: 'intern o extern']
  rol varchar [note: 'admin, vendes, administracio, treballador']
  dni_empleat varchar [note: 'Nul si es client']
  id_client integer [note: 'Nul si es empleat intern']
  limit_minuts_mes integer [note: 'Per al control de quotes (triggers)']
  limit_trucades_dia integer [note: 'Per al control de quotes (triggers)']
}

Table Grup_Qualitat {
  id_qualitat integer [primary key]
  nom_perfil varchar [note: 'alta, mitja, baixa']
  resolucio varchar
  bitrate integer
  id_qualitat_inferior integer [note: 'Autoreferència per baixar qualitat si falla la xarxa']
}

Table Configuracio_Servidor {
  id_configuracio integer [primary key]
  parametre varchar
  valor varchar
  port integer
  protocol varchar
  descripcio text
}

Table Registre_Trucades {
  id_trucada integer [primary key]
  id_origen integer 
  id_destinacio integer 
  data_hora_inici timestamp
  data_hora_fi timestamp
  durada_minuts integer
  id_qualitat integer 
  puntuacio integer
  comentari text
}

Table Videos_Streaming {
  id_video integer [primary key]
  titol varchar
  descripcio text
  categoria varchar
  durada_minuts integer
  data_publicacio timestamp
  enllac_servidor varchar
}

Table Mesura_Banda {
  id_mesura integer [primary key]
  data_hora timestamp
  id_usuari_mesurat integer
  equip_mesurat varchar
  velocitat_baixada decimal
  velocitat_pujada decimal
  latencia integer
  resultat varchar [note: 'acceptable o no acceptable']
  id_operari integer 
  observacions text
}

Table Taula_Avisos {
  id_avis integer [primary key]
  id_usuari integer
  taula_afectada varchar
  operacio_intentada varchar
  data_hora timestamp
  detall_error text
}

Table Control_Backups {
  id_backup integer [primary key]
  data_hora timestamp
  taules_incloses text
  resultat varchar
  ruta_fitxer varchar
}

// --- RELACIONS (Foreign Keys) ---

Ref: Empleats.codi_departament > Departaments.codi_departament
Ref: Empleats.id_grup > Grup_Nivell.id_grup
Ref: Nomines.dni_empleat > Empleats.dni

Ref: Comandes.id_client > Clients.id_client
Ref: Cistell.id_client > Clients.id_client
Ref: Cistell.id_producte > Productes.id_producte

Ref: Usuaris.dni_empleat > Empleats.dni
Ref: Usuaris.id_client > Clients.id_client

Ref: Grup_Qualitat.id_qualitat_inferior - Grup_Qualitat.id_qualitat

Ref: Registre_Trucades.id_origen > Usuaris.id_usuari
Ref: Registre_Trucades.id_destinacio > Usuaris.id_usuari
Ref: Registre_Trucades.id_qualitat > Grup_Qualitat.id_qualitat

Ref: Mesura_Banda.id_usuari_mesurat > Usuaris.id_usuari
Ref: Mesura_Banda.id_operari > Usuaris.id_usuari

Ref: Taula_Avisos.id_usuari > Usuaris.id_usuari
