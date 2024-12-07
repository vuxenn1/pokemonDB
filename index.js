const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path'); // Use path module to serve static files

const app = express();
app.use(cors());

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',  // Replace with your DB password
    database: 'pokemonyasarhoca'
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to database:', err);
    } else {
        console.log('Connected to database');
    }
});

   // API endpoint to get column names of a table
   app.get('/api/columns/:table', (req, res) => 
    {
        const tableName = req.params.table;
    
        const queryText = `
            SELECT COLUMN_NAME 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_SCHEMA = 'pokemonyasarhoca' 
              AND TABLE_NAME = ?;
        `;
    
        db.query(queryText, [tableName], (err, results) => 
        {
            if (err) 
            {
                res.status(500).send(err);
            } 
            else 
            {
                // Extract column names into a simple array
                const columnNames = results.map(row => row.COLUMN_NAME);
                res.json(columnNames);
            }
        });
    });    

// API endpoint to get all pokemons
app.get('/api/pokedex', (req, res) => 
    {
    var queryText = 'SELECT p.id, p.name, p.level, t1.name AS primaryType, t2.name AS secondaryType, p.isShiny, p.logo_url as url FROM Pokemon p JOIN PokemonType t1 ON t1.id = p.ptype LEFT JOIN PokemonType t2 ON t2.id = p.stype;';
    db.query(queryText, (err, results) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(results);
        }
    });
});

// API endpoint to get all city
app.get('/api/cities', (req, res) => 
    {
        var queryText = 'SELECT id, name, population FROM CITY;';
        db.query(queryText, (err, results) => 
        {
            if (err) {
                res.status(500).send(err);
            } else {
                res.json(results);
            }
        });
    });
    
app.get('/api/routes', (req, res) => 
    {
        var queryText = 'SELECT Route.id, Route.name, sc.name AS startingCityName, ec.name AS endingCityName FROM Route JOIN City AS sc ON Route.startingCity = sc.id JOIN City AS ec ON Route.endingCity = ec.id;';
        db.query(queryText, (err, results) => 
        {
            if (err) {
                res.status(500).send(err);
            } else {
                res.json(results);
            }
        });
    });

app.get('/api/wildpokemons', (req, res) => 
    {
        var queryText = 'SELECT WildPokemon.pokemon_id AS wildPokemonID, Pokemon.name AS pokemonName, route_id FROM WildPokemon JOIN Pokemon ON WildPokemon.pokemon_id = Pokemon.id ;';
        db.query(queryText, (err, results) => 
        {
            if (err) {
                res.status(500).send(err);
            } else {
                //console.log(results); // Debugging the database response
                res.json(results);
            }
        });
    });

app.get('/api/capturedpokemons', (req, res) => 
    {
        var queryText = `
        SELECT 
            CapturedPokemon.pokemon_id AS pokemonID, 
            Pokemon.name AS pokemonName, 
            Trainer.name AS trainerName 
        FROM CapturedPokemon
        JOIN Pokemon ON CapturedPokemon.pokemon_id = Pokemon.id
        JOIN Trainer ON CapturedPokemon.trainer_id = Trainer.id;
    `;
        db.query(queryText, (err, results) => 
        {
            if (err) {
                res.status(500).send(err);
            } else {
                res.json(results);
            }
        });
    });

// Start server
app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});