USE carshare;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar_url VARCHAR(255) DEFAULT 'https://placehold.co/100',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trip (
    id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT NOT NULL,                    
    start_town VARCHAR(100) NOT NULL,
    end_town VARCHAR(100) NOT NULL,
    start_address VARCHAR(255),
    end_address VARCHAR(255),
    start_date DATETIME NOT NULL,
    nb_places INT NOT NULL,
    price DECIMAL(6,2) NOT NULL,                                             
    description TEXT,                          
    vehicule VARCHAR(100),                            
    status TINYINT(1) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (driver_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO users (username, email, password) VALUES
('alice', 'alice@example.com', '12345'),
('bob', 'bob@example.com', '12345');