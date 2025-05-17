import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';
import Layout from './components/Layout';
import Dashboard from './pages/Dashboard';
import Movies from './pages/Movies';
import Series from './pages/Series';
import Actors from './pages/Actors';
import Genres from './pages/Genres';
import Users from './pages/Users';

const theme = createTheme({
  palette: {
    mode: 'dark',
    background: {
      default: '#141414', // Dark background color inspired by Netflix
      paper: '#1f1f1f', // Slightly lighter dark for paper/card elements
    },
    primary: {
      main: '#e50914', // Netflix red
    },
    secondary: {
      main: '#f5f5f1', // Off-white or light gray for secondary elements
    },
  },
  typography: {
    fontFamily: 'Roboto, sans-serif', // Or a font closer to Netflix sans
    h4: {
      color: '#f5f5f1', // Ensure headings are readable on dark background
    },
    // Add more typography customizations as needed
  },
  components: {
    MuiAppBar: {
      styleOverrides: {
        root: {
          backgroundColor: '#141414', // Dark AppBar
        },
      },
    },
    MuiDrawer: {
      styleOverrides: {
        paper: {
          backgroundColor: '#1f1f1f', // Dark Drawer
        },
      },
    },
    MuiButton: {
      styleOverrides: {
        containedPrimary: {
          backgroundColor: '#e50914', // Red buttons
          '&:hover': {
            backgroundColor: '#f40612', // Darker red on hover
          },
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          backgroundColor: '#1f1f1f', // Dark paper backgrounds
        },
      },
    },
    MuiTextField: {
      styleOverrides: {
        root: {
          // Customize text field styles for dark theme
          '.MuiInputLabel-root': { color: 'rgba(255, 255, 255, 0.7)' },
          '.MuiOutlinedInput-notchedOutline': { borderColor: 'rgba(255, 255, 255, 0.2)' },
          '&:hover .MuiOutlinedInput-notchedOutline': { borderColor: 'rgba(255, 255, 255, 0.5)' },
          '.MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline': { borderColor: '#e50914' },
          '.MuiInputBase-input': { color: '#f5f5f1' },
        },
      },
    },
    MuiDataGrid: {
        styleOverrides: {
            root: {
                '.MuiDataGrid-columnHeaders': {
                    backgroundColor: '#1f1f1f', // Darker headers
                    color: '#f5f5f1', // Light text
                },
                '.MuiDataGrid-cell': {
                    color: 'rgba(255, 255, 255, 0.8)', // Lighter text for cells
                },
                '.MuiTablePagination-root': {
                    color: 'rgba(255, 255, 255, 0.7)', // Lighter text for pagination
                },
                '.MuiSvgIcon-root': {
                    color: 'rgba(255, 255, 255, 0.7)', // Lighter icons
                },
                '.MuiCheckbox-root': {
                     color: 'rgba(255, 255, 255, 0.7) !important', // Lighter checkboxes
                },
            },
        },
    },
    MuiDialog: {
        styleOverrides: {
            paper: {
                backgroundColor: '#1f1f1f', // Dark dialog background
                color: '#f5f5f1', // Light text in dialog
            },
        },
    },
    MuiDialogTitle: {
        styleOverrides: {
            root: {
                color: '#f5f5f1', // Light dialog title
            },
        },
    },
  },
});

function App() {
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Router>
        <Layout>
          <Routes>
            <Route path="/" element={<Dashboard />} />
            <Route path="/movies" element={<Movies />} />
            <Route path="/series" element={<Series />} />
            <Route path="/actors" element={<Actors />} />
            <Route path="/genres" element={<Genres />} />
            <Route path="/users" element={<Users />} />
          </Routes>
        </Layout>
      </Router>
    </ThemeProvider>
  );
}

export default App; 