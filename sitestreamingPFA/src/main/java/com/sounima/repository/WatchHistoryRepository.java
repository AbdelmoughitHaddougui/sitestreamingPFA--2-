package com.sounima.repository;

import com.sounima.model.WatchHistory;
import com.sounima.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WatchHistoryRepository extends JpaRepository<WatchHistory, Long> {
    List<WatchHistory> findByUserOrderByWatchedAtDesc(User user);
    List<WatchHistory> findByUserId(Long userId);
} 