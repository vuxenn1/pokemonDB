USE pokemonyasarhoca;

CREATE TABLE Badge (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    isElite BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE Item(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE PokemonType (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    strongAgainst INT,
    weakAgainst INT,
    
    CONSTRAINT fk_strongAgainst FOREIGN KEY (strongAgainst) REFERENCES PokemonType(id),
    CONSTRAINT fk_weakAgainst FOREIGN KEY (weakAgainst) REFERENCES PokemonType(id)
);

CREATE TABLE Trainer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    gender CHAR(1) NOT NULL,
    badge INT,
    
    CONSTRAINT fk_badge FOREIGN KEY (badge) REFERENCES Badge(id),
    CONSTRAINT chk_gender CHECK (gender IN ('F', 'M'))
);

ALTER TABLE Trainer ADD COLUMN type ENUM('CasualTrainer', 'Player', 'Professor', 'GymLeader') NOT NULL;

CREATE TABLE Pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    level INT NOT NULL,
    pType INT NOT NULL,
    sType INT,
    hp INT NOT NULL,
    ap INT NOT NULL,
    speed INT NOT NULL,
    isShiny BOOLEAN NOT NULL DEFAULT FALSE,
    
    CONSTRAINT fk_pType FOREIGN KEY (pType) REFERENCES PokemonType(id),
    CONSTRAINT fk_sType FOREIGN KEY (sType) REFERENCES PokemonType(id),
    
    CONSTRAINT chk_pType_sType CHECK (pType <> sType OR sType IS NULL)
);

ALTER TABLE Pokemon ADD COLUMN type ENUM('Wild', 'Captured') NOT NULL;

CREATE TABLE City (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    population INT NOT NULL
);

CREATE TABLE Route (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    startingCity INT NOT NULL,
    endingCity INT NOT NULL,
    
    CONSTRAINT fk_startCity FOREIGN KEY (startingCity) REFERENCES City(id),
    CONSTRAINT fk_endCity FOREIGN KEY (endingCity) REFERENCES City(id),
    
    CONSTRAINT chk_start_end_city CHECK (startingCity <> endingCity)
);

CREATE TABLE PokeCenter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    location VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    city INT NOT NULL,
    
    CONSTRAINT fk_cityid_pokecenter FOREIGN KEY (city) REFERENCES City(id)
);

CREATE TABLE Gym (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    location VARCHAR(50) NOT NULL,
    gymType INT NOT NULL,
    city INT NOT NULL,
    
    CONSTRAINT fk_cityid_gym FOREIGN KEY (city) REFERENCES City(id),
    CONSTRAINT fk_gymtype FOREIGN KEY (gymType) REFERENCES PokemonType(id)
);

CREATE TABLE CasualTrainer (
    trainer_id INT PRIMARY KEY,
    route_id INT NOT NULL,
    
    CONSTRAINT fk_trainer_casual FOREIGN KEY (trainer_id) REFERENCES Trainer(id),
    CONSTRAINT fk_route FOREIGN KEY (route_id) REFERENCES Route(id)
);

CREATE TABLE Player (
    trainer_id INT PRIMARY KEY,
    city_id INT NOT NULL,
    
    CONSTRAINT fk_trainer_player FOREIGN KEY (trainer_id) REFERENCES Trainer(id),
    CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES City(id)
);

CREATE TABLE Professor (
    trainer_id INT PRIMARY KEY,
    pokecenter_id INT NOT NULL,
    
    CONSTRAINT fk_trainer_professor FOREIGN KEY (trainer_id) REFERENCES Trainer(id),
    CONSTRAINT fk_pokecenter FOREIGN KEY (pokecenter_id) REFERENCES PokeCenter(id)
);

CREATE TABLE GymLeader (
    trainer_id INT PRIMARY KEY,
    gym_id INT NOT NULL,
    
    CONSTRAINT fk_trainer_gymleader FOREIGN KEY (trainer_id) REFERENCES Trainer(id),
    CONSTRAINT fk_gym FOREIGN KEY (gym_id) REFERENCES Gym(id)
);

CREATE TABLE WildPokemon (
    pokemon_id INT PRIMARY KEY,
    route_id INT NOT NULL,
    
    CONSTRAINT fk_pokemon_wild FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id),
    CONSTRAINT fk_route_wild FOREIGN KEY (route_id) REFERENCES Route(id)
);

CREATE TABLE CapturedPokemon (
    pokemon_id INT PRIMARY KEY,
    trainer_id INT NOT NULL,
    
    CONSTRAINT fk_pokemon_captured FOREIGN KEY (pokemon_id) REFERENCES Pokemon(id),
    CONSTRAINT fk_trainer_captured FOREIGN KEY (trainer_id) REFERENCES Trainer(id)
);