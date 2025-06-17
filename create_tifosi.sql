-- Script de création de la base de données Tifosi

CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;


CREATE TABLE `boisson` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `marque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `focaccia` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `focaccia_ingredient` (
  `focaccia_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marque_id` (`marque_id`);

ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `focaccia_ingredient`
  ADD PRIMARY KEY (`focaccia_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `boisson`
  ADD CONSTRAINT `boisson_ibfk_1` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);

ALTER TABLE `focaccia_ingredient`
  ADD CONSTRAINT `focaccia_ingredient_ibfk_1` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia` (`id`),
  ADD CONSTRAINT `focaccia_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);