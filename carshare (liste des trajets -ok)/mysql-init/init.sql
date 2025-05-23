USE carshare;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar_url VARCHAR(255) DEFAULT 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trip (
    id INT PRIMARY KEY AUTO_INCREMENT,
    driver_id INT NOT NULL,                    
    start_town VARCHAR(100) NOT NULL,
    end_town VARCHAR(100) NOT NULL,
    start_address VARCHAR(255),
    end_address VARCHAR(255),
    start_date DATE NOT NULL,
    nb_places INT NOT NULL,
    price DECIMAL(6,2) NOT NULL,                                             
    description TEXT,                          
    vehicule VARCHAR(100),                            
    status TINYINT(1) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (driver_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS profil (
    id INT PRIMARY KEY,
    statut ENUM('conducteur', 'passager') NOT NULL,
    typeVehicule VARCHAR(100),
    nbPassagersMax INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id) REFERENCES users(id)
);



CREATE TABLE IF NOT EXISTS trajets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profilId INT NOT NULL,
    startTown VARCHAR(100) NOT NULL,
    endTown VARCHAR(100) NOT NULL,
    startAddress VARCHAR(255),
    endAddress VARCHAR(255),
    startDate DATE NOT NULL,
    price DECIMAL(6,2) NOT NULL,                                             
    description TEXT,    
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                      
    FOREIGN KEY (profilId) REFERENCES profil(id)
);


INSERT INTO users (username, email, password) VALUES
('alice', 'alice@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XjEnYWQ$jaE4X6av6OhLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q'),
('bob', 'bob@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XjEnYWQ$jaE4X6av6OhLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q');

INSERT INTO profil (id, statut, typeVehicule, nbPassagersMax) VALUES
(1, 'conducteur', 'Citroen C3', 3),
(2, 'passager', NULL, NULL);

INSERT INTO trajets (profilId, startTown, endTown, startAddress,endAddress,startDate,price,description) VALUES
(1, 'Antibes', 'Reims', 'Gare de Antibes','Gare de Reims','2025-06-21',60.00,'Bonjour, je pars rejoindre ma famille a Reims et mon chat sera du voyage haha!');


