CREATE DATABASE LocationVoitures;
USE LocationVoitures;

-- Clients
CREATE TABLE Clients (
    IdClient INT PRIMARY KEY,
    Nom VARCHAR(100),
    Prenom VARCHAR(100),
    Telephone VARCHAR(20),
    Email VARCHAR(100)
);

-- Véhicules
CREATE TABLE Vehicules (
    IdVehicule INT PRIMARY KEY,
    Marque VARCHAR(50),
    Modele VARCHAR(50),
    Type VARCHAR(30), -- voiture, moto, utilitaire
    Etat VARCHAR(30) -- disponible, en location, maintenance
);

-- Contrats
CREATE TABLE Contrats (
    IdContrat INT PRIMARY KEY,
    IdClient INT,
    DateDebut DATE,
    DateFin DATE,
    CoutTotal DECIMAL(10,2),
    Penalite DECIMAL(10,2),
    FOREIGN KEY (IdClient) REFERENCES Clients(IdClient)
);

-- Contrat_Vehicules (relation N-N)
CREATE TABLE Contrat_Vehicules (
    IdContrat INT,
    IdVehicule INT,
    PRIMARY KEY (IdContrat, IdVehicule),
    FOREIGN KEY (IdContrat) REFERENCES Contrats(IdContrat),
    FOREIGN KEY (IdVehicule) REFERENCES Vehicules(IdVehicule)
);

-- Paiements
CREATE TABLE Paiements (
    IdPaiement INT PRIMARY KEY,
    IdContrat INT,
    Montant DECIMAL(10,2),
    DatePaiement DATE,
    FOREIGN KEY (IdContrat) REFERENCES Contrats(IdContrat)
);

-- Entretiens
CREATE TABLE Entretiens (
    IdEntretien INT PRIMARY KEY,
    IdVehicule INT,
    Date DATE,
    Description TEXT,
    Cout DECIMAL(10,2),
    FOREIGN KEY (IdVehicule) REFERENCES Vehicules(IdVehicule)
);
