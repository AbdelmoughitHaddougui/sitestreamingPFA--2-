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

// Get all actors
router.get('/', async (req, res) => {
  try {
    const [rows] = await dbPool.query('SELECT * FROM actors');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching actors:', error);
    res.status(500).json({ message: 'Error fetching actors', error: error.message });
  }
});

// Get a single actor by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await dbPool.query('SELECT * FROM actors WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Actor not found' });
    }
    res.json(rows[0]);
  } catch (error) {
    console.error('Error fetching actor:', error);
    res.status(500).json({ message: 'Error fetching actor', error: error.message });
  }
});

// Add a new actor
router.post('/', async (req, res) => {
  const { name, photo_url, biography } = req.body;
  try {
    const [result] = await dbPool.query(
      'INSERT INTO actors (name, photo_url, biography) VALUES (?, ?, ?)',
      [name, photo_url, biography]
    );
    res.status(201).json({ message: 'Actor added successfully', id: result.insertId });
  } catch (error) {
    console.error('Error adding actor:', error);
    res.status(500).json({ message: 'Error adding actor', error: error.message });
  }
});

// Update an actor by ID
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { name, photo_url, biography } = req.body;
  try {
    const [result] = await dbPool.query(
      'UPDATE actors SET name = ?, photo_url = ?, biography = ? WHERE id = ?',
      [name, photo_url, biography, id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Actor not found' });
    }
    res.json({ message: 'Actor updated successfully' });
  } catch (error) {
    console.error('Error updating actor:', error);
    res.status(500).json({ message: 'Error updating actor', error: error.message });
  }
});

// Delete an actor by ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await dbPool.query('DELETE FROM actors WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Actor not found' });
    }
    res.json({ message: 'Actor deleted successfully' });
  } catch (error) {
    console.error('Error deleting actor:', error);
    res.status(500).json({ message: 'Error deleting actor', error: error.message });
  }
});

module.exports = router; 