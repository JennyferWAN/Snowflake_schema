-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 18 jan. 2024 à 14:49
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
-- Base de données : `stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `Products_Fournisseur`
--

CREATE TABLE `Products_Fournisseur` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Products_Fournisseur`
--
ALTER TABLE `Products_Fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_product_product_fournisseur` (`id_products`),
  ADD KEY `fk_id_fournisseur_product_fournisseur` (`id_fournisseur`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Products_Fournisseur`
--
ALTER TABLE `Products_Fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Products_Fournisseur`
--
ALTER TABLE `Products_Fournisseur`
  ADD CONSTRAINT `fk_id_product_fournisseur_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `Fournisseur` (`id`),
  ADD CONSTRAINT `fk_id_product_product_fournisseur` FOREIGN KEY (`id_products`) REFERENCES `Products` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
