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

// Get all users
router.get('/', async (req, res) => {
  try {
    const [rows] = await dbPool.query('SELECT id, username, email, is_admin, profile_picture, bio, created_at FROM users'); // Exclude password
    res.json(rows);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ message: 'Error fetching users', error: error.message });
  }
});

// Get a single user by ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await dbPool.query('SELECT id, username, email, is_admin, profile_picture, bio, created_at FROM users WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json(rows[0]);
  } catch (error) {
    console.error('Error fetching user:', error);
    res.status(500).json({ message: 'Error fetching user', error: error.message });
  }
});

// Add a new user
router.post('/', async (req, res) => {
  const { username, email, password, is_admin, profile_picture, bio } = req.body;
  try {
    // In a real application, you would hash the password before storing it
    const [result] = await dbPool.query(
      'INSERT INTO users (username, email, password, is_admin, profile_picture, bio) VALUES (?, ?, ?, ?, ?, ?)',
      [username, email, password, is_admin, profile_picture, bio]
    );
    res.status(201).json({ message: 'User added successfully', id: result.insertId });
  } catch (error) {
    console.error('Error adding user:', error);
    res.status(500).json({ message: 'Error adding user', error: error.message });
  }
});

// Update a user by ID
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { username, email, password, is_admin, profile_picture, bio } = req.body;
  const updateFields = [];
  const values = [];

  if (username !== undefined) { updateFields.push('username = ?'); values.push(username); }
  if (email !== undefined) { updateFields.push('email = ?'); values.push(email); }
  if (password !== undefined) { 
    // In a real application, you would hash the password before storing it
    updateFields.push('password = ?'); values.push(password); 
  }
  if (is_admin !== undefined) { updateFields.push('is_admin = ?'); values.push(is_admin); }
  if (profile_picture !== undefined) { updateFields.push('profile_picture = ?'); values.push(profile_picture); }
  if (bio !== undefined) { updateFields.push('bio = ?'); values.push(bio); }

  if (updateFields.length === 0) {
    return res.status(400).json({ message: 'No fields to update' });
  }

  values.push(id);

  try {
    const [result] = await dbPool.query(
      `UPDATE users SET ${updateFields.join(', ')} WHERE id = ?`,
      values
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json({ message: 'User updated successfully' });
  } catch (error) {
    console.error('Error updating user:', error);
    res.status(500).json({ message: 'Error updating user', error: error.message });
  }
});

// Delete a user by ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await dbPool.query('DELETE FROM users WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json({ message: 'User deleted successfully' });
  } catch (error) {
    console.error('Error deleting user:', error);
    res.status(500).json({ message: 'Error deleting user', error: error.message });
  }
});

module.exports = router; 