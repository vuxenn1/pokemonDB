SELECT p1.id, p1.name, p2.name AS StrongAgainst, p3.name AS WeakAgainst 
FROM PokemonType p1 
LEFT JOIN PokemonType p2 ON p1.strongAgainst = p2.id 
LEFT JOIN PokemonType p3 ON p1.weakAgainst = p3.id;