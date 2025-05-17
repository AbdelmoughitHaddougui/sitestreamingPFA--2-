package com.streaming.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "watch_history")
public class WatchHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "movie_id", nullable = false)
    private Movie movie;

    @Column(name = "watch_date", nullable = false)
    private LocalDateTime watchDate;

    @Column(name = "watch_duration", nullable = false)
    private int watchDuration;

    @Column(nullable = false)
    private boolean completed;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public LocalDateTime getWatchDate() {
        return watchDate;
    }

    public void setWatchDate(LocalDateTime watchDate) {
        this.watchDate = watchDate;
    }

    public int getWatchDuration() {
        return watchDuration;
    }

    public void setWatchDuration(int watchDuration) {
        this.watchDuration = watchDuration;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }
} 