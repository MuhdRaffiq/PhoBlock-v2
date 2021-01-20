package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Notification;
import com.hackathon.phoblock.Model.PhoBlockUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findByNotifiedUserId(int userId);
    List<Notification> findByNotificationFlag(int flag);
    List<Notification> findByNotifierUserId(int id);
}
