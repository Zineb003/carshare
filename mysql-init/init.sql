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
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    statut ENUM('conducteur', 'passager') NOT NULL,
    typeVehicule VARCHAR(100),
    nbPassagersMax INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(id)
);



CREATE TABLE IF NOT EXISTS trajets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profilId INT NOT NULL,
    startTown VARCHAR(100) NOT NULL,
    endTown VARCHAR(100) NOT NULL,
    startAddress VARCHAR(255),
    endAddress VARCHAR(255),
    startDate DATETIME NOT NULL,
    price DECIMAL(6,2) NULL,                                             
    description TEXT,    
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                      
    FOREIGN KEY (profilId) REFERENCES profil(id)
);


INSERT INTO users (username, email, password) VALUES
('alice', 'alice@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XjEnYWQ$jaE4X6av6OhLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q'),
('bob', 'bob@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XjEnYWQ$jaE4X6av6OhLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q'),
('princesse caroline', 'pcaroline@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XprincessecarolinehLfYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q'),
('patrick fiori', 'pfiori@example.com', '$argon2i$v=19$m=65536,t=4,p=1$kl4mG0NIEyx0xJ0XpatrickfioriYC+tWOyrs+Z/Ab6hqm5TOE6KMS2/9Q');

INSERT INTO profil (userId, statut, typeVehicule, nbPassagersMax) VALUES
(1, 'conducteur', 'Citroen C3', 3),
(2, 'passager', NULL, NULL),
(3, 'passager', NULL, NULL),
(3, 'conducteur', 'Lamborghini SPYDER', 1),
(4, 'conducteur', 'tracteur', 2);

INSERT INTO trajets (profilId, startTown, endTown, startAddress,endAddress,startDate,price,description) VALUES
(1, 'Antibes', 'Reims', 'Gare de Antibes','Gare de Reims','2025-06-21 08:00:00',60.00,'Bonjour, je pars rejoindre ma famille a Reims et mon chat sera du voyage haha!'),
(2, 'annecy', 'eperney', 'bus','Fac de Reims','2025-06-21 16:32:00',NULL,'coucou1'),
(3, 'villard', 'bruxelle', 'bus','bus','2025-06-21 16:32:00',NULL,'Hello, coucou2'),
(3, 'marseille', 'monaco', 'bus','bus','2025-06-21 16:32:00',300.00,'Hello, vehicule non fumeur merci'),
(4, 'cannes', 'nenton', 'Plage','Coccimarket pres de la fac de science','2025-06-21 14:07:00',20.00,'Que tu revieeeeeeennes !!!');


