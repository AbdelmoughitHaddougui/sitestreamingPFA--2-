package com.sounima.service;

import com.sounima.model.Movie;
import com.sounima.model.Genre;
import com.sounima.model.Actor;
import com.sounima.model.Serie;
import com.sounima.repository.MovieRepository;
import com.sounima.repository.GenreRepository;
import com.sounima.repository.ActorRepository;
import com.sounima.repository.SerieRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.http.*;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.context.annotation.Configuration;

import java.util.*;

@Configuration
@EnableScheduling
class SchedulerConfig {}

@Service
public class TmdbService {
    @Value("${tmdb.api.bearer}")
    private String bearerToken;

    @Value("${tmdb.api.base-url}")
    private String baseUrl;

    @Autowired private MovieRepository movieRepository;
    @Autowired private GenreRepository genreRepository;
    @Autowired private ActorRepository actorRepository;
    @Autowired private SerieRepository serieRepository;

    @Autowired
    private RestTemplate restTemplate;

    private Map callTmdbApi(String url) {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + bearerToken);
        headers.set("accept", "application/json");
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);
        return response.getBody();
    }

    @EventListener(ContextRefreshedEvent.class)
    public void importFromTmdb() {
        try {
            System.out.println("Starting TMDB data import...");
            
            // Import genres first
            try {
                importGenres();
                System.out.println("Genres import completed successfully");
            } catch (Exception e) {
                System.err.println("Error importing genres: " + e.getMessage());
                e.printStackTrace();
            }
            
            // Import movies
            try {
                importPopularMovies();
                System.out.println("Movies import completed successfully");
            } catch (Exception e) {
                System.err.println("Error importing movies: " + e.getMessage());
                e.printStackTrace();
            }
            
            // Import series
            try {
                importPopularSeries();
                System.out.println("Series import completed successfully");
            } catch (Exception e) {
                System.err.println("Error importing series: " + e.getMessage());
                e.printStackTrace();
            }
            
            System.out.println("TMDB data import completed");
        } catch (Exception e) {
            System.err.println("Fatal error during TMDB import: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void importGenres() {
        String url = baseUrl + "/genre/movie/list?language=fr-FR";
        Map response = callTmdbApi(url);
        List<Map<String, Object>> genresList = (List<Map<String, Object>>) response.get("genres");
        for (Map<String, Object> genreData : genresList) {
            try {
                Long id = ((Number) genreData.get("id")).longValue();
                String name = (String) genreData.get("name");
                if (!genreRepository.findById(id).isPresent()) {
                    Genre genre = new Genre();
                    genre.setId(id);
                    genre.setName(name);
                    genreRepository.save(genre);
                }
            } catch (Exception e) {
                System.err.println("Error importing genre: " + e.getMessage());
                e.printStackTrace();
            }
        }
    }

    @Scheduled(cron = "0 0 3 * * ?") // Every day at 3 AM
    public void scheduledImport() {
        System.out.println("[SCHEDULED] Starting scheduled TMDB import...");
        importPopularMovies();
    }

    @Transactional
    public void importPopularMovies() {
        String url = baseUrl + "/movie/popular";
        Map<String, Object> response = callTmdbApi(url);
        System.out.println("TMDB response: " + response);
        List<Map<String, Object>> movies = (List<Map<String, Object>>) response.get("results");
        if (movies == null || movies.isEmpty()) {
            System.out.println("No movies found in TMDB response!");
            return;
        }
        for (Map<String, Object> movieData : movies) {
            try {
                String title = (String) movieData.get("title");
                if (title == null) {
                    continue;
                }
                // Check if movie exists
                if (movieRepository.findByTitle(title).isPresent()) {
                    continue;
                }
                Movie movie = new Movie();
                movie.setTitle(title);
                movie.setDescription((String) movieData.get("overview"));
                movie.setPosterUrl("https://image.tmdb.org/t/p/w500" + movieData.get("poster_path"));
                movie.setReleaseYear(Integer.parseInt(((String) movieData.get("release_date")).substring(0, 4)));
                movie.setRating(((Number) movieData.get("vote_average")).doubleValue());
                movie.setDirector(""); // À remplir avec les détails du film
                movie.setTmdbId(((Number) movieData.get("id")).longValue());
                // Set duration (runtime)
                Object runtimeObj = movieData.get("runtime");
                if (runtimeObj != null) {
                    movie.setDuration(((Number) runtimeObj).intValue());
                } else {
                    movie.setDuration(0);
                }
                // Save movie first to get an ID
                movie = movieRepository.save(movie);
                // Récupérer les genres
                String movieDetailsUrl = baseUrl + "/movie/" + movieData.get("id");
                Map<String, Object> movieDetails = callTmdbApi(movieDetailsUrl);
                List<Map<String, Object>> genresData = (List<Map<String, Object>>) movieDetails.get("genres");
                Set<Genre> genres = new HashSet<>();
                for (Map<String, Object> genreData : genresData) {
                    String genreName = (String) genreData.get("name");
                    Genre genre = genreRepository.findByName(genreName)
                            .orElseGet(() -> {
                                Genre newGenre = new Genre();
                                newGenre.setName(genreName);
                                newGenre.setDescription("Genre " + genreName);
                                return genreRepository.save(newGenre);
                            });
                    genres.add(genre);
                }
                movie.setGenres(genres);
                // Récupérer les acteurs
                String creditsUrl = baseUrl + "/movie/" + movieData.get("id") + "/credits";
                Map<String, Object> credits = callTmdbApi(creditsUrl);
                List<Map<String, Object>> cast = (List<Map<String, Object>>) credits.get("cast");
                Set<Actor> actors = new HashSet<>();
                for (int i = 0; i < Math.min(cast.size(), 5); i++) {
                    Map<String, Object> actorData = cast.get(i);
                    String actorName = (String) actorData.get("name");
                    Actor actor = actorRepository.findByName(actorName)
                            .orElseGet(() -> {
                                Actor newActor = new Actor();
                                newActor.setName(actorName);
                                newActor.setBiography("");
                                newActor.setPhotoUrl("https://image.tmdb.org/t/p/w500" + actorData.get("profile_path"));
                                return actorRepository.save(newActor);
                            });
                    actors.add(actor);
                }
                movie.setActors(actors);
                movieRepository.save(movie);
                System.out.println("Imported movie: " + title + " (TMDB ID: " + movie.getTmdbId() + ")");
            } catch (Exception e) {
                System.err.println("Error importing movie: " + e.getMessage());
                e.printStackTrace();
            }
        }
        System.out.println("Movies import completed successfully");
    }

    @Transactional
    public void importPopularSeries() {
        String url = baseUrl + "/tv/popular";
        Map<String, Object> response = callTmdbApi(url);
        List<Map<String, Object>> series = (List<Map<String, Object>>) response.get("results");

        for (Map<String, Object> serieData : series) {
            try {
                // Vérifier si la série existe déjà
                String title = (String) serieData.get("name");
                if (title == null) {
                    continue;
                }

                // Check if series exists before creating new one
                Optional<Serie> existingSerie = serieRepository.findByTitle(title);
                if (existingSerie.isPresent()) {
                    continue;
                }

                Serie serie = new Serie();
                serie.setTitle(title);
                serie.setDescription((String) serieData.get("overview"));
                serie.setTmdbId(((Number) serieData.get("id")).longValue());
                
                // Handle poster path safely
                Object posterPath = serieData.get("poster_path");
                if (posterPath != null) {
                    serie.setPosterUrl("https://image.tmdb.org/t/p/w500" + posterPath);
                }
                
                // Vérification de la date de première diffusion
                String firstAirDate = (String) serieData.get("first_air_date");
                if (firstAirDate != null && !firstAirDate.isEmpty()) {
                    try {
                        serie.setReleaseYear(Integer.parseInt(firstAirDate.substring(0, 4)));
                    } catch (NumberFormatException e) {
                        // Skip if year parsing fails
                        continue;
                    }
                }
                
                // Vérification de la note
                Object voteAverage = serieData.get("vote_average");
                if (voteAverage != null) {
                    serie.setRating(((Number) voteAverage).doubleValue());
                }
                
                // Vérification du nombre de saisons
                Object numberOfSeasons = serieData.get("number_of_seasons");
                if (numberOfSeasons != null) {
                    serie.setNumberOfSeasons(((Number) numberOfSeasons).intValue());
                } else {
                    serie.setNumberOfSeasons(0);
                }

                // Save the serie first to get an ID
                serie = serieRepository.save(serie);

                // Récupérer les genres
                String serieDetailsUrl = baseUrl + "/tv/" + serieData.get("id");
                Map<String, Object> serieDetails = callTmdbApi(serieDetailsUrl);
                List<Map<String, Object>> genresData = (List<Map<String, Object>>) serieDetails.get("genres");

                Set<Genre> genres = new HashSet<>();
                if (genresData != null) {
                    for (Map<String, Object> genreData : genresData) {
                        String genreName = (String) genreData.get("name");
                        if (genreName != null) {
                            Genre genre = genreRepository.findByName(genreName)
                                    .orElseGet(() -> {
                                        Genre newGenre = new Genre();
                                        newGenre.setName(genreName);
                                        newGenre.setDescription("Genre " + genreName);
                                        return genreRepository.save(newGenre);
                                    });
                            genres.add(genre);
                        }
                    }
                }
                serie.setGenres(genres);

                // Récupérer les acteurs
                String creditsUrl = baseUrl + "/tv/" + serieData.get("id") + "/credits";
                Map<String, Object> credits = callTmdbApi(creditsUrl);
                List<Map<String, Object>> cast = (List<Map<String, Object>>) credits.get("cast");

                Set<Actor> actors = new HashSet<>();
                if (cast != null) {
                    for (int i = 0; i < Math.min(cast.size(), 5); i++) {
                        Map<String, Object> actorData = cast.get(i);
                        String actorName = (String) actorData.get("name");
                        if (actorName != null) {
                            Actor actor = actorRepository.findByName(actorName)
                                    .orElseGet(() -> {
                                        Actor newActor = new Actor();
                                        newActor.setName(actorName);
                                        newActor.setBiography("");
                                        Object profilePath = actorData.get("profile_path");
                                        if (profilePath != null) {
                                            newActor.setPhotoUrl("https://image.tmdb.org/t/p/w500" + profilePath);
                                        }
                                        return actorRepository.save(newActor);
                                    });
                            actors.add(actor);
                        }
                    }
                }
                serie.setActors(actors);

                // Save the final serie with all relationships
                serieRepository.save(serie);
            } catch (Exception e) {
                e.printStackTrace();
                // Continue with next series on error
                continue;
            }
        }
    }
} 