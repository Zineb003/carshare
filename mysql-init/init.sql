USE carshare;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar_url VARCHAR(255) DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trips (
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
    vehicule VARCHAR(100) NOT NULL,                            
    trip_type TINYINT(1) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (driver_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trip_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (trip_id) REFERENCES trips(id) ON DELETE CASCADE
);

INSERT INTO users (username, email, password) VALUES
('alice', 'alice@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XjEnYWQ$jaE4X6av6OhLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q'),
('bob', 'bob@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XjEnYWQ$jaE4X6av6OhLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q');

INSERT INTO `trips` (`id`, `driver_id`, `start_town`, `end_town`, `start_address`, `end_address`, `start_date`, `nb_places`, `price`, `description`, `vehicule`, `trip_type`, `created_at`) VALUES
(1, 2, 'Paris', 'Nantes', '75 Rue de Julien', '10 Rue de la Hess', '2025-06-18 10:20:00', 5, 10.30, 'La toyota de tes grands morts.', 'Toyota Yaris', 1, '2025-06-18 08:53:33'),
(2, 2, 'Rouen', 'Tours', '', '', '2025-06-11 10:55:00', 4, 20.00, '', 'Lamborghini', 0, '2025-06-18 08:58:19');