USE quickbite_db;

CREATE TABLE cuisine_types (
    cuisine_id INT AUTO_INCREMENT PRIMARY KEY,
    cuisine_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

CREATE TABLE vehicle_types (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_name VARCHAR(50) NOT NULL UNIQUE,
    max_distance_km DECIMAL(5,2),
    description VARCHAR(255)
);

CREATE TABLE loyalty_tiers (
    tier_id INT AUTO_INCREMENT PRIMARY KEY,
    tier_name VARCHAR(30) NOT NULL UNIQUE,
    min_points INT NOT NULL,
    discount_percent DECIMAL(4,2) NOT NULL,
    description VARCHAR(255)
);

-- CUSTOMERS TABLE


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    loyalty_points INT DEFAULT 0,
    tier_id INT DEFAULT 1,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tier_id) REFERENCES loyalty_tiers(tier_id)
);

-- ADDRESSES TABLE


CREATE TABLE addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    label VARCHAR(30) DEFAULT 'Home',
    street VARCHAR(150) NOT NULL,
    city VARCHAR(50) NOT NULL DEFAULT 'Addis Ababa',
    sub_city VARCHAR(50),
    woreda VARCHAR(20),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- RESTAURANTS TABLE


CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine_id INT,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    street VARCHAR(150) NOT NULL,
    city VARCHAR(50) NOT NULL DEFAULT 'Addis Ababa',
    sub_city VARCHAR(50),
    woreda VARCHAR(20),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    opening_time TIME NOT NULL DEFAULT '08:00:00',
    closing_time TIME NOT NULL DEFAULT '22:00:00',
    avg_prep_time_minutes INT DEFAULT 20,
    is_active BOOLEAN DEFAULT TRUE,
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cuisine_id) REFERENCES cuisine_types(cuisine_id)
);


-- DRIVERS TABLE


CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    vehicle_id INT,
    license_plate VARCHAR(20) UNIQUE,
    profile_picture VARCHAR(255),
    current_latitude DECIMAL(9,6),
    current_longitude DECIMAL(9,6),
    is_available BOOLEAN DEFAULT TRUE,
    is_active BOOLEAN DEFAULT TRUE,
    rating_avg DECIMAL(3,2) DEFAULT 0.00,
    total_deliveries INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle_types(vehicle_id)
);

-- MENU ITEMS TABLE


CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    calories INT,
    is_vegetarian BOOLEAN DEFAULT FALSE,
    is_vegan BOOLEAN DEFAULT FALSE,
    is_spicy BOOLEAN DEFAULT FALSE,
    is_available BOOLEAN DEFAULT TRUE,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE
);


-- ORDERS TABLE


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    driver_id INT,
    delivery_address_id INT NOT NULL,
    status ENUM(
        'pending',
        'confirmed',
        'preparing',
        'ready_for_pickup',
        'out_for_delivery',
        'delivered',
        'cancelled'
    ) DEFAULT 'pending',
    subtotal DECIMAL(10,2) NOT NULL,
    delivery_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    surge_multiplier DECIMAL(3,2) DEFAULT 1.00,
    discount_amount DECIMAL(10,2) DEFAULT 0.00,
    total_amount DECIMAL(10,2) NOT NULL,
    special_instructions TEXT,
    estimated_delivery_time TIMESTAMP,
    actual_delivery_time TIMESTAMP,
    placed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (delivery_address_id) REFERENCES addresses(address_id)
);


-- ORDER ITEMS TABLE

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    special_request VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);


-- PAYMENTS TABLE


CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_method ENUM(
        'cash',
        'credit_card',
        'debit_card',
        'mobile_money',
        'wallet'
    ) NOT NULL,
    payment_status ENUM(
        'pending',
        'completed',
        'failed',
        'refunded'
    ) DEFAULT 'pending',
    amount DECIMAL(10,2) NOT NULL,
    transaction_id VARCHAR(100) UNIQUE,
    paid_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
); 


-- RATINGS TABLE


CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    driver_id INT,
    food_quality_score TINYINT CHECK (food_quality_score BETWEEN 1 AND 5),
    packaging_score TINYINT CHECK (packaging_score BETWEEN 1 AND 5),
    delivery_speed_score TINYINT CHECK (delivery_speed_score BETWEEN 1 AND 5),
    driver_behavior_score TINYINT CHECK (driver_behavior_score BETWEEN 1 AND 5),
    overall_score TINYINT CHECK (overall_score BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);


-- DELIVERY PREDICTIONS TABLE


CREATE TABLE delivery_predictions (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    base_prep_time INT NOT NULL,
    distance_km DECIMAL(6,2) NOT NULL,
    distance_factor INT NOT NULL,
    driver_load_factor INT NOT NULL,
    time_of_day_factor INT NOT NULL,
    predicted_minutes INT NOT NULL,
    actual_minutes INT,
    prediction_error INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);


-- DRIVER ASSIGNMENT LOG TABLE


CREATE TABLE assignment_log (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    driver_id INT NOT NULL,
    proximity_score DECIMAL(5,2),
    load_score DECIMAL(5,2),
    rating_score DECIMAL(5,2),
    vehicle_score DECIMAL(5,2),
    total_score DECIMAL(5,2),
    was_accepted BOOLEAN DEFAULT TRUE,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);


-- SURGE RULES TABLE


CREATE TABLE surge_rules (
    rule_id INT AUTO_INCREMENT PRIMARY KEY,
    rule_name VARCHAR(100) NOT NULL,
    start_time TIME,
    end_time TIME,
    min_active_orders INT DEFAULT 0,
    max_available_drivers INT DEFAULT 999,
    multiplier DECIMAL(3,2) NOT NULL DEFAULT 1.00,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- LOYALTY EVENTS TABLE


CREATE TABLE loyalty_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_id INT,
    event_type ENUM(
        'order_completed',
        'referral',
        'birthday_bonus',
        'tier_upgrade',
        'points_redeemed',
        'points_expired'
    ) NOT NULL,
    points_changed INT NOT NULL,
    points_balance_after INT NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- ANOMALY FLAGS TABLE

CREATE TABLE anomaly_flags (
    flag_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_id INT,
    driver_id INT,
    flag_type ENUM(
        'high_refund_rate',
        'multiple_payment_methods',
        'rapid_duplicate_order',
        'suspicious_location',
        'abnormal_order_value'
    ) NOT NULL,
    severity ENUM('low', 'medium', 'high') DEFAULT 'low',
    description TEXT,
    is_resolved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
); 
