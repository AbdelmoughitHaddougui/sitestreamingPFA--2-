package com.sounima.controller;

import com.sounima.service.MovieService;
import com.sounima.service.GenreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private MovieService movieService;

    @Autowired
    private GenreService genreService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("featuredMovies", movieService.getFeaturedMovies());
        model.addAttribute("latestMovies", movieService.getLatestMovies());
        model.addAttribute("popularMovies", movieService.getPopularMovies());
        model.addAttribute("genres", genreService.getAllGenres());
        return "home";
    }
} 