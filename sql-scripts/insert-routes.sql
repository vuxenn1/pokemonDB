DELETE FROM route;
ALTER TABLE route AUTO_INCREMENT = 1;

INSERT INTO Route (name, startingCity, endingCity) VALUES
('Route 1', 1, 2),
('Route 2', 2, 3),
('Route 3', 3, 4),
('Route 4', 4, 5),
('Route 5', 5, 6),
('Route 6', 6, 7),
('Route 7', 7, 8),
('Route 8', 8, 9),
('Route 9', 9, 10),
('Route 10', 10, 11),
('Route 11', 11, 12),
('Route 12', 12, 13),
('Route 13', 13, 1);