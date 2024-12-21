DELETE FROM Badge;
ALTER TABLE Badge AUTO_INCREMENT = 1;
INSERT INTO Badge (name, description, price, isElite) VALUES
('Boulder Badge', 'A badge earned by defeating the Pewter City Gym Leader.', 500, FALSE),
('Cascade Badge', 'A badge earned by defeating the Cerulean City Gym Leader.', 600, FALSE),
('Thunder Badge', 'A badge earned by defeating the Vermilion City Gym Leader.', 700, FALSE),
('Rainbow Badge', 'A badge earned by defeating the Celadon City Gym Leader.', 800, FALSE),
('Soul Badge', 'A badge earned by defeating the Fuchsia City Gym Leader.', 900, FALSE),
('Marsh Badge', 'A badge earned by defeating the Saffron City Gym Leader.', 1000, FALSE),
('Volcano Badge', 'A badge earned by defeating the Cinnabar Island Gym Leader.', 1100, FALSE),
('Earth Badge', 'A badge earned by defeating the Viridian City Gym Leader.', 1200, FALSE),
('Zephyr Badge', 'A badge earned by defeating the Violet City Gym Leader.', 500, FALSE),
('Hive Badge', 'A badge earned by defeating the Azalea Town Gym Leader.', 600, FALSE),
('Plain Badge', 'A badge earned by defeating the Goldenrod City Gym Leader.', 700, FALSE),
('Fog Badge', 'A badge earned by defeating the Ecruteak City Gym Leader.', 800, FALSE),
('Storm Badge', 'A badge earned by defeating the Cianwood City Gym Leader.', 900, FALSE),
('Mineral Badge', 'A badge earned by defeating the Olivine City Gym Leader.', 1000, FALSE),
('Glacier Badge', 'A badge earned by defeating the Mahogany Town Gym Leader.', 1100, FALSE),
('Rising Badge', 'A badge earned by defeating the Blackthorn City Gym Leader.', 1200, FALSE),
('Elite Badge', 'A special badge earned by defeating the Elite Four.', 2000, TRUE),
('Champion Badge', 'A badge awarded to the Champion of the Pokémon League.', 2500, TRUE),
('Battle Frontier Badge', 'A badge earned by defeating the Battle Frontier.', 3000, TRUE),
('Master Badge', 'A badge awarded to the ultimate Pokémon Master.', 5000, TRUE);