package com.sounima.controller;

import com.sounima.model.Actor;
import com.sounima.model.Genre;
import com.sounima.model.Movie;
import com.sounima.repository.ActorRepository;
import com.sounima.repository.GenreRepository;
import com.sounima.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/test")
public class TestDataController {

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private ActorRepository actorRepository;

    @GetMapping("/init")
    public String initTestData() {
        // Création des genres
        Genre action = new Genre();
        action.setName("Action");
        action.setDescription("Films d'action");
        genreRepository.save(action);

        Genre drama = new Genre();
        drama.setName("Drame");
        drama.setDescription("Films dramatiques");
        genreRepository.save(drama);

        // Création des acteurs
        Actor actor1 = new Actor();
        actor1.setName("Tom Hanks");
        actor1.setBiography("Acteur américain célèbre");
        actor1.setPhotoUrl("https://example.com/tom-hanks.jpg");
        actorRepository.save(actor1);

        Actor actor2 = new Actor();
        actor2.setName("Leonardo DiCaprio");
        actor2.setBiography("Acteur américain primé");
        actor2.setPhotoUrl("https://example.com/leo.jpg");
        actorRepository.save(actor2);

        // Création d'un film de test
        Movie movie = new Movie();
        movie.setTitle("Inception");
        movie.setDescription("Un voleur qui s'infiltre dans les rêves des autres pour voler leurs secrets.");
        movie.setDirector("Christopher Nolan");
        movie.setReleaseYear(2010);
        movie.setDuration(148);
        movie.setRating(8.8);
        movie.setPosterUrl("https://example.com/inception.jpg");
        // URL d'une vidéo de test (Big Buck Bunny - vidéo libre de droits)
        movie.setVideoUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");

        // Conversion des List en Set
        Set<Genre> genres = new HashSet<>();
        genres.add(action);
        genres.add(drama);
        movie.setGenres(genres);

        Set<Actor> actors = new HashSet<>();
        actors.add(actor1);
        actors.add(actor2);
        movie.setActors(actors);

        movieRepository.save(movie);

        return "redirect:/movies/" + movie.getId();
    }
} 