package com.sounima.service;

import com.sounima.model.Serie;
import com.sounima.model.User;
import com.sounima.repository.SerieRepository;
import com.sounima.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SerieService {
    @Autowired
    private SerieRepository serieRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Serie> getAllSeries() {
        return serieRepository.findAll();
    }

    public List<Serie> searchSeries(String query) {
        return serieRepository.findByTitleContainingIgnoreCase(query);
    }

    public Serie getSerieById(Long id) {
        return serieRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Série non trouvée"));
    }

    public java.util.List<Serie> getSeriesByGenre(Long genreId) {
        return serieRepository.findByGenresId(genreId);
    }

    public void addSerieToFavorites(User user, Long serieId) {
        Serie serie = getSerieById(serieId);
        user.getFavoriteSeries().add(serie);
        userRepository.save(user);
    }

    public void removeSerieFromFavorites(User user, Long serieId) {
        Serie serie = getSerieById(serieId);
        user.getFavoriteSeries().remove(serie);
        userRepository.save(user);
    }

    public void removeSerieFromWatchlist(User user, Long serieId) {
        Serie serie = getSerieById(serieId);
        user.getWatchlistSeries().remove(serie);
        userRepository.save(user);
    }

    public void addSerieToWatchlist(User user, Long serieId) {
        Serie serie = getSerieById(serieId);
        user.getWatchlistSeries().add(serie);
        userRepository.save(user);
    }
} 