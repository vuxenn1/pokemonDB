USE pokemonyasarhoca;

DELIMITER $$

CREATE PROCEDURE InsertTrainerDetails()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE trainer_id INT;
    DECLARE trainer_type VARCHAR(20);
    DECLARE city_id INT;
    DECLARE pokecenter_id INT;
    DECLARE gym_id INT;
    DECLARE route_id INT;
    
    DECLARE max_city_id INT;
    DECLARE max_pokecenter_id INT;
    DECLARE max_gym_id INT;
    DECLARE max_route_id INT;
    
    DECLARE trainer_cursor CURSOR FOR 
        SELECT id, type, city_id, pokecenter_id, gym_id
        FROM Trainer;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    DELETE FROM Player;
    DELETE FROM CasualTrainer;
    DELETE FROM GymLeader;
    DELETE FROM Professor;
    
    SELECT MAX(id) INTO max_city_id FROM City;
    SELECT MAX(id) INTO max_pokecenter_id FROM PokeCenter;
    SELECT MAX(id) INTO max_gym_id FROM Gym;
    SELECT MAX(id) INTO max_route_id FROM Route;

    OPEN trainer_cursor;

    read_loop: LOOP
        FETCH trainer_cursor INTO trainer_id, trainer_type, city_id, pokecenter_id, gym_id;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF trainer_type = 'Player' THEN
            IF city_id IS NULL THEN
                SET city_id = FLOOR(1 + (RAND() * max_city_id));
            END IF;
            INSERT INTO Player (trainer_id, city_id)
            VALUES (trainer_id, city_id);

        ELSEIF trainer_type = 'Professor' THEN
            IF pokecenter_id IS NULL THEN
                SET pokecenter_id = FLOOR(1 + (RAND() * max_pokecenter_id));
            END IF;
            INSERT INTO Professor (trainer_id, pokecenter_id)
            VALUES (trainer_id, pokecenter_id);

        ELSEIF trainer_type = 'GymLeader' THEN
            IF gym_id IS NULL THEN
                SET gym_id = FLOOR(1 + (RAND() * max_gym_id));
            END IF;
            INSERT INTO GymLeader (trainer_id, gym_id)
            VALUES (trainer_id, gym_id);

        ELSEIF trainer_type = 'CasualTrainer' THEN
            IF route_id IS NULL THEN
                SET route_id = FLOOR(1 + (RAND() * max_route_id));
            END IF;
            INSERT INTO CasualTrainer (trainer_id, route_id)
            VALUES (trainer_id, route_id);
        END IF;
    END LOOP;

    CLOSE trainer_cursor;
END $$

DELIMITER $$

CREATE PROCEDURE InsertPokemons()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE pokemon_id INT;
    DECLARE pokemon_type ENUM('Wild', 'Captured');
    DECLARE trainer_id INT;
    DECLARE route_id INT;
    
    DECLARE max_route_id INT;
    DECLARE max_trainer_id INT;

    DECLARE poke_cursor CURSOR FOR 
        SELECT id, type, route_id, trainer_id
        FROM Pokemon;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    DELETE FROM WildPokemon;
    DELETE FROM CapturedPokemon;
    
    SELECT MAX(id) INTO max_route_id FROM Route;
    SELECT MAX(id) INTO max_trainer_id FROM Trainer;

    OPEN poke_cursor;

    read_loop: LOOP
        FETCH poke_cursor INTO pokemon_id, pokemon_type, route_id, trainer_id;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF pokemon_type = 'Captured' THEN
            IF trainer_id IS NULL THEN
                SET trainer_id = FLOOR(1 + (RAND() * max_trainer_id));
            END IF;
            INSERT INTO CapturedPokemon (pokemon_id, trainer_id)
            VALUES (pokemon_id, trainer_id);

        ELSEIF pokemon_type = 'Wild' THEN
            IF route_id IS NULL THEN
                SET route_id = FLOOR(1 + (RAND() * max_route_id));
            END IF;
            INSERT INTO WildPokemon (pokemon_id, route_id)
            VALUES (pokemon_id, route_id);
        END IF;
    END LOOP;

    CLOSE poke_cursor;
END $$

DELIMITER ;

CALL InsertTrainerDetails();
CALL InsertPokemons();

SELECT c.pokemon_id as p, c.trainer_id as t, p.name, t.name FROM capturedpokemon c, trainer t, pokemon p where (c.trainer_id = t.id) and (c.pokemon_id = p.id);
SELECT w.pokemon_id as p, w.route_id as r, p.name, r.name FROM wildpokemon w, route r, pokemon p where (w.route_id = r.id) and (w.pokemon_id = p.id);