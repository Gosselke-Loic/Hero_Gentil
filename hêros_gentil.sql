CREATE TABLE Heros (
    `ID` tinyint(1) NOT NULL,
    `Nom` varchar(50) NOT NULL,
    `PV` tinyint(2) NOT NULL,
    `Bonus` tinyint(2) NOT NULL,
    `Defense` tinyint(2) NOT NULL,
    `ArmeEnMain` tinyint(2) DEFAULT NULL,
    `Statut` varchar(100) NOT NULL,
    `Immunite` varchar(20) NOT NULL
);

CREATE TABLE Armes (
    `ID` tinyint(1) NOT NULL,
    `HeroID` tinyint(1) NOT NULL,
    `Nom` varchar(50) NOT NULL,
    `Type` varchar(20) NOT NULL,
    `Degat` tinyint(2) NOT NULL
);

CREATE TABLE Competences (
    `ID` tinyint(1) NOT NULL,
    `Type` ENUM('Statut', 'PV', 'Defense', 'Bonus', 'ArmeEnMain', 'Immunite'),
    `Effet` varchar(50)
);

INSERT INTO `Heros` (`ID`, `Nom`, `PV`, `Bonus`, `Defense`, `ArmeEnMain`, `Statut`, `Immunite`) 
	VALUES
	(1, 'Comar', 40, 2, 15, NULL, 'joyeux', 'mousse'),
	(2, 'Kirderf', 35, 14, 5, NULL, 'combatif', 'aucun'),
	(3, 'Luijen', 45, 5, 8, NULL, 'Flegme', 'destabilisant');

INSERT INTO `Competences` (`ID`, `Type`, `Effet`) 
	VALUES
	(1, 'PV', 'Confusion par coup critique de php'),
	(2, 'Defense', 'Defense reduite par coup amie'),
	(3, 'PV', 'A trouver un caramel par terre');
	
INSERT INTO `Armes` (`ID`, `HeroID`, `Nom`, `Type`, `Degat`) 
	VALUES
	(1, 0, 'batte', 'mousse', 0),
	(2, 0, 'Vanne de Liujen', 'destabilisante', 10),
	(3, 0, 'Microsoft', 'effrayant', 20),
	(4, 0, 'feulle', 'tranchant', 5),
	(5, 0, 'caillou', 'contondant', 5),
	(6, 0, 'ciseau', 'perçant', 5);
	
UPDATE `Armes`
SET `Nom` = `feuille`
WHERE ID = 4;

CREATE TABLE `HeroeCompetences` (
  `CompetencesID` tinyint(1) NOT NULL,
  `HeroeID` tinyint(1) NOT NULL
);

ALTER TABLE `Armes`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `Competences`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `Heros`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `HeroeCompetences`
    ADD FOREIGN KEY (`HeroeID`) REFERENCES `Heros` (`ID`);

ALTER TABLE `HeroeCompetences`
    ADD FOREIGN KEY (`CompetencesID`) REFERENCES `Competences` (`ID`);

ALTER TABLE `Armes`
    ADD FOREIGN KEY (`HeroID`) REFERENCES `Heros` (`ID`);
