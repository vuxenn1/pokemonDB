const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json()); // To parse JSON payloads

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'nuri234!', // Change this password if needed
    database: 'pokemonyasarhoca'
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to database:', err);
    } else {
        console.log('Connected to database');
    }
});

// API endpoint to fetch items
app.get('/api/items', (req, res) => {
    const query = 'SELECT id, name, description, price FROM Item;';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch items.' });
        } else {
            res.json(results);
        }
    });
});

// API endpoint to fetch badges
app.get('/api/badges', (req, res) => {
    const query = 'SELECT id, name, description, price, isElite FROM Badge;';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch badges.' });
        } else {
            res.json(results);
        }
    });
});

// API endpoint to fetch Pokemons
app.get('/api/pokedex', (req, res) => {
    const query = `
        SELECT p.id, p.name, p.level, p.hp, p.ap, p.speed, t1.name AS primaryType, t2.name AS secondaryType, p.isShiny, p.logo_url as url 
        FROM Pokemon p 
        JOIN PokemonType t1 ON t1.id = p.ptype 
        LEFT JOIN PokemonType t2 ON t2.id = p.stype;
    `;
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch pokemons.' });
        } else {
            res.json(results);
        }
    });
});

// API endpoint to fetch cities
app.get('/api/cities', (req, res) => {
    const query = 'SELECT id, name, population FROM CITY;';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch cities.' });
        } else {
            res.json(results);
        }
    });
});

// Start server
app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
