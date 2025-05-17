import React, { useState, useEffect } from 'react';
import {
  Box,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  Typography,
  IconButton,
} from '@mui/material';
import { DataGrid } from '@mui/x-data-grid';
import { Add as AddIcon, Delete as DeleteIcon, Edit as EditIcon } from '@mui/icons-material';
import axios from 'axios';

const API_BASE_URL = process.env.REACT_APP_API_BASE_URL || 'http://localhost:5000/api';

function Movies() {
  const [rows, setRows] = useState([]);
  const [open, setOpen] = useState(false);
  const [selectedMovie, setSelectedMovie] = useState(null);
  const [formData, setFormData] = useState({});

  const fetchMovies = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/movies`);
      setRows(response.data);
    } catch (error) {
      console.error('Error fetching movies:', error);
      // Handle error, maybe show a message to the user
    }
  };

  useEffect(() => {
    fetchMovies();
  }, []); // Fetch movies on component mount

  const handleClickOpen = () => {
    setSelectedMovie(null); // Clear selected movie for add operation
    setFormData({}); // Clear form data
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedMovie(null);
    setFormData({});
  };

  const handleInputChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSave = async () => {
    try {
      if (selectedMovie) {
        // Edit movie
        await axios.put(`${API_BASE_URL}/movies/${selectedMovie.id}`, formData);
        console.log('Movie updated successfully!');
      } else {
        // Add new movie
        await axios.post(`${API_BASE_URL}/movies`, formData);
        console.log('Movie added successfully!');
      }
      fetchMovies(); // Refresh the list after saving
      handleClose();
    } catch (error) {
      console.error('Error saving movie:', error);
      // Handle error, maybe show a message to the user
    }
  };

  const handleEditClick = (movie) => {
    setSelectedMovie(movie);
    setFormData(movie); // Populate form with movie data
    setOpen(true);
  };

  const handleDeleteClick = async (movieId) => {
    if (window.confirm('Are you sure you want to delete this movie?')) {
      try {
        await axios.delete(`${API_BASE_URL}/movies/${movieId}`);
        console.log('Movie deleted successfully!');
        fetchMovies(); // Refresh the list after deletion
      } catch (error) {
        console.error('Error deleting movie:', error);
        // Handle error
      }
    }
  };

  const columns = [
    { field: 'id', headerName: 'ID', width: 90 },
    { field: 'title', headerName: 'Title', width: 200 },
    { field: 'director', headerName: 'Director', width: 150 },
    { field: 'release_year', headerName: 'Year', width: 100, type: 'number' },
    { field: 'duration', headerName: 'Duration', width: 100, type: 'number' },
    { field: 'rating', headerName: 'Rating', width: 100, type: 'number' },
    {
      field: 'poster_url',
      headerName: 'Poster',
      width: 150,
      renderCell: (params) => (
        params.value ? (
          <img
            src={params.value}
            alt={params.row.title}
            style={{ height: '100%', width: 'auto', objectFit: 'contain' }}
          />
        ) : null
      ),
    },
    {
      field: 'description',
      headerName: 'Description',
      width: 300,
    },
    {
      field: 'actions',
      headerName: 'Actions',
      width: 120,
      sortable: false,
      renderCell: (params) => (
        <>
          <IconButton color="primary" size="small" onClick={() => handleEditClick(params.row)}>
            <EditIcon />
          </IconButton>
          <IconButton color="secondary" size="small" onClick={() => handleDeleteClick(params.row.id)}>
            <DeleteIcon />
          </IconButton>
        </>
      ),
    },
  ];

  return (
    <Box>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 2 }}>
        <Typography variant="h4">Movies</Typography>
        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={handleClickOpen}
        >
          Add Movie
        </Button>
      </Box>

      <div style={{ height: 600, width: '100%' }}>
        <DataGrid
          rows={rows}
          columns={columns}
          pageSize={10}
          rowsPerPageOptions={[10]}
          checkboxSelection
          disableRowSelectionOnClick
          getRowHeight={() => 100} // Increase row height for posters
          sx={{
            // Custom styles for DataGrid
            '& .MuiDataGrid-root': {
              border: 'none', // Remove default border
            },
            '& .MuiDataGrid-cell': {
              borderColor: 'rgba(255, 255, 255, 0.1)', // Lighter border for cells
            },
            '& .MuiDataGrid-columnHeaders': {
              backgroundColor: '#1f1f1f', // Darker header background
              color: '#f5f5f1', // Light header text
              borderColor: 'rgba(255, 255, 255, 0.1)', // Lighter header border
            },
            '& .MuiDataGrid-row': {
              '&:nth-of-type(odd)': {
                backgroundColor: '#1a1a1a', // Alternate row color for readability
              },
              '&:hover': {
                backgroundColor: '#2a2a2a', // Darker background on hover
              },
            },
            '& .MuiTablePagination-root': {
              color: 'rgba(255, 255, 255, 0.7)', // Lighter pagination text
            },
            '& .MuiSvgIcon-root': {
              color: 'rgba(255, 255, 255, 0.7)', // Lighter icons
            },
            '& .MuiCheckbox-root': {
              color: 'rgba(255, 255, 255, 0.7) !important', // Lighter checkboxes
            },
          }}
          // onRowClick removed to avoid opening edit dialog when clicking delete
        />
      </div>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>
          {selectedMovie ? 'Edit Movie' : 'Add New Movie'}
        </DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            name="title"
            label="Title"
            fullWidth
            variant="outlined"
            value={formData.title || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="director"
            label="Director"
            fullWidth
            variant="outlined"
            value={formData.director || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="release_year"
            label="Release Year"
            type="number"
            fullWidth
            variant="outlined"
            value={formData.release_year || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="duration"
            label="Duration"
            type="number"
            fullWidth
            variant="outlined"
            value={formData.duration || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="rating"
            label="Rating"
            type="number"
            fullWidth
            variant="outlined"
            value={formData.rating || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="poster_url"
            label="Poster URL"
            fullWidth
            variant="outlined"
            value={formData.poster_url || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="description"
            label="Description"
            fullWidth
            multiline
            rows={4}
            variant="outlined"
            value={formData.description || ''}
            onChange={handleInputChange}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={handleSave} variant="contained">
            {selectedMovie ? 'Save Changes' : 'Add Movie'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

export default Movies; 