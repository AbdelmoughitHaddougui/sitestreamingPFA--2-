package com.sounima.repository;

import com.sounima.model.Serie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface SerieRepository extends JpaRepository<Serie, Long> {
    // Recherche par titre
    java.util.List<Serie> findByTitleContainingIgnoreCase(String title);
    Optional<Serie> findByTitle(String title);
    java.util.List<Serie> findByGenresId(Long genreId);
} 