-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 19 jan. 2024 à 19:34
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `evaluation`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `account`
--

INSERT INTO `account` (`id`, `name`, `address`, `id_employee`) VALUES
(1, 'jenn', 'rtcfyvgubh', 1),
(2, 'pierre', 'ynj', 2);

-- --------------------------------------------------------

--
-- Structure de la table `account_customer`
--

CREATE TABLE `account_customer` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `account_customer`
--

INSERT INTO `account_customer` (`id`, `id_customer`, `id_account`) VALUES
(1, 1, 2),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id`, `name`, `address`) VALUES
(1, 'la_poste', 'issy_les_moulineaux'),
(2, 'chronopost', 'cghvjbkn');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `id_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `name`, `firstname`, `id_company`) VALUES
(1, 'w', 'jenn', 1),
(2, 'pierre', 'jean', 2);

-- --------------------------------------------------------

--
-- Structure de la table `customer_machine`
--

CREATE TABLE `customer_machine` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_machine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customer_machine`
--

INSERT INTO `customer_machine` (`id`, `id_customer`, `id_machine`) VALUES
(1, 1, 2),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `id_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `machine`
--

INSERT INTO `machine` (`id`, `address`, `type`, `id_company`) VALUES
(1, 'balard', 'siege', 1),
(2, 'concorde', 'siege', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `account_customer`
--
ALTER TABLE `account_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_customer_account_customer` (`id_customer`),
  ADD KEY `fk_id_account_account_customer` (`id_account`);

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_machine`
--
ALTER TABLE `customer_machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_customer_customer_machine` (`id_customer`),
  ADD KEY `fk_id_machine_customer_machine` (`id_machine`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `account_customer`
--
ALTER TABLE `account_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `customer_machine`
--
ALTER TABLE `customer_machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `account_customer`
--
ALTER TABLE `account_customer`
  ADD CONSTRAINT `fk_id_account_account_customer` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `fk_id_customer_account_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

--
-- Contraintes pour la table `customer_machine`
--
ALTER TABLE `customer_machine`
  ADD CONSTRAINT `fk_id_customer_customer_machine` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_id_machine_customer_machine` FOREIGN KEY (`id_machine`) REFERENCES `machine` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
