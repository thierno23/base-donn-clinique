-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mar. 19 mai 2020 à 21:43
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_hopital`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `idD` int(11) NOT NULL,
  PRIMARY KEY (`idC`),
  KEY `Chambre_Idx` (`type`,`categorie`),
  KEY `Chambre_Departement_FK` (`idD`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`idC`, `numero`, `type`, `categorie`, `idD`) VALUES
(1, 1, 'interne', 'bloc A', 1),
(2, 2, 'repos', 'bloc B', 2),
(3, 3, 'reveil', 'bloc A', 2);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `idD` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`idD`),
  KEY `Departement_Idx` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`idD`, `nom`) VALUES
(1, 'D1'),
(2, 'D2'),
(3, 'D3');

-- --------------------------------------------------------

--
-- Structure de la table `feuille_evolution`
--

DROP TABLE IF EXISTS `feuille_evolution`;
CREATE TABLE IF NOT EXISTS `feuille_evolution` (
  `idT` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `date` date NOT NULL,
  `idM` int(11) NOT NULL,
  `idD` int(11) NOT NULL,
  PRIMARY KEY (`idT`),
  KEY `Feuille_evolution_Idx` (`numero`,`date`),
  KEY `Feuille_evolution_Malade_FK` (`idM`),
  KEY `Feuille_evolution_Departement0_FK` (`idD`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `feuille_evolution`
--

INSERT INTO `feuille_evolution` (`idT`, `numero`, `date`, `idM`, `idD`) VALUES
(1, 774569852, '2017-08-11', 11, 1),
(2, 781456987, '2018-03-01', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

DROP TABLE IF EXISTS `lit`;
CREATE TABLE IF NOT EXISTS `lit` (
  `idL` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `etat` varchar(50) NOT NULL,
  `id_Chambre` int(11) NOT NULL,
  PRIMARY KEY (`idL`),
  KEY `Lit_Idx` (`numero`,`etat`),
  KEY `Lit_Chambre_FK` (`id_Chambre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`idL`, `numero`, `etat`, `id_Chambre`) VALUES
(2, 2, 'bon', 1),
(3, 3, 'passable', 1),
(21, 21, 'pas mal', 2);

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

DROP TABLE IF EXISTS `malade`;
CREATE TABLE IF NOT EXISTS `malade` (
  `idM` int(11) NOT NULL AUTO_INCREMENT,
  `sexe` varchar(50) NOT NULL,
  `adresse` text NOT NULL,
  `nom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `lieu_naissance` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`idM`),
  KEY `nom_Idx` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`idM`, `sexe`, `adresse`, `nom`, `date_naissance`, `lieu_naissance`, `numero`) VALUES
(1, 'Masculin', 'Fann', 'omar', '2012-04-22', 'dakar', 773021478),
(2, 'Féminin', 'Parcelles', 'Amy', '2006-03-05', 'Mbour', 771458547),
(3, 'Féminin', 'Pikine', 'Arame', '1995-04-22', 'Ngay', 781456987),
(4, 'Féminin', 'Nord-Foire', 'Astou', '2009-10-13', 'Dakar', 776854712),
(5, 'Masculin', 'Maristes', 'Modou', '1995-07-12', 'HLM3', 774588695),
(11, 'Masculin', 'Yeumbeul', 'bala', '2015-07-02', 'fass', 774569852);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `idMe` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `idS` int(11) NOT NULL,
  PRIMARY KEY (`idMe`),
  KEY `Medecin_Idx` (`numero`,`nom`),
  KEY `Medecin_Specialite_FK` (`idS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`idMe`, `numero`, `nom`, `idS`) VALUES
(1, 772502000, 'Aly', 1),
(2, 760452523, 'Wane', 2),
(3, 773033815, 'thierno', 1),
(4, 771234578, 'mbaye', 1);

-- --------------------------------------------------------

--
-- Structure de la table `occuper`
--

DROP TABLE IF EXISTS `occuper`;
CREATE TABLE IF NOT EXISTS `occuper` (
  `id` int(11) NOT NULL,
  `idM` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Occuper_Malade0_FK` (`idM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `occuper`
--

INSERT INTO `occuper` (`id`, `idM`) VALUES
(2, 1),
(21, 1);

-- --------------------------------------------------------

--
-- Structure de la table `se_trouver`
--

DROP TABLE IF EXISTS `se_trouver`;
CREATE TABLE IF NOT EXISTS `se_trouver` (
  `idD` int(11) NOT NULL,
  `idMe` int(11) NOT NULL,
  PRIMARY KEY (`idD`),
  KEY `Se_trouver_Medecin0_FK` (`idMe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `se_trouver`
--

INSERT INTO `se_trouver` (`idD`, `idMe`) VALUES
(1, 1),
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `idS` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` text NOT NULL,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`idS`),
  KEY `libelle` (`libelle`(30))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`idS`, `libelle`, `code`) VALUES
(1, 'Chirurgie', '001'),
(2, 'Odontologie', '002'),
(3, 'Cardiologie ', '003'),
(4, 'Pédiatre', '004'),
(5, 'Ophtalmologie', '005');

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
CREATE TABLE IF NOT EXISTS `suivre` (
  `idMe` int(11) NOT NULL,
  `idM` int(11) NOT NULL,
  PRIMARY KEY (`idMe`),
  KEY `Suivre_Malade0_FK` (`idM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`idMe`, `idM`) VALUES
(3, 1),
(4, 2),
(1, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `Chambre_Departement_FK` FOREIGN KEY (`idD`) REFERENCES `departement` (`idD`);

--
-- Contraintes pour la table `feuille_evolution`
--
ALTER TABLE `feuille_evolution`
  ADD CONSTRAINT `Feuille_evolution_Departement0_FK` FOREIGN KEY (`idD`) REFERENCES `departement` (`idD`),
  ADD CONSTRAINT `Feuille_evolution_Malade_FK` FOREIGN KEY (`idM`) REFERENCES `malade` (`idM`);

--
-- Contraintes pour la table `lit`
--
ALTER TABLE `lit`
  ADD CONSTRAINT `Lit_Chambre_FK` FOREIGN KEY (`id_Chambre`) REFERENCES `chambre` (`idC`);

--
-- Contraintes pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD CONSTRAINT `Medecin_Specialite_FK` FOREIGN KEY (`idS`) REFERENCES `specialite` (`idS`);

--
-- Contraintes pour la table `occuper`
--
ALTER TABLE `occuper`
  ADD CONSTRAINT `Occuper_Lit_FK` FOREIGN KEY (`id`) REFERENCES `lit` (`idL`),
  ADD CONSTRAINT `Occuper_Malade0_FK` FOREIGN KEY (`idM`) REFERENCES `malade` (`idM`);

--
-- Contraintes pour la table `se_trouver`
--
ALTER TABLE `se_trouver`
  ADD CONSTRAINT `Se_trouver_Departement_FK` FOREIGN KEY (`idD`) REFERENCES `departement` (`idD`),
  ADD CONSTRAINT `Se_trouver_Medecin0_FK` FOREIGN KEY (`idMe`) REFERENCES `medecin` (`idMe`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `Suivre_Malade0_FK` FOREIGN KEY (`idM`) REFERENCES `malade` (`idM`),
  ADD CONSTRAINT `Suivre_Medecin_FK` FOREIGN KEY (`idMe`) REFERENCES `medecin` (`idMe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
