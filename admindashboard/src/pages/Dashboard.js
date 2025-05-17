import React from 'react';
import {
  Grid,
  Paper,
  Typography,
  Box,
} from '@mui/material';
import {
  Movie as MovieIcon,
  LiveTv as SeriesIcon,
  Person as ActorIcon,
  Category as GenreIcon,
  People as UserIcon,
} from '@mui/icons-material';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';

const StatCard = ({ title, value, icon, color }) => (
  <Paper
    sx={{
      p: 2,
      display: 'flex',
      flexDirection: 'column',
      height: 140,
      bgcolor: 'background.paper',
      border: '1px solid rgba(255, 255, 255, 0.1)',
    }}
  >
    <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
      <Typography color="text.secondary" gutterBottom>
        {title}
      </Typography>
      <Box sx={{ color: color }}>{icon}</Box>
    </Box>
    <Typography component="p" variant="h4">
      {value}
    </Typography>
  </Paper>
);

const data = [
  { name: 'Jan', movies: 4, series: 2 },
  { name: 'Feb', movies: 3, series: 1 },
  { name: 'Mar', movies: 2, series: 3 },
  { name: 'Apr', movies: 5, series: 2 },
  { name: 'May', movies: 3, series: 4 },
];

function Dashboard() {
  return (
    <Box>
      <Typography variant="h4" gutterBottom>
        Dashboard
      </Typography>
      <Grid container spacing={3}>
        <Grid item xs={12} sm={6} md={2.4}>
          <StatCard
            title="Total Movies"
            value="20"
            icon={<MovieIcon />}
            color="primary.main"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={2.4}>
          <StatCard
            title="Total Series"
            value="17"
            icon={<SeriesIcon />}
            color="secondary.main"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={2.4}>
          <StatCard
            title="Total Actors"
            value="13"
            icon={<ActorIcon />}
            color="success.main"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={2.4}>
          <StatCard
            title="Total Genres"
            value="19"
            icon={<GenreIcon />}
            color="warning.main"
          />
        </Grid>
        <Grid item xs={12} sm={6} md={2.4}>
          <StatCard
            title="Total Users"
            value="2"
            icon={<UserIcon />}
            color="error.main"
          />
        </Grid>
        <Grid item xs={12}>
          <Paper sx={{ p: 2, height: 400, border: '1px solid rgba(255, 255, 255, 0.1)' }}>
            <Typography variant="h6" gutterBottom>
              Content Overview
            </Typography>
            <ResponsiveContainer width="100%" height="100%">
              <BarChart
                data={data}
                margin={{
                  top: 20,
                  right: 30,
                  left: 20,
                  bottom: 5,
                }}
              >
                <CartesianGrid strokeDasharray="3 3" stroke="rgba(255, 255, 255, 0.1)" />
                <XAxis dataKey="name" stroke="rgba(255, 255, 255, 0.7)" />
                <YAxis stroke="rgba(255, 255, 255, 0.7)" />
                <Tooltip cursor={{ fill: 'rgba(255, 255, 255, 0.1)' }} contentStyle={{ backgroundColor: '#1f1f1f', border: 'none' }} />
                <Legend />
                <Bar dataKey="movies" fill="#e50914" />
                <Bar dataKey="series" fill="#f5f5f1" />
              </BarChart>
            </ResponsiveContainer>
          </Paper>
        </Grid>
      </Grid>
    </Box>
  );
}

export default Dashboard; 