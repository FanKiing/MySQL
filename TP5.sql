CREATE DATABASE IF NOT EXISTS GestionProduits;
USE GestionProduits;
drop table Produits;
CREATE TABLE IF NOT EXISTS Produits (
	ID_Produit varchar(10) PRIMARY KEY NOT NULL,
    Nom_Produit VARCHAR(40),
    Categorie VARCHAR(40),
    Cout VARCHAR(20),
    Prix VARCHAR(50),
    Stock VARCHAR(50),
    Date_Ajout DATE
);

INSERT INTO Produits(ID_Produit,Nom_Produit,Categorie,Cout,Prix,Stock,Date_Ajout)
VALUES('P001','PC Portable PRO','Informatique',6500,7999,10,'2024-03-10'),
('P002','Clé USB 64GB','Accessoires',90,150,50,'2024-03-15'),
('P003','Souris Sans Fil','Accessoires',70,100,30,'2024-04-01'),
('P004','Imprimante Laser','Bureautique',1200,1500,15,'2024-04-10'),
('P005','Disque Dur 1To','Informatique',500,750,20,'2024-04-15'),
('P006','Casque Bluetooth','Audio',300,500,5,'2024-04-20'),
('P007','Ecran 24 pouces','Affichage',900,1300,12,'2024-05-01');

SELECT * FROM Produits;

SELECT * FROM Produits WHERE Categorie = 'Accessoires';

SELECT * FROM Produits WHERE Stock < 10;

SELECT * FROM Produits WHERE Prix > 1.30 * Cout;

SELECT * FROM Produits WHERE YEAR(Date_Ajout) = 2024 AND MONTH(Date_Ajout) = 4;

SELECT Nom_Produit ,
Prix - Cout as 'Benefice Unitaire',
(Prix - Cout) * Stock as 'Benefice Potenciel' 
FROM Produits ;

SELECT AVG(Prix) AS 'Prix Moyen', SUM(Stock) AS 'Stock total', SUM((Prix - Cout) * Stock) AS 'Benefice total potentiel' FROM Produits;

SELECT * FROM Produits WHERE Prix BETWEEN 8000 AND 1300; 

SELECT Nom_Produit, Prix, CASE 
	WHEN Prix >= 1500 THEN 'Haut de gamme'
    WHEN Prix >= 800 AND Prix < 1500 THEN 'Milieu de gamme'
    ELSE 'Entrée de gamme'
    END AS Etiquette
    FROM Produits;
    
SELECT CONCAT('Produit : ', Nom_Produit, ' - ', 'Seulment ', Prix, ' DHS !') AS Nom_Commercial FROM Produits;

SELECT * FROM Produits WHERE Nom_Produit LIKE '%Sans%';

SET LC_TIME_NAMES = "fr_FR";
SELECT CONCAT('La date d ajout: ', Date_Ajout, ' / ', 'Le nombre de jours depuis son ajout: ', DATEDIFF(CURDATE(), Date_Ajout), ' Le jour de la semaine: ', DAYNAME(Date_Ajout)) AS 'Les Dates Des Produits' FROM Produits;

SELECT * FROM Produits WHERE DATEDIFF(CURDATE(), Date_Ajout) >= 30;

SET SQL_SAFE_UPDATES = 0;
UPDATE Produits SET Prix = Prix + (Prix * 0.1) WHERE Categorie = 'Audio';

DELETE FROM Produits WHERE Stock = 0;

REPLACE 'Laptop' FROM Produits WHERE Nom_Produit = 'Portable';