USE pokemondb;

CREATE TABLE TYPE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL,
    strong_against INT,  -- References another type
    weak_against INT,    -- References another type
    FOREIGN KEY (strong_against) REFERENCES TYPE(id),
    FOREIGN KEY (weak_against) REFERENCES TYPE(id)
);

select * from type;

CREATE TABLE POKEMON (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    level INT NOT NULL,
    type1 INT NOT NULL, -- Will reference TYPE table
    type2 INT,          -- Will reference TYPE table (optional)
    hp INT NOT NULL,
    ap INT NOT NULL,
    speed INT NOT NULL,
    isShiny BOOLEAN DEFAULT FALSE,  -- Boolean: TRUE for Shiny, FALSE for non-Shiny
    CONSTRAINT FK_type1 FOREIGN KEY (type1) REFERENCES TYPE(id),
    CONSTRAINT FK_type2 FOREIGN KEY (type2) REFERENCES TYPE(id)
);

select * from pokemon;

-- Inserting types -- Name will change
INSERT INTO TYPE (type_name) VALUES ('Normal');

-- Normal
UPDATE TYPE SET strong_against = NULL WHERE id = 1;  -- Normal has no strong type
UPDATE TYPE SET weak_against = NULL WHERE id = 1;    -- Normal has no weak type

-- Fire
UPDATE TYPE SET strong_against = 5 WHERE id = 2;     -- Strong against Grass
UPDATE TYPE SET weak_against = 3 WHERE id = 2;       -- Weak against Water

-- Water
UPDATE TYPE SET strong_against = 2 WHERE id = 3;     -- Strong against Fire
UPDATE TYPE SET weak_against = 5 WHERE id = 3;       -- Weak against Grass

-- Electric
UPDATE TYPE SET strong_against = 10 WHERE id = 4;    -- Strong against Flying
UPDATE TYPE SET weak_against = 9 WHERE id = 4;       -- Weak against Ground

-- Grass
UPDATE TYPE SET strong_against = 3 WHERE id = 5;     -- Strong against Water
UPDATE TYPE SET weak_against = 2 WHERE id = 5;       -- Weak against Fire

-- Ice
UPDATE TYPE SET strong_against = 10 WHERE id = 6;    -- Strong against Flying
UPDATE TYPE SET weak_against = 7 WHERE id = 6;       -- Weak against Fighting

-- Fighting
UPDATE TYPE SET strong_against = 1 WHERE id = 7;     -- Strong against Normal
UPDATE TYPE SET weak_against = 11 WHERE id = 7;      -- Weak against Psychic

-- Poison
UPDATE TYPE SET strong_against = 8 WHERE id = 8;     -- Strong against Grass
UPDATE TYPE SET weak_against = 9 WHERE id = 8;       -- Weak against Ground

-- Ground
UPDATE TYPE SET strong_against = 4 WHERE id = 9;     -- Strong against Electric
UPDATE TYPE SET weak_against = 3 WHERE id = 9;       -- Weak against Water

-- Flying
UPDATE TYPE SET strong_against = 6 WHERE id = 10;    -- Strong against Grass
UPDATE TYPE SET weak_against = 4 WHERE id = 10;      -- Weak against Electric

-- Psychic
UPDATE TYPE SET strong_against = 7 WHERE id = 11;    -- Strong against Fighting
UPDATE TYPE SET weak_against = 12 WHERE id = 11;     -- Weak against Bug

-- Bug
UPDATE TYPE SET strong_against = 5 WHERE id = 12;    -- Strong against Grass
UPDATE TYPE SET weak_against = 2 WHERE id = 12;      -- Weak against Fire

-- Rock
UPDATE TYPE SET strong_against = 10 WHERE id = 13;   -- Strong against Flying
UPDATE TYPE SET weak_against = 3 WHERE id = 13;      -- Weak against Water

-- Ghost
UPDATE TYPE SET strong_against = 11 WHERE id = 14;   -- Strong against Psychic
UPDATE TYPE SET weak_against = 15 WHERE id = 14;     -- Weak against Dark

