use pokemonyasarhoca;

DELETE FROM PokemonType;
ALTER TABLE PokemonType AUTO_INCREMENT = 1;

-- POKEMON TYPE INSERT AND UPDATE PART
INSERT INTO PokemonType (name)
VALUES 
    ('Normal'),
    ('Fire'),
    ('Water'),
    ('Electric'),
    ('Grass'),
    ('Ice'),
    ('Fighting'),
    ('Poison'),
    ('Ground'),
    ('Flying'),
    ('Psychic'),
    ('Bug'),
    ('Rock'),
    ('Ghost'),
    ('Dragon'),
    ('Dark'),
    ('Steel'),
    ('Fairy');

UPDATE PokemonType SET strongAgainst = 1, weakAgainst = 14 WHERE name = 'Normal';
UPDATE PokemonType SET strongAgainst = 5, weakAgainst = 3 WHERE name = 'Fire';
UPDATE PokemonType SET strongAgainst = 2, weakAgainst = 5 WHERE name = 'Water';
UPDATE PokemonType SET strongAgainst = 3, weakAgainst = 9 WHERE name = 'Electric';
UPDATE PokemonType SET strongAgainst = 3, weakAgainst = 2 WHERE name = 'Grass';
UPDATE PokemonType SET strongAgainst = 5, weakAgainst = 2 WHERE name = 'Ice';
UPDATE PokemonType SET strongAgainst = 1, weakAgainst = 10 WHERE name = 'Fighting';
UPDATE PokemonType SET strongAgainst = 5, weakAgainst = 9 WHERE name = 'Poison';
UPDATE PokemonType SET strongAgainst = 2, weakAgainst = 5 WHERE name = 'Ground';
UPDATE PokemonType SET strongAgainst = 7, weakAgainst = 4 WHERE name = 'Flying';
UPDATE PokemonType SET strongAgainst = 8, weakAgainst = 17 WHERE name = 'Psychic';
UPDATE PokemonType SET strongAgainst = 5, weakAgainst = 2 WHERE name = 'Bug';
UPDATE PokemonType SET strongAgainst = 2, weakAgainst = 7 WHERE name = 'Rock';
UPDATE PokemonType SET strongAgainst = 11, weakAgainst = 16 WHERE name = 'Ghost';
UPDATE PokemonType SET strongAgainst = 15, weakAgainst = 17 WHERE name = 'Dragon';
UPDATE PokemonType SET strongAgainst = 1, weakAgainst = 7 WHERE name = 'Dark';
UPDATE PokemonType SET strongAgainst = 18, weakAgainst = 9 WHERE name = 'Steel';
UPDATE PokemonType SET strongAgainst = 17, weakAgainst = 7 WHERE name = 'Fairy';