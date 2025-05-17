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

function Genres() {
  const [rows, setRows] = useState([]);
  const [open, setOpen] = useState(false);
  const [selectedGenre, setSelectedGenre] = useState(null);
  const [formData, setFormData] = useState({});

  const fetchGenres = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/genres`);
      setRows(response.data);
    } catch (error) {
      console.error('Error fetching genres:', error);
      // Handle error
    }
  };

  useEffect(() => {
    fetchGenres();
  }, []);

  const handleClickOpen = () => {
    setSelectedGenre(null);
    setFormData({});
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedGenre(null);
    setFormData({});
  };

  const handleInputChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSave = async () => {
    try {
      if (selectedGenre) {
        // Edit genre
        await axios.put(`${API_BASE_URL}/genres/${selectedGenre.id}`, formData);
        console.log('Genre updated successfully!');
      } else {
        // Add new genre
        await axios.post(`${API_BASE_URL}/genres`, formData);
        console.log('Genre added successfully!');
      }
      fetchGenres(); // Refresh the list
      handleClose();
    } catch (error) {
      console.error('Error saving genre:', error);
      // Handle error
    }
  };

  const handleEditClick = (genre) => {
    setSelectedGenre(genre);
    setFormData(genre);
    setOpen(true);
  };

  const handleDeleteClick = async (genreId) => {
    if (window.confirm('Are you sure you want to delete this genre?')) {
      try {
        await axios.delete(`${API_BASE_URL}/genres/${genreId}`);
        console.log('Genre deleted successfully!');
        fetchGenres(); // Refresh the list
      } catch (error) {
        console.error('Error deleting genre:', error);
        // Handle error
      }
    }
  };

  const columns = [
    { field: 'id', headerName: 'ID', width: 90 },
    { field: 'name', headerName: 'Name', width: 200 },
    {
      field: 'description',
      headerName: 'Description',
      width: 400,
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
        <Typography variant="h4">Genres</Typography>
        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={handleClickOpen}
        >
          Add Genre
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
          // onRowClick removed
        />
      </div>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>
          {selectedGenre ? 'Edit Genre' : 'Add New Genre'}
        </DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            name="name"
            label="Name"
            fullWidth
            variant="outlined"
            value={formData.name || ''}
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
            {selectedGenre ? 'Save Changes' : 'Add Genre'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

export default Genres; 