-- Dragon
UPDATE TYPE SET strong_against = 15 WHERE id = 15;   -- Strong against Dragon
UPDATE TYPE SET weak_against = 16 WHERE id = 15;     -- Weak against Fairy

-- Dark
UPDATE TYPE SET strong_against = 16 WHERE id = 16;   -- Strong against Psychic
UPDATE TYPE SET weak_against = 7 WHERE id = 16;      -- Weak against Fighting

-- Steel
UPDATE TYPE SET strong_against = 18 WHERE id = 17;   -- Strong against Fairy
UPDATE TYPE SET weak_against = 2 WHERE id = 17;      -- Weak against Fire

-- Fairy
UPDATE TYPE SET strong_against = 15 WHERE id = 18;   -- Strong against Dragon
UPDATE TYPE SET weak_against = 17 WHERE id = 18;     -- Weak against Steel

SELECT 
    t.type_name AS name,
    t_strong.type_name AS strong,
    t_weak.type_name AS weak
FROM TYPE t LEFT JOIN TYPE t_strong ON t.strong_against = t_strong.id LEFT JOIN TYPE t_weak ON t.weak_against = t_weak.id;

-- Inserting Pokémon examples
INSERT INTO POKEMON (name, level, type1, type2, hp, ap, speed, isShiny) 
VALUES ('Onix', 25, 9, NULL, 35, 45, 70, 0);  -- Ground

INSERT INTO POKEMON (name, level, type1, type2, hp, ap, speed, isShiny) 
VALUES ('Charizard', 36, 2, 5, 78, 84, 100, FALSE);  -- Fire/Flying

INSERT INTO POKEMON (name, level, type1, type2, hp, ap, speed, isShiny) 
VALUES ('Blastoise', 36, 3, NULL, 79, 83, 78, FALSE);  -- Water

INSERT INTO POKEMON (name, level, type1, type2, hp, ap, speed, isShiny) 
VALUES ('Venusaur', 36, 3, 5, 80, 82, 80, FALSE);  -- Grass/Poison

INSERT INTO POKEMON (name, level, type1, type2, hp, ap, speed, isShiny) 
VALUES ('Pikachu', 25, 4, NULL, 35, 55, 90, TRUE);  -- Electric (Shiny)

INSERT INTO POKEMON (name, level, type1, type2, hp, ap, speed, isShiny) 
VALUES ('Pidgeot', 36, 5, NULL, 83, 80, 91, FALSE);  -- Flying

select count(*) as sayi from pokemon, type;

CREATE TABLE TRAINER (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    gender CHAR(1),  -- Assuming M for Male, F for Female
    badges INT DEFAULT 0  -- Number of badges the trainer has
);

INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Ash Ketchum', 10, 'M', 8);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Misty Waterflower', 19, 'F', 2);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Brock Harrison', 15, 'M', 3);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Professor Oak', 50, 'M', 0);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Tracey Sketchit', 16, 'M', 1);

select * from trainer;

CREATE TABLE BADGE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    isElite BOOLEAN DEFAULT FALSE  -- Indicates if the badge is an elite badge
);
INSERT INTO BADGE (name, description, price, isElite) VALUES ('Boulder Badge', 'A badge received for defeating Brock in Pewter City.', 500.00, FALSE);
INSERT INTO BADGE (name, description, price, isElite) VALUES ('Cascade Badge', 'A badge awarded for defeating Misty in Cerulean City.', 500.00, FALSE);
INSERT INTO BADGE (name, description, price, isElite) VALUES ('Thunder Badge', 'A badge given for defeating Lt. Surge in Vermilion City.', 700.00, FALSE);
INSERT INTO BADGE (name, description, price, isElite) VALUES ('Earth Badge', 'A badge awarded for defeating Giovanni in Viridian City.', 800.00, FALSE);
INSERT INTO BADGE (name, description, price, isElite) VALUES ('Elite Badge', 'An elite badge received after defeating the Elite Four.', 2000.00, TRUE);

