STEP 7:USE quickbite_db;

-- REFERENCE TABLES DATA

INSERT INTO cuisine_types (cuisine_name, description) VALUES
('Ethiopian', 'Traditional Ethiopian dishes including injera, tibs and stews'),
('Fast Food', 'Burgers, fries, sandwiches and quick meals'),
('Italian', 'Pasta, pizza and classic Italian dishes');

INSERT INTO vehicle_types (vehicle_name, max_distance_km, description) VALUES
('Bicycle', 5.00, 'Eco-friendly for short distances within 5km'),
('Motorcycle', 20.00, 'Fast and efficient for medium distances'),
('Car', 50.00, 'Suitable for long distances and large orders');

INSERT INTO loyalty_tiers (tier_name, min_points, discount_percent, description) VALUES
('Bronze', 0, 0.00, 'Starting tier for all new customers'),
('Silver', 500, 5.00, 'Unlocked after earning 500 points'),
('Gold', 1500, 10.00, 'Premium tier with 10% discount on all orders');

-- CUSTOMERS DATA

INSERT INTO customers (first_name, last_name, email, phone, password_hash, loyalty_points, tier_id) VALUES
('Abebe', 'Kebede', 'abebe.kebede@email.com', '+251911001001', 'hashed_pw_1', 750, 2),
('Tigist', 'Haile', 'tigist.haile@email.com', '+251911002002', 'hashed_pw_2', 200, 1),
('Dawit', 'Tadesse', 'dawit.tadesse@email.com', '+251911003003', 'hashed_pw_3', 1600, 3),
('Selam', 'Bekele', 'selam.bekele@email.com', '+251911004004', 'hashed_pw_4', 50, 1),
('Yonas', 'Girma', 'yonas.girma@email.com', '+251911005005', 'hashed_pw_5', 900, 2);

-- ADDRESSES DATA

INSERT INTO addresses (customer_id, label, street, city, sub_city, woreda, latitude, longitude, is_default) VALUES
(1, 'Home', 'Bole Road, House 42', 'Addis Ababa', 'Bole', '03', 9.005401, 38.763611, TRUE),
(2, 'Home', 'Piazza Area, Building 7', 'Addis Ababa', 'Addis Ketema', '07', 9.037600, 38.752800, TRUE),
(3, 'Work', 'CMC Road, Office Block B', 'Addis Ababa', 'Yeka', '06', 9.046300, 38.810900, TRUE),
(4, 'Home', 'Gerji, Condominium 12C', 'Addis Ababa', 'Bole', '11', 9.012500, 38.820300, TRUE),
(5, 'Home', 'Megenagna, Behind Total', 'Addis Ababa', 'Yeka', '09', 9.025700, 38.789400, TRUE);
