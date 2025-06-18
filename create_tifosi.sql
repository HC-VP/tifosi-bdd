-- Script de création de la base de données Tifosi

CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE client (
  `id_client` int(11) NOT NULL,
  `nom_client` VARCHAR(45) NOT NULL,
  `age` int(11) NOT NULL,
  `cp_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(45) NOT NULL,
  `marque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `focaccia` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prix` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `focaccia_ingredient` (
  `focaccia_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE menu (
  `id_menu` int(11) NOT NULL,
  `nom_menu` varchar(45) NOT NULL,
  `prix_menu` FLOAT,
  `focaccia_id` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE menu_boisson (
  `id_menu` int(45) NOT NULL,
  `id_boisson` int(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE achete (
  `id_client` int(45) NOT NULL,
  `focaccia_id` int(45) NOT NULL,
  `jour` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE paye (
  `id_client` int(45) NOT NULL,
  `id_menu` int(45) NOT NULL,
  `jour` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`),
  ADD KEY `marque_id` (`marque_id`);

ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `focaccia_ingredient`
  ADD PRIMARY KEY (`focaccia_id`,`ingredient_id`),
  ADD KEY `focaccia_id` (`focaccia_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

ALTER TABLE `menu` 
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `focaccia_id` (`focaccia_id`);

ALTER TABLE `menu_boisson`
  ADD PRIMARY KEY (`id_menu`,`id_boisson`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_boisson` (`id_boisson`);  

ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `achete`
  ADD PRIMARY KEY (`id_client`, `focaccia_id`, `jour`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `focaccia_id` (`focaccia_id`);

ALTER TABLE `paye`
  ADD PRIMARY KEY (`id_client`, `id_menu`, `jour`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_menu` (`id_menu`);






ALTER TABLE `boisson`
  ADD CONSTRAINT `boisson_ibfk_1` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);

ALTER TABLE `focaccia_ingredient`
  ADD CONSTRAINT `focaccia_ingredient_ibfk_1` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia` (`id`),
  ADD CONSTRAINT `focaccia_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);

ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_focaccia` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia`(`id`);


ALTER TABLE `menu_boisson`
  ADD CONSTRAINT `fk_menu_boisson_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu`(`id_menu`),
  ADD CONSTRAINT `fk_menu_boisson_boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson`(`id_boisson`);


ALTER TABLE `achete`
  ADD CONSTRAINT `fk_achete_client` FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`),
  ADD CONSTRAINT `fk_achete_focaccia` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia`(`id`);

ALTER TABLE `paye`
  ADD CONSTRAINT `fk_paye_client` FOREIGN KEY (`id_client`) REFERENCES `client`(`id_client`),
  ADD CONSTRAINT `fk_paye_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu`(`id_menu`);