select * from badge;

CREATE TABLE ITEM (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);
INSERT INTO ITEM (name, description, price) VALUES ('Potion', 'Restores 20 HP to a Pokémon.', 300.00);
INSERT INTO ITEM (name, description, price) VALUES ('Super Potion', 'Restores 50 HP to a Pokémon.', 700.00);
INSERT INTO ITEM (name, description, price) VALUES ('Hyper Potion', 'Restores 200 HP to a Pokémon.', 1200.00);
INSERT INTO ITEM (name, description, price) VALUES ('Revive', 'Revives a fainted Pokémon with half of its max HP.', 1500.00);
INSERT INTO ITEM (name, description, price) VALUES ('Poké Ball', 'A device for catching wild Pokémon.', 200.00);
select * from item;

CREATE TABLE CITY (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    population INT,
    gyms INT,
    poke_centers INT
);

select * from city;
-- Creating POKE_CENTER table
CREATE TABLE POKE_CENTER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city_id INT,
    location VARCHAR(255),
    capacity INT,
    professors INT,
    FOREIGN KEY (city_id) REFERENCES CITY(id)  -- Assuming you have a CITY table
);

select * from poke_center;

-- Creating GYM_LEADER table
CREATE TABLE GYM_LEADER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_id INT,  -- Reference to the TRAINER table
    gym_id INT,      -- Reference to the GYM table
    FOREIGN KEY (trainer_id) REFERENCES TRAINER(id),  -- Reference to the TRAINER table
    FOREIGN KEY (gym_id) REFERENCES GYM(id)           -- Reference to the GYM table
);

-- Creating GYM_LEADER table as a subclass of TRAINER
CREATE TABLE GYM_LEADER (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_id INT,  -- Reference to the TRAINER table
    FOREIGN KEY (trainer_id) REFERENCES TRAINER(id)  -- Reference to the TRAINER table
);

-- Creating GYM table
CREATE TABLE GYM (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES CITY(id)  -- Reference to the CITY table
);
-- Altering GYM_LEADER table to add gym_id
ALTER TABLE GYM_LEADER 
ADD gym_id INT,
ADD FOREIGN KEY (gym_id) REFERENCES GYM(id);  -- Reference to the GYM table

-- Creating PROFESSOR table
CREATE TABLE PROFESSOR (
    id INT PRIMARY KEY AUTO_INCREMENT,
    poke_center_id INT UNIQUE,  -- Ensure one-to-one relationship
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (poke_center_id) REFERENCES POKE_CENTER(id)  -- Reference to the POKE_CENTER table
);

-- Altering POKE_CENTER table to add professor_id
ALTER TABLE POKE_CENTER 
ADD professor_id INT UNIQUE,  -- Ensure one-to-one relationship
ADD FOREIGN KEY (professor_id) REFERENCES PROFESSOR(id);  -- Reference to the PROFESSOR table

INSERT INTO CITY (name, population) VALUES ('Pallet Town', 200);
INSERT INTO CITY (name, population) VALUES ('Viridian City', 500);
INSERT INTO CITY (name, population) VALUES ('Pewter City', 300);

INSERT INTO POKE_CENTER (name, city_id, location, capacity, professor_id) VALUES ('Pallet Center', 1, 'Main Street', 10, NULL);
INSERT INTO POKE_CENTER (name, city_id, location, capacity, professor_id) VALUES ('Viridian Center', 2, 'Center Plaza', 15, NULL);
INSERT INTO POKE_CENTER (name, city_id, location, capacity, professor_id) VALUES ('Pewter Center', 3, 'Market Square', 12, NULL);

INSERT INTO GYM (name, city_id, gym_leader_id) VALUES ('Pallet Gym', 1, null);
INSERT INTO GYM (name, city_id, gym_leader_id) VALUES ('Viridian Gym', 2, null);
INSERT INTO GYM (name, city_id, gym_leader_id) VALUES ('Pewter Gym', 3, null);

select * from gym_leader;

