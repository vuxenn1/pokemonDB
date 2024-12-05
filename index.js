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
    password: '',  // Replace with your DB password
    database: 'pokemonyasarhoca'
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to database:', err);
    } else {
        console.log('Connected to database');
    }
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

// API endpoint to get all pokemons
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
    

// Start server
app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});