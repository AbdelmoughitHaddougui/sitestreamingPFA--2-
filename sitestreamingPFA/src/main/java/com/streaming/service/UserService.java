package com.streaming.service;

import com.streaming.model.User;
import com.streaming.model.Movie;
import com.streaming.model.WatchHistory;
import com.streaming.repository.UserRepository;
import com.streaming.repository.WatchHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WatchHistoryRepository watchHistoryRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User createUser(User user) {
        if (userRepository.existsByUsername(user.getUsername())) {
            throw new RuntimeException("Username already exists");
        }
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new RuntimeException("Email already exists");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    public User updateUser(Long id, User userDetails) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        user.setProfilePicture(userDetails.getProfilePicture());
        
        if (userDetails.getPassword() != null && !userDetails.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(userDetails.getPassword()));
        }

        return userRepository.save(user);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public List<WatchHistory> getUserWatchHistory(Long userId) {
        User user = getUserById(userId);
        return watchHistoryRepository.findByUserOrderByWatchDateDesc(user);
    }

    public void addToFavorites(Long userId, Movie movie) {
        User user = getUserById(userId);
        user.getFavoriteMovies().add(movie);
        userRepository.save(user);
    }

    public void removeFromFavorites(Long userId, Movie movie) {
        User user = getUserById(userId);
        user.getFavoriteMovies().remove(movie);
        userRepository.save(user);
    }

    public List<Movie> getFavoriteMovies(Long userId) {
        User user = getUserById(userId);
        return user.getFavoriteMovies();
    }
} 