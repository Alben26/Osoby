-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 02. led 2015, 16:39
-- Verze serveru: 5.6.16
-- Verze PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `postulka`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `mesto`
--

CREATE TABLE IF NOT EXISTS `mesto` (
  `psc` varchar(6) COLLATE utf8_czech_ci NOT NULL,
  `nazev` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`psc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `mesto`
--

INSERT INTO `mesto` (`psc`, `nazev`) VALUES
('155 21', 'Praha'),
('312 00', 'Plzeň'),
('350 02', 'Cheb'),
('381 01', 'Chvalšiny'),
('591 01', 'Žďár nad Sázavou'),
('669 02', 'Znojmo'),
('708 00', 'Ostrava'),
('747 21', 'Kravaře'),
('747 87', 'Svatoňovice'),
('751 24', 'Přerov');

-- --------------------------------------------------------

--
-- Struktura tabulky `oddil`
--

CREATE TABLE IF NOT EXISTS `oddil` (
  `id_oddilu` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(80) COLLATE utf8_czech_ci NOT NULL,
  `mesto` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id_oddilu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=11 ;

--
-- Vypisuji data pro tabulku `oddil`
--

INSERT INTO `oddil` (`id_oddilu`, `nazev`, `mesto`) VALUES
(1, 'IPSC', 'Praha'),
(2, 'AVZO', 'Přerov'),
(3, 'IPSC', 'Znojmo'),
(4, 'SSK', 'Žďár nad Sázavou'),
(5, 'SSK', 'Plzeň-střed'),
(6, 'AVZO', 'Chvalšiny'),
(7, 'SSK', 'Opava'),
(8, 'IPSC', 'Ostrava'),
(9, 'AVZO', 'Cheb'),
(10, 'AVZO', 'Budišov nad Budišovkou');

-- --------------------------------------------------------

--
-- Struktura tabulky `osoba`
--

CREATE TABLE IF NOT EXISTS `osoba` (
  `idosoba` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prijmeni` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `jmeno` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `rodne_cislo` varchar(11) COLLATE utf8_czech_ci NOT NULL,
  `pohlavi` enum('Muž','Žena') COLLATE utf8_czech_ci NOT NULL,
  `foto` tinyblob,
  `ulice` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `cislo` int(11) NOT NULL,
  `telefon` varchar(11) COLLATE utf8_czech_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8_czech_ci DEFAULT NULL,
  `mesto_psc` varchar(6) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`idosoba`),
  KEY `prijmeni` (`prijmeni`),
  KEY `jmeno` (`jmeno`),
  KEY `rodne_cislo` (`rodne_cislo`),
  KEY `pohlavi` (`pohlavi`),
  KEY `fk_osoba_mesto1_idx` (`mesto_psc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=23 ;

--
-- Vypisuji data pro tabulku `osoba`
--

INSERT INTO `osoba` (`idosoba`, `prijmeni`, `jmeno`, `rodne_cislo`, `pohlavi`, `foto`, `ulice`, `cislo`, `telefon`, `mail`, `mesto_psc`) VALUES
(1, 'Jeník', 'Igor', '990109/3752', 'Muž', NULL, 'Boční', 24, '775 323 481', 'i.jenik@gmail.com', '669 02'),
(2, 'Vladyka', 'Patrik', '000408/3244', 'Muž', NULL, 'Formanská', 438, '608 932 748', 'vladykap@seznam.cz', '312 00'),
(3, 'Škoda', 'Miloš', '861022/5239', 'Muž', NULL, 'Chmelová', 15, '777 335 226', NULL, '312 00'),
(4, 'Víchová', 'Radka', '956224/1458', 'Žena', NULL, 'Horská', 7, '553 658 347', NULL, '747 87'),
(5, 'Hloušková', 'Romana', '945207/4049', 'Žena', NULL, 'Dlouhá', 267, '662 341 482', 'romana.h@gmail.com', '669 02'),
(6, 'Velecký', 'Michal', '891202/1910', 'Muž', NULL, 'Hlohová', 73, '735 032 151', 'mivel@gmail.com', '591 01'),
(7, 'Střelec', 'Zdeněk', '920927/3524', 'Muž', NULL, 'Jasmínová', 137, '777 202 714', 'zdendastrelec@seznam.cz', '708 00'),
(8, 'Kubálková', 'Daniela', '936221/2574', 'Žena', NULL, 'K metru', 3, '606 748 624', 'dankub@gmail.com', '155 21'),
(9, 'Malec', 'Vojtěch', '020912/3497', 'Muž', NULL, 'Bezručova', 34, '737 684 287', NULL, '591 01'),
(10, 'Valter', 'Radek', '040612/9702', 'Muž', NULL, 'Domažlická', 16, '777 728 056', NULL, '350 02'),
(11, 'Zelený', 'Lukáš', '020405/0869', 'Muž', NULL, 'Sportovní', 240, '603 323 485', NULL, '751 24'),
(12, 'Brzáková', 'Lenka', '895720/2914', 'Žena', NULL, 'Panelová', 2, '735 185 648', 'brzakovalenka@gmail.com', '708 00'),
(17, 'Paul', 'Štěpán', '680913/5091', 'Muž', NULL, 'Sadová', 19, '603 524 743', 's.paul@gmail.com', '747 21'),
(18, 'Javorský', 'Ivo', '690410/0599', 'Muž', NULL, 'Luční', 27, '737 634 741', 'javorskyivo@seznam.cz', '381 01'),
(19, 'Voráček', 'Martin', '710610/6656', 'Muž', NULL, 'Valtická', 93, '602 855 527', 'martinv@gmail.com', '155 21');

-- --------------------------------------------------------

--
-- Struktura tabulky `rozhodci`
--

CREATE TABLE IF NOT EXISTS `rozhodci` (
  `licence` enum('A','B','C') COLLATE utf8_czech_ci NOT NULL,
  `osoba_idosoba` int(10) unsigned NOT NULL,
  PRIMARY KEY (`osoba_idosoba`),
  KEY `licence` (`licence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `rozhodci`
--

INSERT INTO `rozhodci` (`licence`, `osoba_idosoba`) VALUES
('A', 18),
('B', 19),
('C', 17);

-- --------------------------------------------------------

--
-- Struktura tabulky `strelec`
--

CREATE TABLE IF NOT EXISTS `strelec` (
  `ruka` enum('Pravá','Levá') COLLATE utf8_czech_ci NOT NULL,
  `uspechy` text COLLATE utf8_czech_ci,
  `osoba_idosoba` int(10) unsigned NOT NULL,
  `oddil_id_oddilu` int(11) NOT NULL,
  PRIMARY KEY (`osoba_idosoba`),
  KEY `ruka` (`ruka`),
  KEY `fk_strelec_oddil1_idx` (`oddil_id_oddilu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `strelec`
--

INSERT INTO `strelec` (`ruka`, `uspechy`, `osoba_idosoba`, `oddil_id_oddilu`) VALUES
('Pravá', NULL, 1, 3),
('Pravá', '1. místo MČR juniorů 2014', 2, 5),
('Pravá', '2. místo MČR 2009', 3, 5),
('Levá', NULL, 4, 10),
('Pravá', NULL, 5, 3),
('Levá', NULL, 6, 4),
('Pravá', NULL, 7, 8),
('Pravá', '1. místo Pohár Středočeského kraje 2012', 8, 1),
('Pravá', NULL, 9, 4),
('Pravá', NULL, 10, 9),
('Levá', NULL, 11, 2),
('Pravá', '2. místo Pohár primátora Ostravy, 1. místo MČR 2010, 3. místo MČR 2009', 12, 8);

-- --------------------------------------------------------

--
-- Struktura tabulky `vysledky`
--

CREATE TABLE IF NOT EXISTS `vysledky` (
  `pocet_bodu` int(11) NOT NULL,
  `strelec_osoba_idosoba` int(10) unsigned NOT NULL,
  `zavod_id_zavodu` int(11) NOT NULL,
  KEY `fk_vysledky_strelec1_idx` (`strelec_osoba_idosoba`),
  KEY `fk_vysledky_zavod1_idx` (`zavod_id_zavodu`),
  KEY `pocet_bodu` (`pocet_bodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `vysledky`
--

INSERT INTO `vysledky` (`pocet_bodu`, `strelec_osoba_idosoba`, `zavod_id_zavodu`) VALUES
(298, 1, 1),
(274, 2, 1),
(296, 9, 1),
(289, 10, 1),
(293, 11, 1),
(527, 3, 2),
(509, 6, 2),
(521, 7, 2),
(348, 4, 3),
(372, 5, 3),
(299, 8, 3),
(354, 12, 3);

-- --------------------------------------------------------

--
-- Struktura tabulky `zavod`
--

CREATE TABLE IF NOT EXISTS `zavod` (
  `id_zavodu` int(11) NOT NULL AUTO_INCREMENT,
  `vekova_kategorie` enum('10-15 let','15+') COLLATE utf8_czech_ci NOT NULL,
  `m_z` enum('Muži','Ženy') COLLATE utf8_czech_ci NOT NULL,
  `zbran` enum('vzduchová puška','malorážka','vzduchová pistole','sportovní pistole','rychlopalná pistole') COLLATE utf8_czech_ci NOT NULL,
  `pocet_ran` enum('20','30','40','60') COLLATE utf8_czech_ci NOT NULL,
  `rozhodci_osoba_idosoba` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_zavodu`),
  KEY `fk_zavod_rozhodci1_idx` (`rozhodci_osoba_idosoba`),
  KEY `kategorie` (`vekova_kategorie`),
  KEY `zbran` (`zbran`),
  KEY `m_z` (`m_z`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4 ;

--
-- Vypisuji data pro tabulku `zavod`
--

INSERT INTO `zavod` (`id_zavodu`, `vekova_kategorie`, `m_z`, `zbran`, `pocet_ran`, `rozhodci_osoba_idosoba`) VALUES
(1, '10-15 let', 'Muži', 'vzduchová puška', '30', 17),
(2, '15+', 'Muži', 'malorážka', '60', 18),
(3, '15+', 'Ženy', 'sportovní pistole', '40', 19);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `osoba`
--
ALTER TABLE `osoba`
  ADD CONSTRAINT `fk_osoba_mesto1` FOREIGN KEY (`mesto_psc`) REFERENCES `mesto` (`psc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `rozhodci`
--
ALTER TABLE `rozhodci`
  ADD CONSTRAINT `fk_rozhodci_osoba` FOREIGN KEY (`osoba_idosoba`) REFERENCES `osoba` (`idosoba`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `strelec`
--
ALTER TABLE `strelec`
  ADD CONSTRAINT `fk_strelec_oddil1` FOREIGN KEY (`oddil_id_oddilu`) REFERENCES `oddil` (`id_oddilu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_strelec_osoba1` FOREIGN KEY (`osoba_idosoba`) REFERENCES `osoba` (`idosoba`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `vysledky`
--
ALTER TABLE `vysledky`
  ADD CONSTRAINT `fk_vysledky_strelec1` FOREIGN KEY (`strelec_osoba_idosoba`) REFERENCES `strelec` (`osoba_idosoba`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vysledky_zavod1` FOREIGN KEY (`zavod_id_zavodu`) REFERENCES `zavod` (`id_zavodu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `zavod`
--
ALTER TABLE `zavod`
  ADD CONSTRAINT `fk_zavod_rozhodci1` FOREIGN KEY (`rozhodci_osoba_idosoba`) REFERENCES `rozhodci` (`osoba_idosoba`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
