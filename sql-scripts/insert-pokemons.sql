DELETE FROM Pokemon;
ALTER TABLE Pokemon AUTO_INCREMENT = 1;

INSERT INTO Pokemon (name, level, pType, sType, hp, ap, speed, isShiny, type, logo_url) VALUES
('Onix', 15, 9, NULL, 35, 45, 70, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/onix.png'),
('Pikachu', 25, 4, NULL, 35, 55, 90, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/pikachu-f.png'),
('Bulbasaur', 10, 5, NULL, 45, 49, 45, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png'),
('Charmander', 12, 2, NULL, 39, 52, 65, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/charmander.png'),
('Squirtle', 10, 3, NULL, 44, 48, 43, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/squirtle.png'),
('Gengar', 40, 13, 16, 60, 65, 110, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/gengar.png'),
('Dragonite', 50, 15, 13, 91, 134, 80, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/dragonite.png'),
('Machamp', 45, 7, NULL, 90, 130, 55, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/machamp.png'),
('Alakazam', 40, 11, NULL, 55, 50, 120, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/alakazam.png'),
('Snorlax', 30, 1, NULL, 160, 110, 30, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/snorlax.png'),
('Lucario', 35, 7, NULL, 70, 110, 90, TRUE, 'Captured','https://img.pokemondb.net/sprites/x-y/shiny/lucario.png'),
('Mewtwo', 60, 11, 16, 106, 150, 130, TRUE, 'Captured','https://img.pokemondb.net/sprites/x-y/shiny/mewtwo.png'),
('Jolteon', 30, 4, NULL, 65, 65, 130, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/jolteon.png'),
('Blastoise', 45, 3, NULL, 79, 83, 58, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/blastoise.png'),
('Venusaur', 30, 5, NULL, 80, 82, 60, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/venusaur.png'),
('Mew', 50, 11, 16, 100, 100, 100, TRUE, 'Wild','https://img.pokemondb.net/sprites/x-y/shiny/mew.png'),
('Charizard', 40, 2, 15, 78, 84, 100, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/charizard.png'),
('Pidgeot', 25, 10, NULL, 83, 80, 91, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/pidgeot.png'),
('Zubat', 15, 10, NULL, 40, 45, 40, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/zubat.png'),
('Eevee', 20, 1, NULL, 55, 50, 55, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/eevee.png'),
('Ponyta', 18, 2, NULL, 50, 65, 60, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/ponyta.png'),
('Magikarp', 5, 3, NULL, 20, 10, 80, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/magikarp.png'),
('Raichu', 30, 4, NULL, 60, 90, 100, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/raichu.png'),
('Arcanine', 35, 2, NULL, 90, 110, 95, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/arcanine.png'),
('Golem', 40, 9, NULL, 80, 120, 40, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/golem.png'),
('Vaporeon', 30, 3, NULL, 130, 65, 65, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/vaporeon.png'),
('Flareon', 30, 2, NULL, 130, 110, 65, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/flareon.png'),
('Sylveon', 30, 17, NULL, 95, 65, 60, TRUE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/sylveon.png'),
('Nidoking', 40, 8, NULL, 81, 102, 85, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/nidoking.png'),
('Nidoqueen', 40, 8, NULL, 90, 82, 76, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/nidoqueen.png'),
('Vileplume', 30, 5, NULL, 75, 70, 50, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/vileplume.png'),
('Rhydon', 40, 9, NULL, 105, 130, 40, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/rhydon.png'),
('Exeggutor', 45, 5, NULL, 95, 105, 55, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/exeggutor.png'),
('Dugtrio', 35, 9, NULL, 35, 100, 120, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/dugtrio.png'),
('Lickitung', 20, 1, NULL, 90, 60, 48, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/lickitung.png'),
('Hitmonlee', 45, 7, NULL, 50, 120, 87, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/hitmonlee.png'),
('Hitmonchan', 45, 7, NULL, 50, 105, 76, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/hitmonchan.png'),
('Scyther', 40, 12, NULL, 70, 110, 105, FALSE, 'Wild','https://img.pokemondb.net/sprites/x-y/normal/scyther.png'),
('Pinsir', 45, 12, NULL, 65, 125, 85, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/pinsir.png'),
('Electrode', 35, 4, NULL, 60, 50, 150, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/electrode.png'),
('Magmar', 35, 2, NULL, 65, 95, 93, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/magmar.png'),
('Crobat', 45, 10, NULL, 85, 90, 130, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/crobat.png'),
('Tyranitar', 50, 13, NULL, 100, 134, 61, FALSE, 'Captured','https://img.pokemondb.net/sprites/x-y/normal/tyranitar.png');