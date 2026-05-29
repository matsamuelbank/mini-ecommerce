-- 1. Afficher tous les utilisateurs
SELECT * FROM users;

-- 2. Afficher tous les produits
SELECT * FROM products;

-- 3. Afficher tous les commandes a
SELECT
    users.first_name,
    users.last_name,
    users.email,
    users.phone,
    orders.id AS idenfition_de_la_commande,
    orders.status AS statut_de_la_commande
FROM orders
LEFT JOIN users
    ON orders.user_id = users.id;


-- Afficher le détail complet de chaque commande : utilisateur, date, statut, produits, quantités et prix unitaires.
SELECT
    users.first_name,
    users.last_name,
    users.email,
    users.phone,
    orders.id AS identifiant_de_la_commande,
    orders.status AS statut_de_la_commande,
    products.name AS nom_du_produit,
    order_items.quantity AS quantite,
    order_items.unit_price
FROM orders
LEFT JOIN users
    ON orders.user_id = users.id
LEFT JOIN order_items
    ON order_items.order_id = orders.id
LEFT JOIN products
    ON order_items.product_id = products.id;

-- Calculer le montant total de chaque commande en additionnant les sous-totaux de chaque ligne de commande.
SELECT
    order_items.order_id AS idenfition_de_la_commande,
    SUM(order_items.quantity * order_items.unit_price) AS montant_total
FROM order_items
GROUP BY order_items.order_id
ORDER BY montant_total DESC;

-- Calculer le total dépensé par chaque utilisateur en additionnant toutes ses commandes.
SELECT
    users.id,
    users.first_name,
    users.last_name,
    SUM(order_items.quantity * order_items.unit_price) AS total_depense
FROM users
LEFT JOIN orders
    ON orders.user_id = users.id
LEFT JOIN order_items
    ON order_items.order_id = orders.id
GROUP BY users.id, users.first_name, users.last_name
ORDER BY total_depense DESC;

-- Trouver les 5 produits les plus vendus en se basant sur la quantité totale vendue.
SELECT
    products.name,
    SUM(order_items.quantity) AS nombre_de_ventes
FROM products
LEFT JOIN order_items
    ON order_items.product_id = products.id
GROUP BY products.id, products.name
ORDER BY nombre_de_ventes DESC
LIMIT 5;

-- Trouver les produits jamais commandés en identifiant ceux qui n'apparaissent dans aucune ligne de commande.
SELECT *
FROM products p
WHERE NOT EXISTS(
	SELECT 1
	FROM order_items o_u
	WHERE p.id = o_u.product_id
);
-- Trouver les utilisateurs qui n'ont jamais passé de commande.
SELECT *
FROM users u
WHERE NOT EXISTS(
	SELECT 1
	FROM orders o
	WHERE u.id = o.user_id
);
-- Calculer le chiffre d'affaires par jour à partir des montants des commandes.
SELECT
    DATE(orders.created_at) AS jour,
    SUM(order_items.quantity * order_items.unit_price) AS chiffre_affaires
FROM orders
JOIN order_items
    ON order_items.order_id = orders.id
GROUP BY DATE(orders.created_at)
ORDER BY jour;

-- Calculer le chiffre d'affaires par catégorie de produit en regroupant les ventes par catégorie.
SELECT
  	products.category as categorie,
    SUM(order_items.quantity * order_items.unit_price) AS chiffre_affaires
FROM products
JOIN order_items
    ON order_items.product_id = products.id
GROUP BY products.category
ORDER BY chiffre_affaires DESC;
-- Calculer le prix moyen des produits par catégorie.
SELECT
  	products.category as categorie,
    ROUND(AVG(order_items.unit_price),2) AS prix_moyen
FROM products
JOIN order_items
    ON order_items.product_id = products.id
GROUP BY products.category;
-- Trouver les clients ayant dépensé plus de 100 euros au total.
SELECT
  	users.first_name,
	users.last_name,
	SUM(order_items.unit_price* order_items.quantity) AS total_depense
FROM users
LEFT JOIN orders
	ON users.id = orders.user_id
LEFT JOIN order_items
    ON order_items.order_id = orders.id
GROUP BY users.first_name,users.last_name 
HAVING(SUM(order_items.unit_price* order_items.quantity)  > 100); 
-- Trouver les commandes dont le montant total dépasse 200 euros.
SELECT
  	orders.id as identifiant_commande,
	SUM(order_items.unit_price* order_items.quantity) AS total_depense
FROM orders
LEFT JOIN order_items
    ON order_items.order_id = orders.id
GROUP BY orders.id
HAVING(SUM(order_items.unit_price* order_items.quantity)  > 200); 
-- Compter le nombre de commandes par statut.
SELECT
    orders.status AS statut_commande,
    COUNT(orders.id) AS nb_commandes
FROM orders
GROUP BY orders.status
ORDER BY nb_commandes DESC;

-- Compter le nombre de commandes par utilisateur.
SELECT
    users.first_name,
    users.last_name,
    COUNT(orders.id) AS nb_commandes
FROM users
LEFT JOIN orders
    ON users.id = orders.user_id
GROUP BY users.first_name, users.last_name
ORDER BY nb_commandes DESC;

Voici les requêtes SQL correspondant exactement à ta liste. Tu peux les ajouter à la suite dans `queries.sql`.

-- Trouver le panier moyen

SELECT 
    AVG(order_total) AS average_order_amount
FROM (
    SELECT 
        o.id AS order_id,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    GROUP BY o.id
) AS order_totals;


-- Trouver le produit le plus cher

SELECT 
    id,
    name,
    category,
    price
FROM products
ORDER BY price DESC
LIMIT 1;


-- Trouver les produits dont le stock est inférieur à 20
SELECT 
    id,
    name,
    category,
    stock
FROM products
WHERE stock < 20
ORDER BY stock ASC;


-- Utiliser une CTE pour calculer le total dépensé par client
WITH customer_spending AS (
    SELECT 
        u.id AS user_id,
        u.first_name,
        u.last_name,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM users u
    JOIN orders o ON u.id = o.user_id
    JOIN order_items oi ON o.id = oi.order_id
    GROUP BY u.id, u.first_name, u.last_name
)
SELECT 
    user_id,
    first_name,
    last_name,
    total_spent
FROM customer_spending
ORDER BY total_spent DESC;


-- Utiliser une CTE pour calculer le montant total de chaque commande
WITH order_totals AS (
    SELECT 
        o.id AS order_id,
        o.user_id,
        o.status,
        o.ordered_at,
        SUM(oi.quantity * oi.unit_price) AS total_amount
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    GROUP BY o.id, o.user_id, o.status, o.ordered_at
)
SELECT 
    order_id,
    user_id,
    status,
    ordered_at,
    total_amount
FROM order_totals
ORDER BY total_amount DESC;


-- Utiliser une subquery pour trouver les produits plus chers que le prix moyen
SELECT 
    id,
    name,
    category,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;


-- Utiliser une subquery pour trouver les clients ayant passé au moins une commande

SELECT 
    id,
    first_name,
    last_name,
    email
FROM users
WHERE id IN (
    SELECT DISTINCT user_id
    FROM orders
)
ORDER BY id;



-- Utiliser NOT EXISTS pour trouver les utilisateurs sans commande
SELECT 
    u.id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.user_id = u.id
)
ORDER BY u.id;



-- Lire une valeur dans la colonne JSONB metadata des produits
SELECT 
    id,
    name,
    category,
    metadata->>'brand' AS brand
FROM products
WHERE metadata ? 'brand'
ORDER BY name;


