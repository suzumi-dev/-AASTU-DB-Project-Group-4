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
