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

// Get all genres
router.get('/', async (req, res) => {
  try {
    const [rows] = await dbPool.query('SELECT * FROM genres');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching genres:', error);
    res.status(500).json({ message: 'Error fetching genres', error: error.message });
  }
});

// Get a single genre by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await dbPool.query('SELECT * FROM genres WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'Genre not found' });
    }
    res.json(rows[0]);
  } catch (error) {
    console.error('Error fetching genre:', error);
    res.status(500).json({ message: 'Error fetching genre', error: error.message });
  }
});

// Add a new genre
router.post('/', async (req, res) => {
  const { name, description } = req.body;
  try {
    const [result] = await dbPool.query(
      'INSERT INTO genres (name, description) VALUES (?, ?)',
      [name, description]
    );
    res.status(201).json({ message: 'Genre added successfully', id: result.insertId });
  } catch (error) {
    console.error('Error adding genre:', error);
    res.status(500).json({ message: 'Error adding genre', error: error.message });
  }
});

// Update a genre by ID
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { name, description } = req.body;
  try {
    const [result] = await dbPool.query(
      'UPDATE genres SET name = ?, description = ? WHERE id = ?',
      [name, description, id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Genre not found' });
    }
    res.json({ message: 'Genre updated successfully' });
  } catch (error) {
    console.error('Error updating genre:', error);
    res.status(500).json({ message: 'Error updating genre', error: error.message });
  }
});

// Delete a genre by ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await dbPool.query('DELETE FROM genres WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Genre not found' });
    }
    res.json({ message: 'Genre deleted successfully' });
  } catch (error) {
    console.error('Error deleting genre:', error);
    res.status(500).json({ message: 'Error deleting genre', error: error.message });
  }
});

module.exports = router; 