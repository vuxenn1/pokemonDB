DROP TRIGGER IF EXISTS before_pokemon_delete;
DROP TRIGGER IF EXISTS after_pokemon_insert;
DROP TRIGGER IF EXISTS before_trainer_delete;
DROP TRIGGER IF EXISTS after_trainer_insert;

DELIMITER $$

CREATE TRIGGER before_pokemon_delete
BEFORE DELETE ON Pokemon
FOR EACH ROW
BEGIN
    IF OLD.type = 'Wild' THEN
        DELETE FROM WildPokemon WHERE pokemon_id = OLD.id;
    ELSEIF OLD.type = 'Captured' THEN
        DELETE FROM CapturedPokemon WHERE pokemon_id = OLD.id;
    END IF;
END$$

CREATE TRIGGER after_pokemon_insert
AFTER INSERT ON Pokemon
FOR EACH ROW
BEGIN
    IF NEW.type = 'Wild' THEN
        INSERT INTO WildPokemon (pokemon_id, route_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Route)));
    ELSEIF NEW.type = 'Captured' THEN
        INSERT INTO CapturedPokemon (pokemon_id, trainer_id)
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Trainer)));
    END IF;
END$$

CREATE TRIGGER before_trainer_delete
BEFORE DELETE ON Trainer
FOR EACH ROW
BEGIN
    IF OLD.type = 'CasualTrainer' THEN
        DELETE FROM CasualTrainer WHERE trainer_id = OLD.id;
    ELSEIF OLD.type = 'Player' THEN
        DELETE FROM Player WHERE trainer_id = OLD.id;
    ELSEIF OLD.type = 'Professor' THEN
        DELETE FROM Professor WHERE trainer_id = OLD.id;
    ELSEIF OLD.type = 'GymLeader' THEN
        DELETE FROM GymLeader WHERE trainer_id = OLD.id;
    END IF;
END$$

CREATE TRIGGER after_trainer_insert
AFTER INSERT ON Trainer
FOR EACH ROW
BEGIN
    IF NEW.type = 'CasualTrainer' THEN
        INSERT INTO CasualTrainer (trainer_id, route_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Route)));
    ELSEIF NEW.type = 'Player' THEN
        INSERT INTO Player (trainer_id, city_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM City)));
    ELSEIF NEW.type = 'Professor' THEN
        INSERT INTO Professor (trainer_id, pokecenter_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM PokeCenter)));
    ELSEIF NEW.type = 'GymLeader' THEN
        INSERT INTO GymLeader (trainer_id, gym_id) 
        VALUES (NEW.id, FLOOR(1 + RAND() * (SELECT MAX(id) FROM Gym)));
    END IF;
END$$

DELIMITER ;