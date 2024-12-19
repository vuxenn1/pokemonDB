CREATE VIEW poketypes_view AS SELECT p.name AS 'Pokemon Name', t.name AS 'Primary Type', t2.name AS 'Secondary Type' FROM pokemon p JOIN pokemontype t ON p.ptype = t.id LEFT JOIN pokemontype t2 ON p.sType = t2.id;

CREATE VIEW gym_view AS SELECT g.id as gym_id, g.name as gym_name, g.location as gym_loc, t.name as type_name, c.name as city_name FROM gym g, city c, pokemontype t where (t.id = g.gymType) and (c.id = g.city);

CREATE view pokecenter_view AS select p.id as pc_id, p.name as pc_name, p.location as pc_loc, p.capacity as pc_cap, c.name as city_name from pokecenter p, city c where (c.id = p.city);

CREATE VIEW route_view AS SELECT r.id as r_id, r.name as r_name, sc.name as starting_city, ec.name as ending_city  FROM route r, city sc, city ec where (r.startingCity = sc.id) and (r.endingCity = ec.id);

-- SELECT * FROM poketypes_view;
-- SELECT * FROM gym_view;
-- SELECT * FROM pokecenter_view;
-- SELECT * FROM route_view;