const express = require('express');
const router = express.Router();

let dbPool;

router.use((req, res, next) => {
  dbPool = req.app.get('dbPool');
  if (!dbPool) {
    return res.status(500).json({ message: 'Database pool not available' });
  }
  next();
});

// Get all series
router.get('/', async (req, res) => {
  try {
    const [rows] = await dbPool.query('SELECT * FROM serie'); // Assuming table name is 'serie'
    res.json(rows);
  } catch (error) {
    console.error('Error fetching series:', error);
    res.status(500).json({ message: 'Error fetching series', error: error.message });
  }
});

// Get a single serie by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await dbPool.query('SELECT * FROM serie WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Serie not found' });
    }
    res.json(rows[0]);
  } catch (error) {
    console.error('Error fetching serie:', error);
    res.status(500).json({ message: 'Error fetching serie', error: error.message });
  }
});

// Add a new serie
router.post('/', async (req, res) => {
  const { title, director, release_year, number_of_seasons, rating, poster_url, description } = req.body;
  try {
    const [result] = await dbPool.query(
      'INSERT INTO serie (title, director, release_year, number_of_seasons, rating, poster_url, description) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [title, director, release_year, number_of_seasons, rating, poster_url, description]
    );
    res.status(201).json({ message: 'Serie added successfully', id: result.insertId });
  } catch (error) {
    console.error('Error adding serie:', error);
    res.status(500).json({ message: 'Error adding serie', error: error.message });
  }
});

// Update a serie by ID
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { title, director, release_year, number_of_seasons, rating, poster_url, description } = req.body;
  try {
    const [result] = await dbPool.query(
      'UPDATE serie SET title = ?, director = ?, release_year = ?, number_of_seasons = ?, rating = ?, poster_url = ?, description = ? WHERE id = ?',
      [title, director, release_year, number_of_seasons, rating, poster_url, description, id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Serie not found' });
    }
    res.json({ message: 'Serie updated successfully' });
  } catch (error) {
    console.error('Error updating serie:', error);
    res.status(500).json({ message: 'Error updating serie', error: error.message });
  }
});

// Delete a serie by ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await dbPool.query('DELETE FROM serie WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Serie not found' });
    }
    res.json({ message: 'Serie deleted successfully' });
  } catch (error) {
    console.error('Error deleting serie:', error);
    res.status(500).json({ message: 'Error deleting serie', error: error.message });
  }
});

module.exports = router; 