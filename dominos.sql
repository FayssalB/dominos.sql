--Création de la base dominos
CREATE DATABASE dominos;

--Selection de la base pour que SQL sache dans quelle base il doit créer la table
USE dominos; 

--Création de la table pizzas
CREATE TABLE pizzas (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    taille TINYINT,
    price DECIMAL(4,2)
);

--Exemple de la table personne du spport SQL pour la creation d'une clé étrangere
-- CREATE TABLE personne(
--     id TINYINT PRIMARY KEY AUTO_INCREMENT,
--     nom VARCHAR(30) NOT NULL,
--     prenom VARCHAR(30) NOT NULL,
--     id_voiture TINYINT,
--     --Creation d'une clé etrangere sur le champ id-voiture qu'on relie à la table voiture sur son champ id
--     FOREIGN KEY (id_voiture) REFERENCES voiture(id)

-- )

CREATE TABLE pizzas_ingredients (
    pizza_id TINYINT,
    ingredient_id TINYINT,
    PRIMARY KEY (pizza_id, ingredient_id) AUTO_INCREMENT,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id)
);

CREATE TABLE ingredients (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(40),
);

-- Insertion de données dans la table pizzas
INSERT INTO pizzas 
(nom, taille, price)
VALUES
('4fromages',2, 8.90),
('Margherita',1, 4.90),
('Reine',3, 10.90);


-- Insertion de données dans la table ingrédients
INSERT INTO ingredients 
(nom)
VALUES
('mozzarella'),
('tomate'),
('jambon'),
('champignon'),
('gorgonzola');

--Insertion de données dans la table pizzas_ingredients
INSERT INTO pizzas_ingredients
(pizza_id,ingredient_id)
VALUES
(1,1),
(1,5),
(2,1),
(2,2),
(3,2),
(3,3),
(3,4);

--ORDER BY default value = croissant(ASC) ///DESC
SELECT nom, price FROM pizzas WHERE price <= 9

-- LIKE "poivrons%" --> commence par poivrons
-- LIKE "%poivrons" --> se termine par poivrons
-- LIKE "%pois%" --> contient


SELECT * FROM pizzas WHERE price <= 10 AND taille = 2


-- Uptade table
-- set colonne = 'nouvelle valeur'
-- where condition

UPDATE pizzas
SET price += price / 10