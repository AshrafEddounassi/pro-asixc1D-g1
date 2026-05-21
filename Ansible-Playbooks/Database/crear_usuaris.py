#!/usr/bin/env python3
import sys

ROLS_VALIDS = ['admin', 'vendes', 'administracio', 'treballador']

def obtenir_dades_usuari():
    print("\n--- Nou Usuari ---")
    nom = input("Nom d'usuari: ").strip()
    if not nom:
        return None
    password = input("Contrasenya: ").strip()
    rol = input(f"Rol {ROLS_VALIDS}: ").strip().lower()
    
    if rol not in ROLS_VALIDS:
        print(f"❌ Error: El rol '{rol}' no és vàlid.")
        return None
        
    return (nom, password, rol)

def main():
    print("=== Generador d'Usuaris MariaDB ===")
    usuaris = []
    
    while True:
        usuari = obtenir_dades_usuari()
        if usuari:
            usuaris.append(usuari)
        
        continuar = input("\nVols afegir un altre usuari? (s/n): ").lower()
        if continuar != 's':
            break

    if not usuaris:
        print("No s'han introduït usuaris. Sortint...")
        sys.exit(0)

    fitxer_sortida = "usuaris_generats.sql"
    
    try:
        with open(fitxer_sortida, 'w') as f:
            f.write("-- Script autogenerat de creació d'usuaris\n\n")
            for nom, password, rol in usuaris:
                f.write(f"-- Creació usuari: {nom} (Rol: {rol})\n")
                f.write(f"CREATE USER IF NOT EXISTS '{nom}'@'%' IDENTIFIED BY '{password}';\n")
                f.write(f"GRANT '{rol}' TO '{nom}'@'%';\n")
                f.write(f"SET DEFAULT ROLE '{rol}' FOR '{nom}'@'%';\n\n")
            
            f.write("FLUSH PRIVILEGES;\n")
            
        print(f"\n✅ Èxit! S'ha generat el fitxer '{fitxer_sortida}'.")
        print("Pots importar-lo al teu servidor executant:")
        print(f"mysql -u root -p < {fitxer_sortida}")
        
    except Exception as e:
        print(f"❌ Error en escriure el fitxer: {e}")

if __name__ == "__main__":
    main()
