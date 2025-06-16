CREATE DATABASE IF NOT EXISTS BibliothequeDB;
USE BibliothequeDB;

CREATE TABLE IF NOT EXISTS Livres (
	ID_Livre INT PRIMARY KEY,
    Titre VARCHAR(40),
    Auteur VARCHAR(20),
    Categorie VARCHAR(20),
    Prix INT ,
    Date_Achat DATE
);

INSERT INTO Livres(ID_Livre, Titre, Auteur, Categorie, Prix, Date_Achat)
VALUES	(1, 'Python pour les nuls', 'Michel Dupont', 'Informatique', 250.00, '2022-03-15'),
		(2, 'Les Misérables', 'Victor Hugo', 'Roman', 190.50, '2021-11-12'),
		(3, 'SQL Facile', 'Nadia El Fassi', 'Informatique', 320.00, '2023-01-20'),
		(4, 'L\'Étranger', 'Albert Camus', 'Roman', 180.00, '2020-06-25'),
		(5, 'Histoire du Maroc', 'Ali Bouziane', 'Histoire', 200.00, '2022-08-10'),
		(6, 'Le Petit Prince', 'Antoine de St Exupéry', 'Conte', 150.00, '2023-04-02'),
		(7, 'Introduction à l\'IA', 'Amina Chakir', 'Informatique', 400.00, '2024-02-11');
        

UPDATE Livres SET Prix = 350 WHERE Titre = 'SQL Facile';

DELETE FROM Livres WHERE Prix < 160;

SELECT * FROM Livres;

SELECT DISTINCT Categorie FROM Livres;

SELECT * FROM Livres WHERE Categorie IN ('Roman', 'Conte');

SELECT * FROM Livres WHERE Titre LIKE '%Python%';

SELECT Titre, Prix, ROUND(Prix * 1.07, 2) AS Prix_TTC FROM Livres;

SELECT AVG(Prix) AS Prix_Moyen FROM Livres;

SELECT UPPER(Titre) AS Titre_Majuscules FROM Livres;

SELECT LEFT(Auteur, 3) AS Debut_Auteur FROM Livres;

SELECT Date_Achat, DAYNAME(Date_Achat) AS Jour, DATEDIFF(CURDATE(), Date_Achat) AS Jours_Ecoulés FROM Livres;

SELECT Titre, DATE_ADD(Date_Achat, INTERVAL 1 YEAR) AS Achat_Plus_Un_An FROM Livres;

SELECT Categorie, COUNT(*) AS Nb_Livres FROM Livres GROUP BY Categorie;

SELECT Categorie FROM Livres GROUP BY Categorie HAVING COUNT(*) > 2;

SELECT CONCAT(Titre, ' par ', Auteur) AS Résumé FROM Livres;

SELECT * FROM Livres WHERE DAYNAME(Date_Achat) = 'Monday';

SELECT Auteur, AVG(Prix) AS Prix_Moyen FROM Livres GROUP BY Auteur;

SELECT * FROM Livres ORDER BY Prix DESC;

SELECT * FROM Livres ORDER BY Date_Achat DESC LIMIT 3;

SELECT Titre, IF(YEAR(Date_Achat) < 2022, 'Ancien', 'Récent') AS Etat FROM Livres;
