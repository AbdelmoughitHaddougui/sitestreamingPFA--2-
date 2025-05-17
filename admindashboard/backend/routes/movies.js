const express = require('express');
const router = express.Router();

// This pool will be passed from the main server file
let dbPool;

// Middleware to set the database pool
router.use((req, res, next) => {
  dbPool = req.app.get('dbPool');
  if (!dbPool) {
    return res.status(500).json({ message: 'Database pool not available' });
  }
  next();
});

// Get all movies
router.get('/', async (req, res) => {
  try {
    const [rows] = await dbPool.query('SELECT * FROM movies');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching movies:', error);
    res.status(500).json({ message: 'Error fetching movies', error: error.message });
  }
});

// Get a single movie by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await dbPool.query('SELECT * FROM movies WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Movie not found' });
    }
    res.json(rows[0]);
  } catch (error) {
    console.error('Error fetching movie:', error);
    res.status(500).json({ message: 'Error fetching movie', error: error.message });
  }
});

// Add a new movie
router.post('/', async (req, res) => {
  const { title, director, release_year, duration, rating, poster_url, description } = req.body;
  try {
    const [result] = await dbPool.query(
      'INSERT INTO movies (title, director, release_year, duration, rating, poster_url, description) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [title, director, release_year, duration, rating, poster_url, description]
    );
    res.status(201).json({ message: 'Movie added successfully', id: result.insertId });
  } catch (error) {
    console.error('Error adding movie:', error);
    res.status(500).json({ message: 'Error adding movie', error: error.message });
  }
});

// Update a movie by ID
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { title, director, release_year, duration, rating, poster_url, description } = req.body;
  try {
    const [result] = await dbPool.query(
      'UPDATE movies SET title = ?, director = ?, release_year = ?, duration = ?, rating = ?, poster_url = ?, description = ? WHERE id = ?',
      [title, director, release_year, duration, rating, poster_url, description, id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Movie not found' });
    }
    res.json({ message: 'Movie updated successfully' });
  } catch (error) {
    console.error('Error updating movie:', error);
    res.status(500).json({ message: 'Error updating movie', error: error.message });
  }
});

// Delete a movie by ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await dbPool.query('DELETE FROM movies WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Movie not found' });
    }
    res.json({ message: 'Movie deleted successfully' });
  } catch (error) {
    console.error('Error deleting movie:', error);
    res.status(500).json({ message: 'Error deleting movie', error: error.message });
  }
});

module.exports = router; 