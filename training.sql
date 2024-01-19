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
-- Base de données : `exercice1`
--

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id`, `name`, `adress`) VALUES
(1, 'la_poste', 'issy_les_moulineaux'),
(2, 'chronopost', 'ZERTYUI');

-- --------------------------------------------------------

--
-- Structure de la table `Employee`
--

CREATE TABLE `Employee` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `id_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Employee`
--

INSERT INTO `Employee` (`id`, `name`, `firstname`, `id_company`) VALUES
(1, 'w', 'jenn', 1),
(2, 'jean', 'pierre', 2);

-- --------------------------------------------------------

--
-- Structure de la table `local`
--

CREATE TABLE `local` (
  `id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `id_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `local`
--

INSERT INTO `local` (`id`, `address`, `type`, `id_company`) VALUES
(1, 'balard', 'siege', 1),
(2, 'concorde', 'siege', 2);

-- --------------------------------------------------------

--
-- Structure de la table `local_employee`
--

CREATE TABLE `local_employee` (
  `id` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_local` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `local_employee`
--

INSERT INTO `local_employee` (`id`, `id_employee`, `id_local`) VALUES
(1, 1, 1),
(2, 2, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_employee` (`id_company`);

--
-- Index pour la table `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_company` (`id_company`);

--
-- Index pour la table `local_employee`
--
ALTER TABLE `local_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_employee_employee_local` (`id_employee`) USING BTREE,
  ADD KEY `fk_id_local_employee_local` (`id_local`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `local`
--
ALTER TABLE `local`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `local_employee`
--
ALTER TABLE `local_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `fk_id_employee` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`);

--
-- Contraintes pour la table `local`
--
ALTER TABLE `local`
  ADD CONSTRAINT `fk_id_company` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`);

--
-- Contraintes pour la table `local_employee`
--
ALTER TABLE `local_employee`
  ADD CONSTRAINT `fk_id_local_employee_company` FOREIGN KEY (`id_local`) REFERENCES `local` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
