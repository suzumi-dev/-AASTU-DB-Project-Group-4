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

STEP 8: USE quickbite_db;

-- RESTAURANTS DATA

INSERT INTO restaurants (name, cuisine_id, phone, email, street, city, sub_city, woreda, latitude, longitude, avg_prep_time_minutes, is_active, is_verified) VALUES
('Yod Abyssinia', 1, '+251111001001', 'info@yodabyssinia.com', 'Bole Road, Near Edna Mall', 'Addis Ababa', 'Bole', '03', 9.008500, 38.762100, 25, TRUE, TRUE),
('Kaldi\'s Coffee & Kitchen', 2, '+251111002002', 'info@kaldis.com', 'Bole Medhanialem Area', 'Addis Ababa', 'Bole', '05', 9.011200, 38.758900, 15, TRUE, TRUE),
('Tomoca Restaurant', 1, '+251111003003', 'contact@tomoca.com', 'Piazza, Churchill Road', 'Addis Ababa', 'Addis Ketema', '07', 9.038100, 38.751200, 30, TRUE, TRUE),
('Pizza Roma', 3, '+251111004004', 'hello@pizzaroma.com', 'CMC Area, Ring Road', 'Addis Ababa', 'Yeka', '06', 9.047800, 38.809500, 20, TRUE, FALSE);

-- MENU ITEMS DATA

INSERT INTO menu_items (restaurant_id, name, description, price, category, calories, is_vegetarian, is_vegan, is_spicy) VALUES
-- Yod Abyssinia menu
(1, 'Doro Wot', 'Traditional spicy chicken stew served with injera', 180.00, 'Main Course', 450, FALSE, FALSE, TRUE),
(1, 'Tibs Firfir', 'Sauteed beef with torn injera and spices', 160.00, 'Main Course', 520, FALSE, FALSE, TRUE),
(1, 'Shiro Wot', 'Spiced chickpea stew served with injera', 120.00, 'Main Course', 380, TRUE, TRUE, FALSE),
-- Kaldis menu
(2, 'Club Sandwich', 'Triple decker sandwich with chicken and vegetables', 135.00, 'Sandwich', 620, FALSE, FALSE, FALSE),
(2, 'Beef Burger', 'Grilled beef patty with cheese and fresh vegetables', 150.00, 'Burger', 750, FALSE, FALSE, FALSE),
-- Tomoca menu
(3, 'Kitfo', 'Ethiopian minced raw beef with spiced butter', 200.00, 'Main Course', 480, FALSE, FALSE, FALSE),
(3, 'Beyaynetu', 'Mixed vegetarian platter with various wots', 140.00, 'Platter', 420, TRUE, FALSE, FALSE),
(3, 'Tibs', 'Pan fried beef or lamb with vegetables', 175.00, 'Main Course', 510, FALSE, FALSE, FALSE),
-- Pizza Roma menu
(4, 'Margherita Pizza', 'Classic tomato sauce with mozzarella and basil', 220.00, 'Pizza', 680, TRUE, FALSE, FALSE),
(4, 'Pepperoni Pizza', 'Tomato sauce with mozzarella and pepperoni', 260.00, 'Pizza', 820, FALSE, FALSE, FALSE),
(4, 'Pasta Carbonara', 'Creamy pasta with bacon and parmesan', 195.00, 'Pasta', 740, FALSE, FALSE, FALSE),
(4, 'Veggie Pizza', 'Fresh seasonal vegetables on tomato sauce', 210.00, 'Pizza', 580, TRUE, TRUE, FALSE);

-- DRIVERS DATA
  
INSERT INTO drivers (first_name, last_name, email, phone, password_hash, vehicle_id, license_plate, current_latitude, current_longitude, is_available, rating_avg, total_deliveries) VALUES
('Mikael', 'Assefa', 'mikael.assefa@driver.com', '+251922001001', 'hashed_drv_1', 2, 'AA-3-45678', 9.007200, 38.761500, TRUE, 4.80, 145),
('Biruk', 'Wolde', 'biruk.wolde@driver.com', '+251922002002', 'hashed_drv_2', 2, 'AA-2-78901', 9.039100, 38.753400, TRUE, 4.60, 98),
('Henok', 'Tesfaye', 'henok.tesfaye@driver.com', '+251922003003', 'hashed_drv_3', 3, 'AA-1-23456', 9.048500, 38.811200, FALSE, 4.90, 210),
('Liya', 'Mengistu', 'liya.mengistu@driver.com', '+251922004004', 'hashed_drv_4', 1, 'AA-4-56789', 9.013100, 38.819800, TRUE, 4.70, 67); 
  
