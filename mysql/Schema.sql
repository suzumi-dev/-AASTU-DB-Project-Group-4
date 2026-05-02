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
-- ============================================
-- CUSTOMERS TABLE
-- ============================================

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

-- ============================================
-- ADDRESSES TABLE
-- ============================================

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
