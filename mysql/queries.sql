USE quickbite_db;

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

USE quickbite_db;

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
-- RATINGS DATA

INSERT INTO ratings (order_id, customer_id, restaurant_id, driver_id, food_quality_score, packaging_score, delivery_speed_score, driver_behavior_score, overall_score, review_text) VALUES
(1, 1, 1, 1, 5, 4, 5, 5, 5, 'Excellent doro wot! Driver was very professional and fast.'),
(2, 2, 2, 2, 4, 4, 3, 4, 4, 'Good food but delivery was a bit late. Sandwich was still fresh though.'),
(3, 3, 4, 3, 5, 5, 5, 5, 5, 'Perfect pizza and super fast delivery. Will definitely order again!'),
(4, 4, 3, 4, 4, 3, 4, 5, 4, 'Kitfo was good but packaging could be better. Driver was very polite.');

-- DELIVERY PREDICTIONS DATA

INSERT INTO delivery_predictions (order_id, base_prep_time, distance_km, distance_factor, driver_load_factor, time_of_day_factor, predicted_minutes, actual_minutes, prediction_error) VALUES
(1, 25, 2.30, 10, 5, 5, 45, 50, 5),
(2, 15, 3.10, 12, 8, 7, 42, 45, 3),
(3, 20, 4.50, 18, 3, 10, 51, 40, -11),
(4, 30, 5.20, 20, 5, 5, 60, 50, -10),
(5, 25, 3.80, 15, 5, 15, 60, NULL, NULL),
(6, 20, 4.10, 16, 8, 10, 54, 35, -19);

-- ASSIGNMENT LOG DATA

INSERT INTO assignment_log (order_id, driver_id, proximity_score, load_score, rating_score, vehicle_score, total_score, was_accepted) VALUES
(1, 1, 9.50, 8.00, 9.60, 8.00, 35.10, TRUE),
(2, 2, 8.00, 7.50, 9.20, 8.00, 32.70, TRUE),
(3, 3, 7.50, 9.00, 9.80, 10.00, 36.30, TRUE),
(4, 4, 8.50, 8.50, 9.40, 6.00, 32.40, TRUE),
(5, 1, 9.00, 7.00, 9.60, 8.00, 33.60, TRUE),
(6, 2, 8.00, 8.00, 9.20, 8.00, 33.20, TRUE);

-- SURGE RULES DATA

INSERT INTO surge_rules (rule_name, start_time, end_time, min_active_orders, max_available_drivers, multiplier, is_active) VALUES
('Lunch Rush', '11:30:00', '13:30:00', 10, 3, 1.20, TRUE),
('Dinner Peak', '18:00:00', '21:00:00', 15, 2, 1.50, TRUE),
('Late Night', '22:00:00', '23:59:00', 5, 2, 1.30, TRUE);
-- LOYALTY EVENTS DATA

INSERT INTO loyalty_events (customer_id, order_id, event_type, points_changed, points_balance_after, description) VALUES
(1, 1, 'order_completed', 37, 750, 'Earned points for order #1 — 10% of order value'),
(2, 2, 'order_completed', 39, 200, 'Earned points for order #2 — 10% of order value'),
(3, 3, 'order_completed', 47, 1600, 'Earned points for order #3 — 10% of order value'),
(3, NULL, 'tier_upgrade', 0, 1600, 'Upgraded to Gold tier after reaching 1500 points'),
(4, 4, 'order_completed', 39, 50, 'Earned points for order #4 — 10% of order value');

-- ANOMALY FLAGS DATA
INSERT INTO anomaly_flags (customer_id, order_id, driver_id, flag_type, severity, description, is_resolved) VALUES
(2, 2, NULL, 'multiple_payment_methods', 'low', 'Customer used 3 different payment methods in 7 days — monitoring for fraud', FALSE),
(NULL, 5, NULL, 'abnormal_order_value', 'medium', 'Order total unusually low compared to customer average — possible coupon abuse', FALSE),
(NULL, NULL, 3, 'suspicious_location', 'high', 'Driver location ping shows impossible travel speed between two checkpoints', FALSE);   