ALTER TABLE GYM 
ADD gym_leader_id INT,
ADD FOREIGN KEY (gym_leader_id) REFERENCES GYM_LEADER(id);

INSERT INTO GYM_LEADER (id, gym_id) VALUES (1, NULL);  -- Gym Leader 1 (to be linked later)
INSERT INTO GYM_LEADER (id, gym_id) VALUES (2, NULL);  -- Gym Leader 2 (to be linked later)
INSERT INTO GYM_LEADER (id, gym_id) VALUES (3, NULL);  -- Gym Leader 3 (to be linked later)


INSERT INTO PROFESSOR (name) VALUES ('Professor Oak');
INSERT INTO PROFESSOR (name) VALUES ('Professor Elm');
INSERT INTO PROFESSOR (name) VALUES ('Professor Flint');

select * from professor;

CREATE TABLE ROUTE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    starting_city INT,
    ending_city INT,
    pokemon_level_range VARCHAR(20),
    FOREIGN KEY (starting_city) REFERENCES CITY(id),
    FOREIGN KEY (ending_city) REFERENCES CITY(id)
);

INSERT INTO ROUTE (name, starting_city, ending_city, pokemon_level_range) VALUES ('Route 1', 1, 2, '5-10');  -- From Pallet Town to Viridian City
INSERT INTO ROUTE (name, starting_city, ending_city, pokemon_level_range) VALUES ('Route 2', 2, 3, '10-15');  -- From Viridian City to Pewter City
INSERT INTO ROUTE (name, starting_city, ending_city, pokemon_level_range) VALUES ('Route 3', 3, 1, '15-20');  -- From Pewter City to Pallet Town

CREATE TABLE PLAYER (
    id INT,
    city_id INT,
    items INT,
    team INT,
    FOREIGN KEY (id) REFERENCES TRAINER(id),
    FOREIGN KEY (city_id) REFERENCES CITY(id),
    PRIMARY KEY (id)  -- Primary key is just the id from TRAINER
);

CREATE TABLE CASUAL_TRAINER (
    id INT,
    route_id INT,
    FOREIGN KEY (id) REFERENCES PLAYER(id),
    FOREIGN KEY (route_id) REFERENCES ROUTE(id),
    PRIMARY KEY (id, route_id)  -- Composite primary key
);

select * from casual_trainer;

INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Team Rocket Jessie', 20, 'F', 0);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Team Rocket James', 22, 'M', 0);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('May', 15, 'F', 3);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Dawn', 10, 'F', 2);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Serena', 16, 'F', 1);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Cynthia', 30, 'F', 8);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Paul', 16, 'M', 6);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Iris', 16, 'F', 5);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Korrina', 17, 'F', 4);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Alain', 20, 'M', 5);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('N', 18, 'M', 2);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Lysandre', 35, 'M', 0);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Flannery', 18, 'F', 2);
INSERT INTO TRAINER (name, age, gender, badges) VALUES ('Roxanne', 19, 'F', 3);

select * from route;

INSERT INTO CASUAL_TRAINER (id, route_id) VALUES (1, 1);
INSERT INTO CASUAL_TRAINER (id, route_id) VALUES (2, 2);
INSERT INTO CASUAL_TRAINER (id, route_id) VALUES (3, 3);
select * from casual_trainer;

INSERT INTO PLAYER (id, city_id, items, team) VALUES (4, 1, NULL, NULL);
INSERT INTO PLAYER (id, city_id, items, team) VALUES (5, 2, NULL, NULL);
INSERT INTO PLAYER (id, city_id, items, team) VALUES (6, 3, NULL, NULL);
select * from player;

INSERT INTO PROFESSOR (id, poke_center_id) VALUES (7, 1);
INSERT INTO PROFESSOR (id, poke_center_id) VALUES (8, 2);
select * from professor;

INSERT INTO GYM_LEADER (id, gym_id) VALUES (9, 1);  -- Gym Leader 1
INSERT INTO GYM_LEADER (id, gym_id) VALUES (10, 2); -- Gym Leader 2
select * from gym_leader;

