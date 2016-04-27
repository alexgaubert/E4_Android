-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 27 Avril 2016 à 03:10
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bd_ppe4_gaubertetco`
--

-- --------------------------------------------------------

--
-- Structure de la table `annee`
--

CREATE TABLE IF NOT EXISTS `annee` (
  `NUM_ANNEE` bigint(20) NOT NULL,
  PRIMARY KEY (`NUM_ANNEE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `annee`
--

INSERT INTO `annee` (`NUM_ANNEE`) VALUES
(2016),
(2017),
(2018),
(2019);

-- --------------------------------------------------------

--
-- Structure de la table `camping`
--

CREATE TABLE IF NOT EXISTS `camping` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `chambrehotes`
--

CREATE TABLE IF NOT EXISTS `chambrehotes` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `NB_CHAMBRES` int(11) DEFAULT NULL,
  `CUISINECOMMUNE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE IF NOT EXISTS `connexion` (
  `id_connexion` int(11) NOT NULL,
  `motdepasse` varchar(15) NOT NULL,
  PRIMARY KEY (`id_connexion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contre_visite`
--

CREATE TABLE IF NOT EXISTS `contre_visite` (
  `ID_VISITE` int(11) NOT NULL,
  `ID_CONTREVISITE` int(11) NOT NULL,
  `ID_INSPECTEUR` int(11) DEFAULT NULL,
  `DATE_CONTREVISTITE` date DEFAULT NULL,
  `HEURE` time DEFAULT NULL,
  `NBETOILESMOINS` int(11) DEFAULT NULL,
  `COMMENTAIRES` text,
  PRIMARY KEY (`ID_VISITE`,`ID_CONTREVISITE`),
  KEY `I_FK_CONTRE_VISITE_INSPECTEUR` (`ID_INSPECTEUR`),
  KEY `I_FK_CONTRE_VISITE_VISITE` (`ID_VISITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `NUM_DEPARTEMENT` int(11) NOT NULL,
  `NOM_DEPARTEMENT` char(32) DEFAULT NULL,
  PRIMARY KEY (`NUM_DEPARTEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE IF NOT EXISTS `equipement` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `ID_EQUIPEMENT` int(11) NOT NULL,
  `LIBELLE_EQUIPEMENT` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`,`ID_EQUIPEMENT`),
  KEY `I_FK_EQUIPEMENT_CAMPING` (`ID_HEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE IF NOT EXISTS `gerant` (
  `ID_GERANT` int(11) NOT NULL,
  `NOM_GERANT` char(32) DEFAULT NULL,
  `TELEPHONE` int(11) DEFAULT NULL,
  `MAIL` char(32) DEFAULT NULL,
  `ADRESSE_GERANT` char(32) DEFAULT NULL,
  `CODEPOSTAL_GERANT` bigint(20) DEFAULT NULL,
  `VILLE_GERANT` char(32) DEFAULT NULL,
  `MOTDEPASSE` text,
  PRIMARY KEY (`ID_GERANT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `gerant`
--

INSERT INTO `gerant` (`ID_GERANT`, `NOM_GERANT`, `TELEPHONE`, `MAIL`, `ADRESSE_GERANT`, `CODEPOSTAL_GERANT`, `VILLE_GERANT`, `MOTDEPASSE`) VALUES
(1, 'x', 708090405, 'xx@hotmail.com', '10 rue bressigny', 49000, 'Angers', 'xx');

-- --------------------------------------------------------

--
-- Structure de la table `gerer`
--

CREATE TABLE IF NOT EXISTS `gerer` (
  `ID_GERANT` int(11) NOT NULL,
  `ID_HEBERGEMENT` int(11) NOT NULL,
  PRIMARY KEY (`ID_GERANT`,`ID_HEBERGEMENT`),
  KEY `I_FK_GERER_GERANT` (`ID_GERANT`),
  KEY `I_FK_GERER_HEBERGEMENT` (`ID_HEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `gerer`
--

INSERT INTO `gerer` (`ID_GERANT`, `ID_HEBERGEMENT`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `hebergement`
--

CREATE TABLE IF NOT EXISTS `hebergement` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `ID_SPECIALITE` int(11) NOT NULL,
  `ADRESSE` char(32) DEFAULT NULL,
  `CODE_POSTAL` bigint(20) DEFAULT NULL,
  `VILLE` char(32) DEFAULT NULL,
  `TEL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`),
  KEY `I_FK_HEBERGEMENT_SPECIALITE` (`ID_SPECIALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `hebergement`
--

INSERT INTO `hebergement` (`ID_HEBERGEMENT`, `ID_SPECIALITE`, `ADRESSE`, `CODE_POSTAL`, `VILLE`, `TEL`) VALUES
(1, 1, '1 rue louis pasteur', 49000, 'Angers', 241565758),
(2, 1, '45 rue de hollande', 75000, 'Paris', 407080936),
(3, 1, '8 rue de fribourg', 13000, 'Marseille', 698415836),
(4, 1, '125 rue de montmatre', 35000, 'Rennes', 102030405);

-- --------------------------------------------------------

--
-- Structure de la table `historiqueetoiles`
--

CREATE TABLE IF NOT EXISTS `historiqueetoiles` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `NUM_ANNEE` bigint(20) NOT NULL,
  `NBETOILES` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`,`NUM_ANNEE`),
  KEY `I_FK_HISTORIQUEETOILES_HEBERGEMENT` (`ID_HEBERGEMENT`),
  KEY `I_FK_HISTORIQUEETOILES_ANNEE` (`NUM_ANNEE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `historiqueetoiles`
--

INSERT INTO `historiqueetoiles` (`ID_HEBERGEMENT`, `NUM_ANNEE`, `NBETOILES`) VALUES
(1, 2016, '3');

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `inspecteur`
--

CREATE TABLE IF NOT EXISTS `inspecteur` (
  `ID_INSPECTEUR` int(11) NOT NULL,
  `ID_SPECIALITE` int(11) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  `ADRESSE` char(32) DEFAULT NULL,
  `CODE_POSTAL` bigint(20) DEFAULT NULL,
  `TEL` bigint(20) DEFAULT NULL,
  `NOMUTILISATEUR` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `MOTDEPASSE` varchar(32) NOT NULL,
  PRIMARY KEY (`ID_INSPECTEUR`),
  KEY `I_FK_INSPECTEUR_SPECIALITE` (`ID_SPECIALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `inspecteur`
--

INSERT INTO `inspecteur` (`ID_INSPECTEUR`, `ID_SPECIALITE`, `NOM`, `PRENOM`, `ADRESSE`, `CODE_POSTAL`, `TEL`, `NOMUTILISATEUR`, `MOTDEPASSE`) VALUES
(1, 1, 'François', 'Hollande', 'elyse', 75000, NULL, '', 'FH'),
(2, 1, 'GAUBERT', 'Alex', NULL, NULL, NULL, 'agaubert', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `ID_CHEF` int(11) NOT NULL,
  `ID_CUISINE` int(11) NOT NULL,
  `NOM_CHEF` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`,`ID_CHEF`),
  KEY `I_FK_RESTAURANT_HOTEL` (`ID_HEBERGEMENT`),
  KEY `I_FK_RESTAURANT_TYPECUISINE` (`ID_CUISINE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `semaine`
--

CREATE TABLE IF NOT EXISTS `semaine` (
  `NUM_ANNEE` bigint(20) NOT NULL,
  `NUM_SEMAINE` int(11) NOT NULL,
  `DATE_DEBUT` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`NUM_ANNEE`,`NUM_SEMAINE`),
  KEY `I_FK_SEMAINE_ANNEE` (`NUM_ANNEE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `se_trouver`
--

CREATE TABLE IF NOT EXISTS `se_trouver` (
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `NUM_DEPARTEMENT` int(11) NOT NULL,
  PRIMARY KEY (`ID_HEBERGEMENT`,`NUM_DEPARTEMENT`),
  KEY `I_FK_SE_TROUVER_HEBERGEMENT` (`ID_HEBERGEMENT`),
  KEY `I_FK_SE_TROUVER_DEPARTEMENT` (`NUM_DEPARTEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `se_voit_attribuer`
--

CREATE TABLE IF NOT EXISTS `se_voit_attribuer` (
  `NUM_ANNEE` bigint(20) NOT NULL,
  `NUM_SEMAINE` int(11) NOT NULL,
  `ID_INSPECTEUR` int(11) NOT NULL,
  `NUM_DEPARTEMENT` int(11) NOT NULL,
  PRIMARY KEY (`NUM_ANNEE`,`NUM_SEMAINE`,`ID_INSPECTEUR`),
  KEY `I_FK_SE_VOIT_ATTRIBUER_DEPARTEMENT` (`NUM_DEPARTEMENT`),
  KEY `I_FK_SE_VOIT_ATTRIBUER_SEMAINE` (`NUM_ANNEE`,`NUM_SEMAINE`),
  KEY `I_FK_SE_VOIT_ATTRIBUER_INSPECTEUR` (`ID_INSPECTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `ID_SPECIALITE` int(11) NOT NULL,
  `LIBELLE_SPECIALITE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_SPECIALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`ID_SPECIALITE`, `LIBELLE_SPECIALITE`) VALUES
(1, 'Hotel');

-- --------------------------------------------------------

--
-- Structure de la table `typecuisine`
--

CREATE TABLE IF NOT EXISTS `typecuisine` (
  `ID_CUISINE` int(11) NOT NULL,
  `LIBELLE_CUISINE` char(32) DEFAULT NULL,
  PRIMARY KEY (`ID_CUISINE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE IF NOT EXISTS `visite` (
  `ID_VISITE` int(11) NOT NULL,
  `ID_INSPECTEUR` int(11) DEFAULT NULL,
  `ID_HEBERGEMENT` int(11) NOT NULL,
  `DATE_VISITE` date DEFAULT NULL,
  `HEURE` time DEFAULT NULL,
  `NBETOILESPLUS` int(11) DEFAULT NULL,
  `COMMENTAIRE` text,
  `test1` varchar(20) NOT NULL,
  `test2` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_VISITE`),
  KEY `I_FK_VISITE_INSPECTEUR` (`ID_INSPECTEUR`),
  KEY `I_FK_VISITE_HEBERGEMENT` (`ID_HEBERGEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `visite`
--

INSERT INTO `visite` (`ID_VISITE`, `ID_INSPECTEUR`, `ID_HEBERGEMENT`, `DATE_VISITE`, `HEURE`, `NBETOILESPLUS`, `COMMENTAIRE`, `test1`, `test2`) VALUES
(1, 2, 1, NULL, NULL, NULL, NULL, 'ah oui', 'peut etre'),
(2, 2, 3, NULL, NULL, NULL, NULL, 'babouche', 'caca'),
(3, 2, 2, NULL, NULL, NULL, NULL, 'babibule', 'truc');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `camping`
--
ALTER TABLE `camping`
  ADD CONSTRAINT `camping_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`);

--
-- Contraintes pour la table `chambrehotes`
--
ALTER TABLE `chambrehotes`
  ADD CONSTRAINT `chambrehotes_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`);

--
-- Contraintes pour la table `contre_visite`
--
ALTER TABLE `contre_visite`
  ADD CONSTRAINT `contre_visite_ibfk_1` FOREIGN KEY (`ID_INSPECTEUR`) REFERENCES `inspecteur` (`ID_INSPECTEUR`),
  ADD CONSTRAINT `contre_visite_ibfk_2` FOREIGN KEY (`ID_VISITE`) REFERENCES `visite` (`ID_VISITE`);

--
-- Contraintes pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD CONSTRAINT `equipement_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `camping` (`ID_HEBERGEMENT`);

--
-- Contraintes pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD CONSTRAINT `gerer_ibfk_1` FOREIGN KEY (`ID_GERANT`) REFERENCES `gerant` (`ID_GERANT`),
  ADD CONSTRAINT `gerer_ibfk_2` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`);

--
-- Contraintes pour la table `hebergement`
--
ALTER TABLE `hebergement`
  ADD CONSTRAINT `hebergement_ibfk_1` FOREIGN KEY (`ID_SPECIALITE`) REFERENCES `specialite` (`ID_SPECIALITE`);

--
-- Contraintes pour la table `historiqueetoiles`
--
ALTER TABLE `historiqueetoiles`
  ADD CONSTRAINT `historiqueetoiles_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`),
  ADD CONSTRAINT `historiqueetoiles_ibfk_2` FOREIGN KEY (`NUM_ANNEE`) REFERENCES `annee` (`NUM_ANNEE`);

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`);

--
-- Contraintes pour la table `inspecteur`
--
ALTER TABLE `inspecteur`
  ADD CONSTRAINT `inspecteur_ibfk_1` FOREIGN KEY (`ID_SPECIALITE`) REFERENCES `specialite` (`ID_SPECIALITE`);

--
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hotel` (`ID_HEBERGEMENT`),
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`ID_CUISINE`) REFERENCES `typecuisine` (`ID_CUISINE`);

--
-- Contraintes pour la table `semaine`
--
ALTER TABLE `semaine`
  ADD CONSTRAINT `semaine_ibfk_1` FOREIGN KEY (`NUM_ANNEE`) REFERENCES `annee` (`NUM_ANNEE`);

--
-- Contraintes pour la table `se_trouver`
--
ALTER TABLE `se_trouver`
  ADD CONSTRAINT `se_trouver_ibfk_1` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`),
  ADD CONSTRAINT `se_trouver_ibfk_2` FOREIGN KEY (`NUM_DEPARTEMENT`) REFERENCES `departement` (`NUM_DEPARTEMENT`);

--
-- Contraintes pour la table `se_voit_attribuer`
--
ALTER TABLE `se_voit_attribuer`
  ADD CONSTRAINT `se_voit_attribuer_ibfk_1` FOREIGN KEY (`NUM_DEPARTEMENT`) REFERENCES `departement` (`NUM_DEPARTEMENT`),
  ADD CONSTRAINT `se_voit_attribuer_ibfk_2` FOREIGN KEY (`NUM_ANNEE`, `NUM_SEMAINE`) REFERENCES `semaine` (`NUM_ANNEE`, `NUM_SEMAINE`),
  ADD CONSTRAINT `se_voit_attribuer_ibfk_3` FOREIGN KEY (`ID_INSPECTEUR`) REFERENCES `inspecteur` (`ID_INSPECTEUR`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`ID_INSPECTEUR`) REFERENCES `inspecteur` (`ID_INSPECTEUR`),
  ADD CONSTRAINT `visite_ibfk_2` FOREIGN KEY (`ID_HEBERGEMENT`) REFERENCES `hebergement` (`ID_HEBERGEMENT`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
