# Projet Base de Données – Tifosi

Ce projet a été réalisé avec pour objectif de modéliser, créer, peupler et sauvegarder une base de données en MySQL à partir d’un besoin métier.

L’utilisateur tifosi a été créé et a tous les droits sur la base.

## Structure de la base de données

La base `tifosi` contient les tables suivantes :

- `marque` : les marques de boissons;
- `ingredient` : les ingrédients utilisés;
- `focaccia` : les types de focaccias disponibles;
- `boisson` : les boissons disponibles, reliées à une marque;
- `focaccia_ingredient` : table de liaison entre focaccias et ingrédients


## Instructions d’utilisation

### 1. Création de la base
Importer `create_tifosi.sql` dans **phpMyAdmin** ou via le terminal MySQL.

### 2. Insertion des données
Importer ensuite `insert_data_tifosi.sql`.

### 3. Sauvegarde complète
Le fichier `tifosi.sql` peut être utilisé pour restaurer la base de données entièrement avec structure + données.

---

## Environnement

- **MySQL** via **XAMPP**
- Données traitées à partir de fichiers `.xlsx`
- Travail effectué en partie avec le terminal et en partie avec `phpMyAdmin`


