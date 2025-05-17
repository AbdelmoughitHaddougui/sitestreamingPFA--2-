package com.sounima.controller;

import com.sounima.model.Movie;
import com.sounima.service.MovieService;
import com.sounima.service.GenreService;
import com.sounima.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/movies")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @Autowired
    private GenreService genreService;

    @Autowired
    private AuthService authService;

    @GetMapping("/{id}")
    public String movieDetails(@PathVariable Long id, Model model) {
        Movie movie = movieService.getMovieById(id);
        model.addAttribute("movie", movie);
        model.addAttribute("relatedMovies", movieService.getRelatedMovies(movie));
        var user = authService.getCurrentUser();
        model.addAttribute("currentUser", user);
        return "movie-details";
    }

    @GetMapping("/{id}/watch")
    public String watchMovie(@PathVariable Long id, Model model) {
        Movie movie = movieService.getMovieById(id);
        model.addAttribute("movie", movie);
        model.addAttribute("tmdbId", movie.getTmdbId());
        return "movie-player";
    }

    @GetMapping("")
    public String listMovies(@RequestParam(value = "q", required = false) String query,
                             @RequestParam(value = "genreId", required = false) Long genreId,
                             Model model) {
        if (genreId != null) {
            model.addAttribute("movies", movieService.getMoviesByGenre(genreId));
        } else if (query != null && !query.isEmpty()) {
            model.addAttribute("movies", movieService.searchMovies(query));
        } else {
            model.addAttribute("movies", movieService.getAllMovies());
        }
        var genresWithMovies = genreService.getAllGenres().stream()
            .filter(genre -> !movieService.getMoviesByGenre(genre.getId()).isEmpty())
            .toList();
        model.addAttribute("genres", genresWithMovies);
        return "movies";
    }

    @PostMapping("/api/movies/{id}/favorite")
    public String addToFavorites(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        movieService.addMovieToFavorites(user, id);
        redirectAttributes.addFlashAttribute("success", "Film ajouté à vos favoris !");
        return "redirect:/movies/" + id;
    }

    @PostMapping("/api/movies/{id}/watchlist")
    public String addToWatchlist(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        movieService.addMovieToWatchlist(user, id);
        redirectAttributes.addFlashAttribute("success", "Film ajouté à votre liste à voir !");
        return "redirect:/movies/" + id;
    }

    @PostMapping("/api/movies/{id}/favorite/remove")
    public String removeFromFavorites(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        movieService.removeMovieFromFavorites(user, id);
        redirectAttributes.addFlashAttribute("success", "Film retiré de vos favoris !");
        return "redirect:/favorites";
    }

    @PostMapping("/api/movies/{id}/watchlist/remove")
    public String removeFromWatchlist(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        movieService.removeMovieFromWatchlist(user, id);
        redirectAttributes.addFlashAttribute("success", "Film retiré de votre liste à voir !");
        return "redirect:/watchlist";
    }

    @PostMapping("/save")
    public String saveMovie(@ModelAttribute Movie movie, RedirectAttributes redirectAttributes) {
        try {
            // Validate magnet link if provided
            if (movie.getMagnetLink() != null && !movie.getMagnetLink().isEmpty()) {
                if (!movie.getMagnetLink().startsWith("magnet:?")) {
                    redirectAttributes.addFlashAttribute("error", "Invalid magnet link format");
                    return "redirect:/movies/new";
                }
            }
            
            movieService.saveMovie(movie);
            redirectAttributes.addFlashAttribute("success", "Movie saved successfully!");
            return "redirect:/movies";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error saving movie: " + e.getMessage());
            return "redirect:/movies/new";
        }
    }
} 