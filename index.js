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

app.post('/add-pokemon', (req, res) => {
    const { name, level, type1, type2, hp, ap, sp, isShiny, status, logo } = req.body;

    // Step 1: Fetch the type IDs for the selected types
    const getTypeIdsQuery = `
        SELECT id 
        FROM PokemonType 
        WHERE name IN (?, ?)
    `;
    const values = [type1, type2 || 'None']; // If type2 is null, use 'None' or similar fallback

    db.query(getTypeIdsQuery, values, (err, results) => {
        if (err) {
            console.error('Error fetching type IDs:', err);
            return res.status(500).json({ message: 'Error fetching type IDs', error: err.message });
        }

        // Step 2: Check if we got both type IDs
        if (results.length < 1) {
            return res.status(400).json({ message: 'One or both Pokémon types not found.' });
        }

        // Get the ids from the query result
        const pTypeId = results[0].id; // Primary Type ID
        const sTypeId = results.length > 1 ? results[1].id : null; // Secondary Type ID (nullable)

        // Step 3: Insert Pokémon using the type IDs
        const insertPokemonQuery = `
            INSERT INTO Pokemon (name, level, pType, sType, hp, ap, speed, isShiny, type, logo_url)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const pokemonValues = [
            name, level, pTypeId, sTypeId, hp, ap, sp, isShiny ? 1 : 0, status, logo
        ];

        db.query(insertPokemonQuery, pokemonValues, (err, result) => {
            if (err) {
                console.error('SQL Error:', err);
                return res.status(500).json({ message: 'Failed to add Pokémon', error: err.message });
            } else {
                console.log('Pokémon added:', result);
                return res.status(200).json({ message: 'Pokémon added successfully' });
            }
        });
    });
});

// Add Item endpoint
app.post('/add-item', (req, res) => {
    const { name, description, price } = req.body;

    const query = `
        INSERT INTO Item (name, description, price)
        VALUES (?, ?, ?)
    `;
    const values = [name, description, price];

    db.query(query, values, (err, result) => {
        if (err) {
            console.error('SQL Error:', err);
            return res.status(500).json({ message: 'Failed to add item', error: err.message });
        } else {
            console.log('Item added:', result);
            return res.status(200).json({ message: 'Item added successfully' });
        }
    });
});

// Add Badge endpoint
app.post('/add-badge', (req, res) => {
    const { name, description, price, isElite } = req.body;

    const query = `
        INSERT INTO Badge (name, description, price, isElite)
        VALUES (?, ?, ?, ?)
    `;
    const values = [name, description, price, isElite ? 1 : 0];

    db.query(query, values, (err, result) => {
        if (err) {
            console.error('SQL Error:', err);
            return res.status(500).json({ message: 'Failed to add badge', error: err.message });
        } else {
            console.log('Badge added:', result);
            return res.status(200).json({ message: 'Badge added successfully' });
        }
    });
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

// API endpoint to fetch gym view
app.get('/api/gyms', (req, res) => {
    const query = 'SELECT * FROM gym_view;';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch gyms.'});
        } else {
            res.json(results);
        }
    });
});

// API endpoint to fetch gym view
app.get('/api/pokecenters', (req, res) => {
    const query = 'SELECT * FROM pokecenter_view;';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch pokecenters.'});
        } else {
            res.json(results);
        }
    });
});

// API endpoint to fetch gym view
app.get('/api/routes', (req, res) => {
    const query = 'SELECT * FROM route_view;';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch routes.'});
        } else {
            res.json(results);
        }
    });
});

app.get('/api/pokeinfo/typeinfo', (req, res) => {
    const query = 'select type as typeName, count(*) as count from pokemon group by type';
    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Failed to fetch pokemon types.' });
        } else {
            res.json(results);
        }
    });
});

app.get('/api/strongWeakAgainst/:type', (req, res) => {
    const pokemonType = req.params.type;

    const query = `
        SELECT 
            pt.name AS type_name,
            strong.name AS strong_against,
            weak.name AS weak_against
        FROM 
            PokemonType pt
        LEFT JOIN 
            PokemonType strong ON pt.strongAgainst = strong.id
        LEFT JOIN 
            PokemonType weak ON pt.weakAgainst = weak.id
        WHERE pt.name = ?`;

    db.query(query, [pokemonType], (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send('Server error');
        } else {
            res.json(results);
        }
    });
});

// API endpoint to delete an item by ID
app.delete('/api/items/:id', (req, res) => {
    const itemId = req.params.id;

    // SQL query to delete the item by ID
    const query = 'DELETE FROM Item WHERE id = ?';

    db.query(query, [itemId], (err, result) => {
        if (err) {
            console.error('Error deleting item:', err);
            return res.status(500).json({ error: 'Failed to delete item.' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Item not found.' });
        }

        res.status(200).json({ message: `Item with ID ${itemId} has been deleted.` });
    });
});

// API endpoint to delete a badge by ID
app.delete('/api/badges/:id', (req, res) => {
    const badgeId = req.params.id;

    // SQL query to delete the badge by ID
    const query = 'DELETE FROM Badge WHERE id = ?';

    db.query(query, [badgeId], (err, result) => {
        if (err) {
            console.error('Error deleting badge:', err);
            return res.status(500).json({ error: 'Failed to delete badge.' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ message: 'Badge not found.' });
        }

        res.status(200).json({ message: `Badge with ID ${badgeId} has been deleted.` });
    });
});


// API route to run custom queries
app.post("/query", (req, res) => {
    const userQuery = req.body.query;
  
    db.query(userQuery, (error, results, fields) => {
      if (error) {
        return res.status(500).json({ error: error.message });
      }
  
      if (userQuery.trim().toUpperCase().startsWith("SELECT")) {
        const columns = fields.map((field) => field.name);
        res.json({ results, columns });
      } else {
        res.json({ message: "Query executed successfully!" });
      }
    });
});

// API endpoint to increment Pokémon speed
app.post('/api/increment', (req, res) => {
    const { id, attribute, increment } = req.body;  // Now include id and attribute

    // Validate input
    if (!id || !attribute || !increment || isNaN(increment)) {
        return res.status(400).json({ error: 'Please provide a valid id, attribute, and increment value.' });
    }

    // Execute the stored procedure to update the Pokémon stat
    const query = `CALL increasePokeStat(?, ?, ?)`;

    // Pass id, attribute, and increment to the stored procedure
    db.query(query, [id, attribute, increment], (err, results) => {
        if (err) {
            console.error('Error updating stat:', err);
            return res.status(500).json({ error: 'Failed to update Pokémon stat.' });
        }

        // Return the success message from the stored procedure
        res.json({ message: results[0][0].Message });
    });
});

app.post('/api/decrement', (req, res) => {
    const { id, attribute, decrement } = req.body;  // Now include id and attribute

    // Validate input
    if (!id || !attribute || !decrement || isNaN(decrement)) {
        return res.status(400).json({ error: 'Please provide a valid id, attribute, and decrement value.' });
    }

    // Execute the stored procedure to update the Pokémon stat
    const query = `CALL decreasePokeStat(?, ?, ?)`;

    // Pass id, attribute, and increment to the stored procedure
    db.query(query, [id, attribute, decrement], (err, results) => {
        if (err) {
            console.error('Error updating stat:', err);
            return res.status(500).json({ error: 'Failed to update Pokémon stat.' });
        }

        // Return the success message from the stored procedure
        res.json({ message: results[0][0].Message });
    });
});

// Start server
app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});