package com.sounima.controller;

import com.sounima.service.MovieService;
import com.sounima.service.SerieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private SerieService serieService;

    @GetMapping("")
    public String search(@RequestParam("q") String query, Model model) {
        model.addAttribute("movies", movieService.searchMovies(query));
        model.addAttribute("series", serieService.searchSeries(query));
        model.addAttribute("query", query);
        return "search";
    }
} 