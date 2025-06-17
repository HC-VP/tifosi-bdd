-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 14 juin 2025 à 19:22
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

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

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id`, `nom`, `marque_id`) VALUES
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source ', 2);

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

CREATE TABLE `focaccia` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id`, `nom`, `prix`) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 8.90),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- --------------------------------------------------------

--
-- Structure de la table `focaccia_ingredient`
--

CREATE TABLE `focaccia_ingredient` (
  `focaccia_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `focaccia_ingredient`
--

INSERT INTO `focaccia_ingredient` (`focaccia_id`, `ingredient_id`) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 7),
(1, 9),
(1, 13),
(1, 16),
(1, 18),
(1, 20),
(2, 1),
(2, 5),
(2, 7),
(2, 9),
(2, 11),
(2, 16),
(2, 18),
(2, 20),
(3, 1),
(3, 5),
(3, 7),
(3, 9),
(3, 18),
(3, 20),
(3, 22),
(4, 6),
(4, 7),
(4, 9),
(4, 10),
(4, 15),
(4, 18),
(4, 20),
(5, 5),
(5, 7),
(5, 9),
(5, 12),
(5, 16),
(5, 17),
(5, 18),
(5, 20),
(6, 2),
(6, 4),
(6, 5),
(6, 9),
(6, 16),
(6, 18),
(6, 19),
(6, 20),
(7, 4),
(7, 5),
(7, 9),
(7, 16),
(7, 18),
(7, 20),
(7, 21),
(8, 1),
(8, 3),
(8, 6),
(8, 7),
(8, 9),
(8, 13),
(8, 16),
(8, 18),
(8, 20),
(8, 21);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `nom`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `nom`) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marque_id` (`marque_id`);

--
-- Index pour la table `focaccia`
--
ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `focaccia_ingredient`
--
ALTER TABLE `focaccia_ingredient`
  ADD PRIMARY KEY (`focaccia_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD CONSTRAINT `boisson_ibfk_1` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);

--
-- Contraintes pour la table `focaccia_ingredient`
--
ALTER TABLE `focaccia_ingredient`
  ADD CONSTRAINT `focaccia_ingredient_ibfk_1` FOREIGN KEY (`focaccia_id`) REFERENCES `focaccia` (`id`),
  ADD CONSTRAINT `focaccia_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
