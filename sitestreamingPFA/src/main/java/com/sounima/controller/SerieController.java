package com.sounima.controller;

import com.sounima.model.Serie;
import com.sounima.service.SerieService;
import com.sounima.service.GenreService;
import com.sounima.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/series")
public class SerieController {
    @Autowired
    private SerieService serieService;

    @Autowired
    private GenreService genreService;

    @Autowired
    private AuthService authService;

    @GetMapping("")
    public String listSeries(@RequestParam(value = "q", required = false) String query,
                             @RequestParam(value = "genreId", required = false) Long genreId,
                             Model model) {
        if (genreId != null) {
            model.addAttribute("series", serieService.getSeriesByGenre(genreId));
        } else if (query != null && !query.isEmpty()) {
            model.addAttribute("series", serieService.searchSeries(query));
        } else {
            model.addAttribute("series", serieService.getAllSeries());
        }
        var genresWithSeries = genreService.getAllGenres().stream()
            .filter(genre -> !serieService.getSeriesByGenre(genre.getId()).isEmpty())
            .toList();
        model.addAttribute("genres", genresWithSeries);
        return "series";
    }

    @GetMapping("/{id}")
    public String serieDetails(@PathVariable Long id, Model model) {
        Serie serie = serieService.getSerieById(id);
        model.addAttribute("serie", serie);
        var user = authService.getCurrentUser();
        model.addAttribute("currentUser", user);
        return "serie-details";
    }

    @GetMapping("/{id}/watch")
    public String watchSerie(@PathVariable Long id, Model model) {
        Serie serie = serieService.getSerieById(id);
        model.addAttribute("serie", serie);
        model.addAttribute("tmdbId", serie.getTmdbId());
        return "serie-player";
    }

    @PostMapping("/api/series/{id}/favorite")
    public String addSerieToFavorites(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        serieService.addSerieToFavorites(user, id);
        redirectAttributes.addFlashAttribute("success", "Série ajoutée à vos favoris !");
        return "redirect:/series/" + id;
    }

    @PostMapping("/api/series/{id}/favorite/remove")
    public String removeSerieFromFavorites(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        serieService.removeSerieFromFavorites(user, id);
        redirectAttributes.addFlashAttribute("success", "Série retirée de vos favoris !");
        return "redirect:/favorites";
    }

    @PostMapping("/api/series/{id}/watchlist/remove")
    public String removeSerieFromWatchlist(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        serieService.removeSerieFromWatchlist(user, id);
        redirectAttributes.addFlashAttribute("success", "Série retirée de votre liste à voir !");
        return "redirect:/watchlist";
    }

    @PostMapping("/api/series/{id}/watchlist")
    public String addSerieToWatchlist(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var user = authService.getCurrentUser();
        if (user == null) {
            return "redirect:/login";
        }
        serieService.addSerieToWatchlist(user, id);
        redirectAttributes.addFlashAttribute("success", "Série ajoutée à votre liste à voir !");
        return "redirect:/series/" + id;
    }
} 