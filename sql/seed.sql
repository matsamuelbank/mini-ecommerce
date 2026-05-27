-- MINI-PROJET E-COMMERCE — DONNÉES DE TEST

-- USERS

INSERT INTO users (first_name, last_name, email, phone)
VALUES
('Samuel', 'OKO', 'samuel.oko@example.com', '0600000001'),
('Alice', 'Martin', 'alice.martin@example.com', '0600000002'),
('Karim', 'Benali', 'karim.benali@example.com', '0600000003'),
('Julie', 'Bernard', 'julie.bernard@example.com', '0600000004'),
('Thomas', 'Petit', 'thomas.petit@example.com', '0600000005'),
('Nadia', 'Moreau', 'nadia.moreau@example.com', '0600000006'),
('Lucas', 'Durand', 'lucas.durand@example.com', '0600000007'),
('Emma', 'Leroy', 'emma.leroy@example.com', '0600000008'),
('Hugo', 'Robert', 'hugo.robert@example.com', '0600000009'),
('Ines', 'Garcia', 'ines.garcia@example.com', '0600000010');

-- PRODUCTS

INSERT INTO products (name, description, category, price, stock, metadata)
VALUES
('Clavier mécanique', 'Clavier mécanique AZERTY rétroéclairé', 'Informatique', 89.99, 25, '{"brand": "Logitech", "color": "black", "layout": "AZERTY"}'),
('Souris sans fil', 'Souris ergonomique sans fil', 'Informatique', 39.99, 40, '{"brand": "Logitech", "color": "black"}'),
('Écran 27 pouces', 'Écran Full HD 27 pouces', 'Informatique', 179.99, 15, '{"brand": "Samsung", "resolution": "Full HD"}'),
('Casque audio', 'Casque Bluetooth avec réduction de bruit', 'Audio', 129.99, 20, '{"brand": "Sony", "wireless": true}'),
('Micro USB', 'Microphone USB pour streaming', 'Audio', 79.99, 18, '{"brand": "Blue", "connection": "USB"}'),
('Bureau assis-debout', 'Bureau réglable en hauteur', 'Mobilier', 249.99, 10, '{"material": "wood", "adjustable": true}'),
('Chaise ergonomique', 'Chaise de bureau ergonomique', 'Mobilier', 199.99, 12, '{"color": "black", "ergonomic": true}'),
('Webcam HD', 'Webcam HD pour visioconférence', 'Informatique', 59.99, 30, '{"resolution": "1080p"}'),
('Hub USB-C', 'Hub USB-C multiports', 'Accessoires', 34.99, 50, '{"ports": 6, "connection": "USB-C"}'),
('Chargeur rapide', 'Chargeur USB-C 65W', 'Accessoires', 29.99, 60, '{"power": "65W"}'),
('Disque SSD 1To', 'SSD externe 1To', 'Stockage', 119.99, 22, '{"capacity": "1TB", "type": "SSD"}'),
('Clé USB 128Go', 'Clé USB rapide 128Go', 'Stockage', 19.99, 100, '{"capacity": "128GB"}'),
('Support ordinateur', 'Support réglable pour ordinateur portable', 'Accessoires', 24.99, 35, '{"adjustable": true}'),
('Lampe LED bureau', 'Lampe LED avec intensité réglable', 'Mobilier', 44.99, 28, '{"brightness": "adjustable"}'),
('Tapis de souris XXL', 'Grand tapis de souris antidérapant', 'Accessoires', 14.99, 80, '{"size": "XXL"}');

-- ORDERS

INSERT INTO orders (user_id, status, ordered_at)
VALUES
(1, 'paid', '2026-05-01 10:15:00'),
(1, 'shipped', '2026-05-03 14:30:00'),
(2, 'paid', '2026-05-04 09:20:00'),
(3, 'pending', '2026-05-05 16:45:00'),
(4, 'cancelled', '2026-05-06 11:10:00'),
(5, 'paid', '2026-05-07 13:25:00'),
(6, 'shipped', '2026-05-08 17:50:00'),
(7, 'paid', '2026-05-09 08:40:00'),
(8, 'pending', '2026-05-10 19:00:00'),
(9, 'paid', '2026-05-11 12:15:00'),
(2, 'shipped', '2026-05-12 15:30:00'),
(3, 'paid', '2026-05-13 10:05:00'),
(4, 'paid', '2026-05-14 18:20:00'),
(5, 'pending', '2026-05-15 09:55:00'),
(6, 'paid', '2026-05-16 14:10:00'),
(7, 'cancelled', '2026-05-17 16:30:00'),
(8, 'shipped', '2026-05-18 11:45:00'),
(9, 'paid', '2026-05-19 13:35:00'),
(10, 'pending', '2026-05-20 20:15:00'),
(10, 'paid', '2026-05-21 08:25:00');

-- ORDER_ITEMS

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 89.99),
(1, 2, 1, 39.99),
(2, 3, 1, 179.99),
(2, 9, 2, 34.99),
(3, 4, 1, 129.99),
(3, 5, 1, 79.99),
(4, 6, 1, 249.99),
(4, 7, 1, 199.99),
(5, 8, 1, 59.99),
(5, 10, 2, 29.99),
(6, 11, 1, 119.99),
(6, 12, 3, 19.99),
(7, 13, 2, 24.99),
(7, 14, 1, 44.99),
(8, 15, 2, 14.99),
(8, 1, 1, 89.99),
(9, 2, 2, 39.99),
(9, 3, 1, 179.99),
(10, 4, 1, 129.99),
(10, 9, 1, 34.99),
(11, 6, 1, 249.99),
(11, 10, 1, 29.99),
(12, 7, 1, 199.99),
(12, 8, 1, 59.99),
(13, 11, 2, 119.99),
(13, 12, 2, 19.99),
(14, 13, 1, 24.99),
(14, 15, 3, 14.99),
(15, 1, 1, 89.99),
(15, 5, 1, 79.99),
(16, 2, 1, 39.99),
(16, 14, 1, 44.99),
(17, 3, 1, 179.99),
(17, 4, 1, 129.99),
(18, 6, 1, 249.99),
(18, 9, 2, 34.99),
(19, 10, 1, 29.99),
(19, 11, 1, 119.99),
(20, 12, 4, 19.99),
(20, 15, 2, 14.99);