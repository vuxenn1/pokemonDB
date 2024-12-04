use pokemonyasarhoca;

DELETE FROM Pokemon;
ALTER TABLE Pokemon AUTO_INCREMENT = 1;

INSERT INTO Pokemon (name, level, pType, sType, hp, ap, speed, isShiny, type) VALUES
('Onix', 15, 9, NULL, 35, 45, 70, FALSE, 'Wild'),
('Pikachu', 25, 4, NULL, 35, 55, 90, FALSE, 'Wild'),
('Bulbasaur', 10, 5, NULL, 45, 49, 45, FALSE, 'Wild'),
('Charmander', 12, 2, NULL, 39, 52, 65, FALSE, 'Wild'),
('Squirtle', 10, 3, NULL, 44, 48, 43, FALSE, 'Wild'),
('Gengar', 40, 13, 16, 60, 65, 110, FALSE, 'Wild'),
('Dragonite', 50, 15, 13, 91, 134, 80, FALSE, 'Captured'),
('Machamp', 45, 7, NULL, 90, 130, 55, FALSE, 'Captured'),
('Alakazam', 40, 11, NULL, 55, 50, 120, FALSE, 'Captured'),
('Snorlax', 30, 1, NULL, 160, 110, 30, FALSE, 'Captured'),
('Lucario', 35, 7, NULL, 70, 110, 90, TRUE, 'Captured'),
('Mewtwo', 60, 11, 16, 106, 150, 130, TRUE, 'Captured'),
('Jolteon', 30, 4, NULL, 65, 65, 130, FALSE, 'Wild'),
('Blastoise', 45, 3, NULL, 79, 83, 58, FALSE, 'Wild'),
('Venusaur', 30, 5, NULL, 80, 82, 60, FALSE, 'Captured'),
('Mew', 50, 11, 16, 100, 100, 100, TRUE, 'Wild'),
('Charizard', 40, 2, 15, 78, 84, 100, FALSE, 'Captured'),
('Pidgeot', 25, 10, NULL, 83, 80, 91, FALSE, 'Wild'),
('Zubat', 15, 10, NULL, 40, 45, 40, FALSE, 'Wild'),
('Eevee', 20, 1, NULL, 55, 50, 55, FALSE, 'Captured'),
('Ponyta', 18, 2, NULL, 50, 65, 60, FALSE, 'Wild'),
('Magikarp', 5, 3, NULL, 20, 10, 80, FALSE, 'Wild'),
('Raichu', 30, 4, NULL, 60, 90, 100, FALSE, 'Captured'),
('Arcanine', 35, 2, NULL, 90, 110, 95, FALSE, 'Captured'),
('Golem', 40, 9, NULL, 80, 120, 40, FALSE, 'Captured'),
('Vaporeon', 30, 3, NULL, 130, 65, 65, FALSE, 'Wild'),
('Flareon', 30, 2, NULL, 130, 110, 65, FALSE, 'Wild'),
('Sylveon', 30, 17, NULL, 95, 65, 60, TRUE, 'Captured'),
('Nidoking', 40, 8, NULL, 81, 102, 85, FALSE, 'Captured'),
('Nidoqueen', 40, 8, NULL, 90, 82, 76, FALSE, 'Captured'),
('Vileplume', 30, 5, NULL, 75, 70, 50, FALSE, 'Captured'),
('Rhydon', 40, 9, NULL, 105, 130, 40, FALSE, 'Captured'),
('Exeggutor', 45, 5, NULL, 95, 105, 55, FALSE, 'Captured'),
('Dugtrio', 35, 9, NULL, 35, 100, 120, FALSE, 'Captured'),
('Lickitung', 20, 1, NULL, 90, 60, 48, FALSE, 'Wild'),
('Hitmonlee', 45, 7, NULL, 50, 120, 87, FALSE, 'Captured'),
('Hitmonchan', 45, 7, NULL, 50, 105, 76, FALSE, 'Captured'),
('Scyther', 40, 12, NULL, 70, 110, 105, FALSE, 'Wild'),
('Pinsir', 45, 12, NULL, 65, 125, 85, FALSE, 'Captured'),
('Electrode', 35, 4, NULL, 60, 50, 150, FALSE, 'Captured'),
('Magmar', 35, 2, NULL, 65, 95, 93, FALSE, 'Captured'),
('Crobat', 45, 10, NULL, 85, 90, 130, FALSE, 'Captured'),
('Tyranitar', 50, 13, NULL, 100, 134, 61, FALSE, 'Captured');

select id,name from pokemon;

SELECT
	p.id,
	p.name,
	t.name, 
	t2.name
FROM Pokemon p
JOIN PokemonType t ON p.pType = t.id
LEFT JOIN PokemonType t2 ON p.sType = t2.id;
select * from pokemon;
INSERT INTO Pokemon (name, level, pType, sType, hp, ap, speed, isShiny, type) VALUES
('Wooloo', 18, 1, NULL, 45, 48, 40, FALSE, 'Wild');

update pokemon set id = 44 where name = 'Wooloo';
select * from wildpokemon;