STEP 9:USE quickbite_db;
  
-- ORDERS DATA
  
INSERT INTO orders (customer_id, restaurant_id, driver_id, delivery_address_id, status, subtotal, delivery_fee, surge_multiplier, discount_amount, total_amount, special_instructions, estimated_delivery_time, actual_delivery_time, placed_at) VALUES
(1, 1, 1, 1, 'delivered', 340.00, 50.00, 1.00, 17.00, 373.00, 'Please include extra injera', '2024-01-15 12:45:00', '2024-01-15 12:50:00', '2024-01-15 12:00:00'),
(2, 2, 2, 2, 'delivered', 285.00, 45.00, 1.20, 0.00, 385.00, NULL, '2024-01-15 13:30:00', '2024-01-15 13:45:00', '2024-01-15 13:00:00'),
(3, 4, 3, 3, 'delivered', 455.00, 60.00, 1.00, 45.50, 469.50, 'Extra cheese on pizza please', '2024-01-16 19:45:00', '2024-01-16 19:40:00', '2024-01-16 19:00:00'),
(4, 3, 4, 4, 'delivered', 340.00, 50.00, 1.00, 0.00, 390.00, NULL, '2024-01-17 13:00:00', '2024-01-17 13:20:00', '2024-01-17 12:30:00'),
(5, 1, 1, 5, 'out_for_delivery', 160.00, 50.00, 1.50, 0.00, 290.00, 'Call when arriving', NULL, NULL, '2024-01-17 18:00:00'),
(1, 4, 2, 1, 'delivered', 415.00, 55.00, 1.00, 0.00, 470.00, NULL, '2024-01-18 20:30:00', '2024-01-18 20:35:00', '2024-01-18 20:00:00');
  -- ORDER ITEMS DATA
INSERT INTO order_items (order_id, item_id, quantity, unit_price, subtotal, special_request) VALUES
-- Order 1: Yod Abyssinia
(1, 1, 1, 180.00, 180.00, NULL),
(1, 2, 1, 160.00, 160.00, 'Less spicy please'),
-- Order 2: Kaldis
(2, 4, 1, 135.00, 135.00, NULL),
(2, 5, 1, 150.00, 150.00, 'No onions'),
-- Order 3: Pizza Roma
(3, 9, 1, 220.00, 220.00, NULL),
(3, 10, 1, 260.00, 260.00, 'Well done'),
-- Order 4: Tomoca
(4, 6, 1, 200.00, 200.00, NULL),
(4, 8, 1, 175.00, 175.00, NULL),
-- Order 5: Yod Abyssinia
(5, 2, 1, 160.00, 160.00, NULL),
-- Order 6: Pizza Roma
(6, 11, 1, 195.00, 195.00, NULL),
(6, 10, 1, 260.00, 260.00, NULL);
  -- PAYMENTS DATA
INSERT INTO payments (order_id, payment_method, payment_status, amount, transaction_id, paid_at) VALUES
(1, 'mobile_money', 'completed', 373.00, 'TXN-TELE-001-2024', '2024-01-15 12:05:00'),
(2, 'credit_card', 'completed', 385.00, 'TXN-CARD-002-2024', '2024-01-15 13:05:00'),
(3, 'cash', 'completed', 469.50, NULL, '2024-01-16 19:40:00'),
(4, 'mobile_money', 'completed', 390.00, 'TXN-TELE-004-2024', '2024-01-17 12:35:00'),
(5, 'wallet', 'pending', 290.00, NULL, NULL),
(6, 'credit_card', 'completed', 470.00, 'TXN-CARD-006-2024', '2024-01-18 20:05:00');
