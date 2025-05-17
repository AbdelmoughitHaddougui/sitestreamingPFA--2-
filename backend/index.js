require('dotenv').config();
const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();
const port = process.env.BACKEND_PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Database Connection
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'sounima_db',
  connectionLimit: 10,
};

let pool;

async function connectToDatabase() {
  try {
    pool = await mysql.createPool(dbConfig);
    console.log('MySQL Pool created and connected.');
  } catch (error) {
    console.error('Database connection failed:', error);
    process.exit(1);
  }
}

connectToDatabase().then(() => {
  // Set the database pool on the app object
  app.set('dbPool', pool);

  // Import and use route files
  const moviesRouter = require('./routes/movies');
  const seriesRouter = require('./routes/series');
  const actorsRouter = require('./routes/actors');
  const genresRouter = require('./routes/genres');
  const usersRouter = require('./routes/users');

  app.use('/api/movies', moviesRouter);
  app.use('/api/series', seriesRouter);
  app.use('/api/actors', actorsRouter);
  app.use('/api/genres', genresRouter);
  app.use('/api/users', usersRouter);

  // Start the server
  app.listen(port, () => {
    console.log(`Backend server running on port ${port}`);
  });
}).catch(error => {
  console.error('Failed to start backend server:', error);
  process.exit(1);
});

// Basic route to test database connection
app.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT 1 + 1 AS solution');
    res.json({ message: 'Database connected successfully!', solution: rows[0].solution });
  } catch (error) {
    console.error('Database query error:', error);
    res.status(500).json({ message: 'Database query failed', error: error.message });
  }
}); 