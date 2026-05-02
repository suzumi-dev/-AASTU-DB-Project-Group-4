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
-- ============================================
-- RESTAURANTS TABLE
-- ============================================

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

-- ============================================
-- DRIVERS TABLE
-- ============================================

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
