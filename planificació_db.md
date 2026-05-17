[Empleats]
- dni: VARCHAR; PK
- nom: VARCHAR; 
- cognoms: VARCHAR; 
- adreça: VARCHAR; 
- telefon: VARCHAR; 
- codi-departament: VARCHAR; FK --> (Departament: codi-departament) 

[Departament]
- codi-departament: VARCHAR; PK
- nom-departament: VARCHAR; 
- telefon-departament: VARCHAR; 

[Usuaris]
- id-usuaris: ; PK
- nom:
- email:
- id-trucada:
- estat:
- enllaç-trucada:
- rol:
- tipus-usuaris:
- dni-empleat: ; FK

[Perfil-Qualitat]
- id-perfil: ; PK
- nom-perfil:
- detalls-tecnics:
- perfil-inferior:

[Configuracio-Servidor]
- paramatre: ; PK
- valor:
- descripcio:

[Registre-Trucades]
- id-trucada: ; PK
- id-origen: ; FK
- id-destinacio: ; FK
- data-inici:
- data-fi:
- durada:
- perfil-qualitat: ; FK
- puntaucio:
- comentari:

[Mesura-Banda]
- id-mesura: ; PK
- data:
- id-usuari:
- equip-mesurat:
- velocitat-baixada:
- velocidad-pujada:
- latencia:
- resultat:
- id-operatiu: ; FK
- observacio:
