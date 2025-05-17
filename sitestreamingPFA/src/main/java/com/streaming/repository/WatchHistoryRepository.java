package com.streaming.repository;

import com.streaming.model.WatchHistory;
import com.streaming.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WatchHistoryRepository extends JpaRepository<WatchHistory, Long> {
    List<WatchHistory> findByUserOrderByWatchDateDesc(User user);
    List<WatchHistory> findByUserAndCompletedOrderByWatchDateDesc(User user, boolean completed);
} 