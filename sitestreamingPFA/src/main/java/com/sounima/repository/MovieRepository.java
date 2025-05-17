package com.sounima.repository;

import com.sounima.model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MovieRepository extends JpaRepository<Movie, Long> {
    List<Movie> findTop10ByOrderByRatingDesc();
    List<Movie> findTop10ByOrderByReleaseYearDesc();
    List<Movie> findByTitleContainingIgnoreCase(String title);
    List<Movie> findByGenresId(Long genreId);
    Optional<Movie> findByTitle(String title);
} 