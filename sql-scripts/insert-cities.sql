use pokemonyasarhoca;

DELETE FROM city;
ALTER TABLE City AUTO_INCREMENT = 1;

INSERT INTO city (name, population) VALUES
('Pallet Town', FLOOR(500 + RAND() * 1500)),
('Viridian City', FLOOR(1000 + RAND() * 5000)),
('Pewter City', FLOOR(3000 + RAND() * 7000)),
('Cerulean City', FLOOR(5000 + RAND() * 10000)),
('Vermilion City', FLOOR(4000 + RAND() * 9000)),
('Lavender Town', FLOOR(2000 + RAND() * 6000)),
('Celadon City', FLOOR(8000 + RAND() * 15000)),
('Fuchsia City', FLOOR(6000 + RAND() * 12000)),
('Saffron City', FLOOR(10000 + RAND() * 20000)),
('Cinnabar Island', FLOOR(3000 + RAND() * 7000)),
('Goldenrod City', FLOOR(10000 + RAND() * 25000)),
('Ecruteak City', FLOOR(4000 + RAND() * 8000)),
('Olivine City', FLOOR(6000 + RAND() * 12000)),
('Mahogany Town', FLOOR(3000 + RAND() * 7000)),
('Blackthorn City', FLOOR(5000 + RAND() * 10000)),
('Rustboro City', FLOOR(7000 + RAND() * 13000)),
('Dewford Town', FLOOR(1000 + RAND() * 5000)),
('Slateport City', FLOOR(8000 + RAND() * 15000)),
('Mauville City', FLOOR(6000 + RAND() * 12000)),
('Verdanturf Town', FLOOR(2000 + RAND() * 6000)),
('Lavaridge Town', FLOOR(3000 + RAND() * 7000)),
('Fallarbor Town', FLOOR(2000 + RAND() * 6000)),
('Fortree City', FLOOR(5000 + RAND() * 10000)),
('Lilycove City', FLOOR(9000 + RAND() * 18000)),
('Mossdeep City', FLOOR(4000 + RAND() * 8000)),
('Sootopolis City', FLOOR(7000 + RAND() * 13000)),
('Pacifidlog Town', FLOOR(1000 + RAND() * 4000)),
('Ever Grande City', FLOOR(1000 + RAND() * 5000)),
('Twinleaf Town', FLOOR(500 + RAND() * 1500)),
('Hearthome City', FLOOR(9000 + RAND() * 18000));

SELECT * FROM city;