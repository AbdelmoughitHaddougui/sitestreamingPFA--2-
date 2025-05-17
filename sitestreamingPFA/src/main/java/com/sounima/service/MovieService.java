package com.sounima.service;

import com.sounima.model.Movie;
import com.sounima.model.User;
import com.sounima.repository.MovieRepository;
import com.sounima.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Movie> getFeaturedMovies() {
        // Retourne les films en vedette (par exemple, les plus récents avec les meilleures notes)
        return movieRepository.findTop10ByOrderByRatingDesc();
    }

    public List<Movie> getLatestMovies() {
        // Retourne les derniers films ajoutés
        return movieRepository.findTop10ByOrderByReleaseYearDesc();
    }

    public List<Movie> getPopularMovies() {
        // Retourne les films les plus populaires
        return movieRepository.findTop10ByOrderByRatingDesc();
    }

    public Movie getMovieById(Long id) {
        return movieRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Film non trouvé"));
    }

    public List<Movie> searchMovies(String query) {
        return movieRepository.findByTitleContainingIgnoreCase(query);
    }

    public List<Movie> getMoviesByGenre(Long genreId) {
        return movieRepository.findByGenresId(genreId);
    }

    public List<Movie> getRelatedMovies(Movie movie) {
        List<Movie> related = movie.getGenres().stream()
            .flatMap(genre -> movieRepository.findByGenresId(genre.getId()).stream())
            .filter(relatedMovie -> !relatedMovie.getId().equals(movie.getId()))
            .distinct()
            .limit(6)
            .collect(Collectors.toList());

        // Si aucun film similaire trouvé, proposer les films les mieux notés (hors film courant)
        if (related.isEmpty()) {
            related = movieRepository.findTop10ByOrderByRatingDesc().stream()
                .filter(m -> !m.getId().equals(movie.getId()))
                .limit(6)
                .collect(Collectors.toList());
        }
        return related;
    }

    public List<Movie> getAllMovies() {
        return movieRepository.findAll();
    }

    public void addMovieToFavorites(User user, Long movieId) {
        Movie movie = getMovieById(movieId);
        user.getFavoriteMovies().add(movie);
        userRepository.save(user);
    }

    public void addMovieToWatchlist(User user, Long movieId) {
        Movie movie = getMovieById(movieId);
        user.getWatchlistMovies().add(movie);
        userRepository.save(user);
    }

    public void removeMovieFromFavorites(User user, Long movieId) {
        Movie movie = getMovieById(movieId);
        user.getFavoriteMovies().remove(movie);
        userRepository.save(user);
    }

    public void removeMovieFromWatchlist(User user, Long movieId) {
        Movie movie = getMovieById(movieId);
        user.getWatchlistMovies().remove(movie);
        userRepository.save(user);
    }

    @Transactional
    public Movie saveMovie(Movie movie) {
        return movieRepository.save(movie);
    }
} 