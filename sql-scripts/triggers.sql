DELIMITER $$

CREATE TRIGGER after_pokemon_delete
AFTER DELETE ON Pokemon
FOR EACH ROW
BEGIN
    IF OLD.type = 'Wild' THEN
        DELETE FROM WildPokemon WHERE pokemon_id = OLD.id;
    ELSEIF OLD.type = 'Captured' THEN
        DELETE FROM CapturedPokemon WHERE pokemon_id = OLD.id;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_trainer_delete
AFTER DELETE ON Trainer
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

DELIMITER ;