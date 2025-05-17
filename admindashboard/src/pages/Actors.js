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

function Actors() {
  const [rows, setRows] = useState([]);
  const [open, setOpen] = useState(false);
  const [selectedActor, setSelectedActor] = useState(null);
  const [formData, setFormData] = useState({});

  const fetchActors = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/actors`);
      setRows(response.data);
    } catch (error) {
      console.error('Error fetching actors:', error);
      // Handle error
    }
  };

  useEffect(() => {
    fetchActors();
  }, []);

  const handleClickOpen = () => {
    setSelectedActor(null);
    setFormData({});
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedActor(null);
    setFormData({});
  };

  const handleInputChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSave = async () => {
    try {
      if (selectedActor) {
        // Edit actor
        await axios.put(`${API_BASE_URL}/actors/${selectedActor.id}`, formData);
        console.log('Actor updated successfully!');
      } else {
        // Add new actor
        await axios.post(`${API_BASE_URL}/actors`, formData);
        console.log('Actor added successfully!');
      }
      fetchActors(); // Refresh the list
      handleClose();
    } catch (error) {
      console.error('Error saving actor:', error);
      // Handle error
    }
  };

  const handleEditClick = (actor) => {
    setSelectedActor(actor);
    setFormData(actor);
    setOpen(true);
  };

  const handleDeleteClick = async (actorId) => {
    if (window.confirm('Are you sure you want to delete this actor?')) {
      try {
        await axios.delete(`${API_BASE_URL}/actors/${actorId}`);
        console.log('Actor deleted successfully!');
        fetchActors(); // Refresh the list
      } catch (error) {
        console.error('Error deleting actor:', error);
        // Handle error
      }
    }
  };

  const columns = [
    { field: 'id', headerName: 'ID', width: 90 },
    { field: 'name', headerName: 'Name', width: 200 },
    {
      field: 'photo_url',
      headerName: 'Photo',
      width: 100,
      renderCell: (params) => (
        params.value ? (
          <img
            src={params.value}
            alt={params.row.name}
            style={{ width: 50, height: 50, objectFit: 'cover', borderRadius: '50%' }}
          />
        ) : null
      ),
    },
    {
      field: 'biography',
      headerName: 'Biography',
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
        <Typography variant="h4">Actors</Typography>
        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={handleClickOpen}
        >
          Add Actor
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
          getRowHeight={() => 60} // Adjust row height for actor photos
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
          {selectedActor ? 'Edit Actor' : 'Add New Actor'}
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
            name="photo_url"
            label="Photo URL"
            fullWidth
            variant="outlined"
            value={formData.photo_url || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="biography"
            label="Biography"
            fullWidth
            multiline
            rows={4}
            variant="outlined"
            value={formData.biography || ''}
            onChange={handleInputChange}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={handleSave} variant="contained">
            {selectedActor ? 'Save Changes' : 'Add Actor'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

export default Actors; 