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
  Switch,
  FormControlLabel,
  IconButton,
} from '@mui/material';
import { DataGrid } from '@mui/x-data-grid';
import { Add as AddIcon, Delete as DeleteIcon, Edit as EditIcon } from '@mui/icons-material';
import axios from 'axios';

const API_BASE_URL = process.env.REACT_APP_API_BASE_URL || 'http://localhost:5000/api';

function Users() {
  const [rows, setRows] = useState([]);
  const [open, setOpen] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);
  const [formData, setFormData] = useState({});

  const fetchUsers = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/users`);
      setRows(response.data);
    } catch (error) {
      console.error('Error fetching users:', error);
      // Handle error
    }
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  const handleClickOpen = () => {
    setSelectedUser(null);
    setFormData({});
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    setSelectedUser(null);
    setFormData({});
  };

  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    setFormData({ ...formData, [name]: type === 'checkbox' ? checked : value });
  };

  const handleSave = async () => {
    try {
      if (selectedUser) {
        // Edit user
        await axios.put(`${API_BASE_URL}/users/${selectedUser.id}`, formData);
        console.log('User updated successfully!');
      } else {
        // Add new user
        await axios.post(`${API_BASE_URL}/users`, formData);
        console.log('User added successfully!');
      }
      fetchUsers(); // Refresh the list
      handleClose();
    } catch (error) {
      console.error('Error saving user:', error);
      // Handle error
    }
  };

  const handleEditClick = (user) => {
    setSelectedUser(user);
    setFormData(user);
    setOpen(true);
  };

  const handleDeleteClick = async (userId) => {
    if (window.confirm('Are you sure you want to delete this user?')) {
      try {
        await axios.delete(`${API_BASE_URL}/users/${userId}`);
        console.log('User deleted successfully!');
        fetchUsers(); // Refresh the list
      } catch (error) {
        console.error('Error deleting user:', error);
        // Handle error
      }
    }
  };

  const columns = [
    { field: 'id', headerName: 'ID', width: 90 },
    { field: 'username', headerName: 'Username', width: 150 },
    { field: 'email', headerName: 'Email', width: 250 },
    {
      field: 'is_admin',
      headerName: 'Admin',
      width: 100,
      type: 'boolean',
    },
    {
      field: 'profile_picture',
      headerName: 'Profile Picture',
      width: 100,
      renderCell: (params) => (
        params.value ? (
          <img
            src={params.value}
            alt={params.row.username}
            style={{ width: 40, height: 40, objectFit: 'cover', borderRadius: '50%' }}
          />
        ) : null
      ),
    },
    {
      field: 'bio',
      headerName: 'Bio',
      width: 300,
    },
    {
      field: 'created_at',
      headerName: 'Created At',
      width: 200,
      valueFormatter: (params) => {
        return new Date(params.value).toLocaleString();
      },
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
        <Typography variant="h4">Users</Typography>
        <Button
          variant="contained"
          startIcon={<AddIcon />}
          onClick={handleClickOpen}
        >
          Add User
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
          getRowHeight={() => 60} // Adjust row height for profile pictures
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
          {selectedUser ? 'Edit User' : 'Add New User'}
        </DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            name="username"
            label="Username"
            fullWidth
            variant="outlined"
            value={formData.username || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="email"
            label="Email"
            type="email"
            fullWidth
            variant="outlined"
            value={formData.email || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="password"
            label="Password"
            type="password"
            fullWidth
            variant="outlined"
            value={formData.password || ''} // Note: Password should ideally not be pre-filled for security
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="profile_picture"
            label="Profile Picture URL"
            fullWidth
            variant="outlined"
            value={formData.profile_picture || ''}
            onChange={handleInputChange}
          />
          <TextField
            margin="dense"
            name="bio"
            label="Bio"
            fullWidth
            multiline
            rows={4}
            variant="outlined"
            value={formData.bio || ''}
            onChange={handleInputChange}
          />
          <FormControlLabel
            control={
              <Switch
                name="is_admin"
                checked={!!formData.is_admin}
                onChange={handleInputChange}
                color="primary"
              />
            }
            label="Admin"
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={handleClose}>Cancel</Button>
          <Button onClick={handleSave} variant="contained">
            {selectedUser ? 'Save Changes' : 'Add User'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
}

export default Users; 