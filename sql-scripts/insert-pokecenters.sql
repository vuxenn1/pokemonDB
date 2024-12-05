DELETE FROM pokecenter;
ALTER TABLE pokecenter AUTO_INCREMENT = 1;

INSERT INTO PokeCenter (name, location, capacity, city) VALUES
('Pallet PokeCenter', 'Main St, Pallet Town', 20, 1),
('Viridian PokeCenter', 'Greenway Rd, Viridian City', 25, 2),
('Pewter PokeCenter', 'Rock Ave, Pewter City', 30, 3),
('Cerulean PokeCenter', 'River Blvd, Cerulean City', 35, 4),
('Vermilion PokeCenter', 'Harbor Lane, Vermilion City', 40, 5),
('Lavender PokeCenter', 'Ghost St, Lavender Town', 15, 6),
('Celadon PokeCenter', 'Market Rd, Celadon City', 50, 7),
('Fuchsia PokeCenter', 'Safari Ave, Fuchsia City', 35, 8),
('Saffron PokeCenter', 'Silph Rd, Saffron City', 60, 9),
('Cinnabar PokeCenter', 'Volcano Path, Cinnabar Island', 20, 10),
('Goldenrod PokeCenter', 'Flower St, Goldenrod City', 45, 11),
('Ecruteak PokeCenter', 'Burned Tower Rd, Ecruteak City', 30, 12),
('Olivine PokeCenter', 'Lighthouse Lane, Olivine City', 25, 13),
('Mahogany PokeCenter', 'Rage Rd, Mahogany Town', 20, 14),
('Blackthorn PokeCenter', 'Dragon Ave, Blackthorn City', 35, 15);

select * from pokecenter;
select p.name,p.location,c.name from pokecenter p, city c where p.city = c.id;