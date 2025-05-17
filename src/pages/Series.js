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

function Series() {
  const [rows, setRows] = useState([]);
  const [open, setOpen] = useState(false);
  const [selectedSeries, setSelectedSeries] = useState(null);
  const [formData, setFormData] = useState({});

  const fetchSeries = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/series`);
      setRows(response.data);
    } catch (error) {
      console.error('Error fetching series:', error);
      // Handle error
    }
  };

  useEffect(() => {
    fetchSeries();
  }, []);

  const handleClickOpen = () => {
    setSelectedSeries(null);
    setFormData({});
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedSeries(null);
    setFormData({});
  };

  const handleInputChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSave = async () => {
    try {
      if (selectedSeries) {
        // Edit series
        await axios.put(`${API_BASE_URL}/series/${selectedSeries.id}`, formData);
        console.log('Series updated successfully!');
      } else {
        // Add new series
        await axios.post(`${API_BASE_URL}/series`, formData);
        console.log('Series added successfully!');
      }
      fetchSeries(); // Refresh the list
      handleClose();
    } catch (error) {
      console.error('Error saving series:', error);
      // Handle error
    }
  };

  const handleEditClick = (series) => {
    setSelectedSeries(series);
    setFormData(series);
    setOpen(true);
  };

  const handleDeleteClick = async (seriesId) => {
    if (window.confirm('Are you sure you want to delete this series?')) {
      try {
        await axios.delete(`${API_BASE_URL}/series/${seriesId}`);
        console.log('Series deleted successfully!');
        fetchSeries(); // Refresh the list
      } catch (error) {
        console.error('Error deleting series:', error);
        // Handle error
      }
    }
  };

  const columns = [
    { field: 'id', headerName: 'ID', width: 90 },
    { field: 'title', headerName: 'Title', width: 200 },
    { field: 'director', headerName: 'Director', width: 150 },
    { field: 'release_year', headerName: 'Year', width: 100, type: 'number' },
    { field: 'number_of_seasons', headerName: 'Seasons', width: 100, type: 'number' },
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
        <Typography variant="h4">TV Series</Typography>
        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={handleClickOpen}
        >
          Add Series
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
          getRowHeight={() => 100}
          sx={{
            '& .MuiDataGrid-root': {
              border: 'none',
            },
            '& .MuiDataGrid-cell': {
              borderColor: 'rgba(255, 255, 255, 0.1)',
            },
            '& .MuiDataGrid-columnHeaders': {
              backgroundColor: '#1f1f1f',
              color: '#f5f5f1',
              borderColor: 'rgba(255, 255, 255, 0.1)',
            },
            '& .MuiDataGrid-row': {
              '&:nth-of-type(odd)': {
                backgroundColor: '#1a1a1a',
              },
              '&:hover': {
                backgroundColor: '#2a2a2a',
              },
            },
            '& .MuiTablePagination-root': {
              color: 'rgba(255, 255, 255, 0.7)',
            },
            '& .MuiSvgIcon-root': {
              color: 'rgba(255, 255, 255, 0.7)',
            },
            '& .MuiCheckbox-root': {
              color: 'rgba(255, 255, 255, 0.7) !important',
            },
          }}
        />
      </div>

      <Dialog open={open} onClose={handleClose}>
        <DialogTitle>
          {selectedSeries ? 'Edit Series' : 'Add New Series'}
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
            name="number_of_seasons"
            label="Number of Seasons"
            type="number"
            fullWidth
            variant="outlined"
            value={formData.number_of_seasons || ''}
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
            {selectedSeries ? 'Save Changes' : 'Add Series'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

export default Series; 