-- ============================================
-- VIEW 1: ORDER SUMMARY VIEW
-- shows every order with customer name,
-- restaurant name, driver name and status
-- ============================================

CREATE VIEW vw_order_summary AS
SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.phone AS customer_phone,
    r.name AS restaurant_name,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    o.status,
    o.subtotal,
    o.delivery_fee,
    o.surge_multiplier,
    o.discount_amount,
    o.total_amount,
    o.placed_at,
    o.estimated_delivery_time,
    o.actual_delivery_time
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
LEFT JOIN drivers d ON o.driver_id = d.driver_id;

-- ============================================
-- VIEW 2: DELIVERY PREDICTION ACCURACY VIEW
-- compares predicted vs actual delivery time
-- and calculates accuracy percentage
-- ============================================

CREATE VIEW vw_prediction_accuracy AS
SELECT
    dp.prediction_id,
    o.order_id,
    r.name AS restaurant_name,
    dp.predicted_minutes,
    dp.actual_minutes,
    dp.prediction_error,
    CASE
        WHEN dp.prediction_error IS NULL THEN 'In Progress'
        WHEN ABS(dp.prediction_error) <= 5 THEN 'Excellent'
        WHEN ABS(dp.prediction_error) <= 10 THEN 'Good'
        WHEN ABS(dp.prediction_error) <= 20 THEN 'Fair'
        ELSE 'Poor'
    END AS accuracy_rating,
    CASE
        WHEN dp.actual_minutes IS NOT NULL
        THEN ROUND(100 - (ABS(dp.prediction_error) / dp.predicted_minutes * 100), 2)
        ELSE NULL
    END AS accuracy_percent
FROM delivery_predictions dp
JOIN orders o ON dp.order_id = o.order_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- ============================================
-- VIEW 3: RESTAURANT PERFORMANCE VIEW
-- shows each restaurant's average scores,
-- total orders and average prep accuracy
-- ============================================

CREATE VIEW vw_restaurant_performance AS
SELECT
    r.restaurant_id,
    r.name AS restaurant_name,
    ct.cuisine_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(AVG(rat.food_quality_score), 2) AS avg_food_quality,
    ROUND(AVG(rat.packaging_score), 2) AS avg_packaging,
    ROUND(AVG(rat.overall_score), 2) AS avg_overall_rating,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    SUM(o.total_amount) AS total_revenue
FROM restaurants r
LEFT JOIN cuisine_types ct ON r.cuisine_id = ct.cuisine_id
LEFT JOIN orders o ON r.restaurant_id = o.restaurant_id
LEFT JOIN ratings rat ON o.order_id = rat.order_id
GROUP BY r.restaurant_id, r.name, ct.cuisine_name;

-- ============================================
-- VIEW 4: DRIVER PERFORMANCE VIEW
-- shows each driver's delivery stats,
-- average scores and assignment breakdown
-- ============================================

CREATE VIEW vw_driver_performance AS
SELECT
    d.driver_id,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    vt.vehicle_name,
    d.total_deliveries,
    d.rating_avg,
    COUNT(DISTINCT o.order_id) AS orders_in_system,
    ROUND(AVG(rat.delivery_speed_score), 2) AS avg_speed_score,
    ROUND(AVG(rat.driver_behavior_score), 2) AS avg_behavior_score,
    ROUND(AVG(al.total_score), 2) AS avg_assignment_score
FROM drivers d
LEFT JOIN vehicle_types vt ON d.vehicle_id = vt.vehicle_id
LEFT JOIN orders o ON d.driver_id = o.driver_id
LEFT JOIN ratings rat ON o.order_id = rat.order_id
LEFT JOIN assignment_log al ON d.driver_id = al.driver_id
GROUP BY d.driver_id, d.first_name, d.last_name, vt.vehicle_name,
         d.total_deliveries, d.rating_avg;                                  



