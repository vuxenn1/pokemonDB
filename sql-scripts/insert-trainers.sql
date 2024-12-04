use pokemonyasarhoca;

INSERT INTO Trainer (name, age, gender, badge, type) VALUES
('Ash Ketchum', 10, 'M', 1, 'Player'),
('Misty Waterflower', 14, 'F', 2, 'GymLeader'),
('Professor Oak', 60, 'M', NULL, 'Professor'),
('Brock Stone', 15, 'M', 1, 'CasualTrainer'),
('Erika Grassleaf', 18, 'F', 4, 'GymLeader'),
('Karen Darkshade', 27, 'F', NULL, 'CasualTrainer'),
('Ethan Johto', 12, 'M', 7, 'Player'),
('Whitney Milk', 16, 'F', 10, 'GymLeader'),
('Professor Elm', 50, 'M', NULL, 'Professor'),
('Janine Ninja', 17, 'F', 5, 'GymLeader'),
('Clair Dragon', 19, 'F', 16, 'GymLeader'),
('Falkner Sky', 14, 'M', 8, 'GymLeader'),
('Blue Rival', 10, 'M', 1, 'Player'),
('Professor Birch', 45, 'M', NULL, 'Professor'),
('Dawn Berlitz', 11, 'F', 14, 'Player'),
('Cynthia Champion', 25, 'F', NULL, 'CasualTrainer'),
('Lucas Twinleaf', 12, 'M', NULL, 'Player'),
('Barry Rush', 13, 'M', NULL, 'Player'),
('May Maple', 12, 'F', NULL, 'Player'),
('Brendan Birch', 12, 'M', NULL, 'Player'),
('Hilda Unova', 14, 'F', 17, 'Player'),
('Hilbert Unova', 14, 'M', 17, 'Player'),
('Professor Juniper', 40, 'F', NULL, 'Professor'),
('Wally Verdant', 10, 'M', 8, 'Player'),
('Shauna Kalos', 13, 'F', NULL, 'Player'),
('Tierno Dance', 13, 'M', NULL, 'CasualTrainer'),
('Trevor Pokédex', 12, 'M', NULL, 'CasualTrainer'),
('Professor Kukui', 35, 'M', NULL, 'Professor'),
('Hop Galar', 11, 'M', 12, 'Player'),
('Leon Champion', 22, 'M', NULL, 'CasualTrainer');

select * from trainer;
SELECT t.name AS TrainerName, b.name AS BadgeName FROM Trainer t LEFT JOIN Badge b ON t.badge = b.id;

select name from pokemon;
