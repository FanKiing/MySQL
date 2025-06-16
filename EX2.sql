-- TP2 - Exercice 1
CREATE DATABASE IF NOT EXISTS Bibliotheque;
USE Bibliotheque;

CREATE TABLE IF NOT EXISTS Auteurs (
    IdAuteur INT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Pays VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Livres (
    IdLivre INT PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    AuteurId INT,
    AnneePublication INT NOT NULL CHECK (AnneePublication > 1800),
    Quantite INT DEFAULT 1,
    FOREIGN KEY (AuteurId) REFERENCES Auteurs(IdAuteur)
);

CREATE TABLE IF NOT EXISTS Emprunts (
    IdEmprunt INT PRIMARY KEY,
    UtilisateurId INT,
    LivreId INT,
    DateEmprunt DATE NOT NULL,
    DateRetour DATE NOT NULL,
    FOREIGN KEY (UtilisateurId) REFERENCES Utilisateurs(IdUtilisateur) ON DELETE CASCADE,
    FOREIGN KEY (LivreId) REFERENCES Livres(IdLivre) ON DELETE CASCADE
);

-- TP2 - Exercice 3
ALTER TABLE Livres ADD Categorie VARCHAR(100);

ALTER TABLE Emprunts ADD Statut VARCHAR(50) DEFAULT 'En cours';

ALTER TABLE Auteurs DROP COLUMN Pays;

-- TP2 - Exercice 4
DELETE FROM Emprunts;

DROP TABLE Auteurs;
