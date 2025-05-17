package com.streaming.controller;

import com.streaming.model.User;
import com.streaming.model.Movie;
import com.streaming.model.WatchHistory;
import com.streaming.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<User> registerUser(@RequestBody User user) {
        return ResponseEntity.ok(userService.createUser(user));
    }

    @PutMapping("/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        return ResponseEntity.ok(userService.updateUser(id, userDetails));
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getUserById(id));
    }

    @GetMapping("/username/{username}")
    public ResponseEntity<User> getUserByUsername(@PathVariable String username) {
        return ResponseEntity.ok(userService.getUserByUsername(username));
    }

    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        return ResponseEntity.ok(userService.getAllUsers());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{id}/watch-history")
    public ResponseEntity<List<WatchHistory>> getUserWatchHistory(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getUserWatchHistory(id));
    }

    @PostMapping("/{id}/favorites/{movieId}")
    public ResponseEntity<Void> addToFavorites(@PathVariable Long id, @PathVariable Long movieId) {
        Movie movie = new Movie();
        movie.setId(movieId);
        userService.addToFavorites(id, movie);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}/favorites/{movieId}")
    public ResponseEntity<Void> removeFromFavorites(@PathVariable Long id, @PathVariable Long movieId) {
        Movie movie = new Movie();
        movie.setId(movieId);
        userService.removeFromFavorites(id, movie);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{id}/favorites")
    public ResponseEntity<List<Movie>> getFavoriteMovies(@PathVariable Long id) {
        return ResponseEntity.ok(userService.getFavoriteMovies(id));
    }
} 