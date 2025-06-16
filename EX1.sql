#Affichez toutes les informations des articles
SELECT * FROM Articles;

#Affichez uniquement les colonnes Designation et Quantite_stock
SELECT Designation, Quantite_stock FROM Articles;

#Affichez les articles dont le prix unitaire est supérieur à 100 et la quantité en stock inférieure à 50
SELECT * FROM Articles WHERE Prix_unitaire > 100 AND Quantite_stock < 50;

#Affichez les articles dont la quantité en stock est comprise entre 10 et 30
SELECT * FROM Articles WHERE Quantite_stock BETWEEN 10 AND 30;

#Affichez tous les articles dont la désignation commence par la lettre 'C'
SELECT * FROM Articles WHERE Designation LIKE 'C%';

#Affichez tous les articles dont la désignation contient le mot 'r'
SELECT * FROM Articles WHERE Designation LIKE '%r%';

#Mettez à jour la quantité en stock de l'article 'P0001' en la diminuant de 2
SELECT * FROM Articles;
UPDATE Articles
SET Quantite_stock = Quantite_stock - 2
WHERE Code_article = 'P0001';
SELECT * FROM Articles;

#Supprimez l'article dont le code est 'P0002'
DELETE FROM Articles WHERE Code_article = 'P0002';

#Calculez la somme des quantités en stock
SELECT sum(Quantite_stock) FROM Articles;

#Déterminez le prix moyen des articles
SELECT AVG(Prix_unitaire) AS Prix_moyen FROM Articles;

#Affichez le prix unitaire maximum et minimum des articles
SELECT MAX(Prix_unitaire) AS Prix_max, MIN(Prix_unitaire) AS Prix_min FROM Articles;

#Affichez les articles livrés entre le 1er juin 2020 et le 30 juin 2020
SELECT * FROM Livraisons
WHERE Date_livraison BETWEEN '2020-06-01' AND '2020-06-30';