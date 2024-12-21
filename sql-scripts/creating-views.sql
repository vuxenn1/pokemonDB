CREATE VIEW poketypes_view AS 
SELECT 
    p.name AS 'Pokemon Name', 
    t.name AS 'Primary Type', 
    t2.name AS 'Secondary Type' 
FROM 
    pokemon p 
JOIN 
    pokemontype t ON p.ptype = t.id 
LEFT JOIN 
    pokemontype t2 ON p.sType = t2.id;

CREATE VIEW gym_view AS 
SELECT 
    g.id AS gym_id, 
    g.name AS gym_name, 
    g.location AS gym_loc, 
    t.name AS type_name, 
    c.name AS city_name 
FROM 
    gym g, 
    city c, 
    pokemontype t 
WHERE 
    (t.id = g.gymType) 
    AND (c.id = g.city);

CREATE VIEW pokecenter_view AS 
SELECT 
    p.id AS pc_id, 
    p.name AS pc_name, 
    p.location AS pc_loc, 
    p.capacity AS pc_cap, 
    c.name AS city_name 
FROM 
    pokecenter p, 
    city c 
WHERE 
    (c.id = p.city);

CREATE VIEW route_view AS 
SELECT 
    r.id AS r_id, 
    r.name AS r_name, 
    sc.name AS starting_city, 
    ec.name AS ending_city 
FROM 
    route r, 
    city sc, 
    city ec 
WHERE 
    (r.startingCity = sc.id) 
    AND (r.endingCity = ec.id);

CREATE VIEW poketrainer_view AS 
SELECT 
    t.id AS id, 
    t.name AS name, 
    GROUP_CONCAT(p.name SEPARATOR ', ') AS pokemons 
FROM 
    capturedpokemon c 
JOIN 
    pokemon p ON c.pokemon_id = p.id 
JOIN 
    trainer t ON t.id = c.trainer_id 
GROUP BY 
    t.name, t.id 
ORDER BY 
    t.id;

-- SELECT * FROM poketypes_view;
-- SELECT * FROM gym_view;
-- SELECT * FROM pokecenter_view;
-- SELECT * FROM route_view;
-- SELECT * FROM poketrainer_view;