package com.sounima.controller;

import com.sounima.service.GenreService;
import com.sounima.service.MovieService;
import com.sounima.service.SerieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/genres")
public class GenreController {
    @Autowired
    private GenreService genreService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private SerieService serieService;

    @GetMapping("")
    public String listGenres(@RequestParam(value = "q", required = false) String query, Model model) {
        List<com.sounima.model.Genre> allGenres = (query != null && !query.isEmpty())
            ? genreService.searchGenres(query)
            : genreService.getAllGenres();

        // Filtrer les genres qui ont au moins un film ou une série
        List<com.sounima.model.Genre> genresWithContent = allGenres.stream()
            .filter(genre ->
                !movieService.getMoviesByGenre(genre.getId()).isEmpty() ||
                !serieService.getSeriesByGenre(genre.getId()).isEmpty()
            )
            .toList();

        model.addAttribute("genres", genresWithContent);
        return "genres";
    }

    @GetMapping("/{id}")
    public String genreDetails(@PathVariable Long id, Model model) {
        var genre = genreService.getGenreById(id);
        var movies = movieService.getMoviesByGenre(id);
        var series = serieService.getSeriesByGenre(id);
        model.addAttribute("genre", genre);
        model.addAttribute("movies", movies);
        model.addAttribute("series", series);
        return "genre-details";
    }
} 