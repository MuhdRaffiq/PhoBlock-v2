package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.Notification;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Repository.NotificationRepository;
import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import com.hackathon.phoblock.Repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class NotificationController {
    @Autowired
    NotificationRepository notificationRepository;
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    PostRepository postRepository;

    @GetMapping("/Notifications")
    List<Notification> getAllNotifications(){
        List<Notification> getAllNotifications = notificationRepository.findAll();

        return getAllNotifications;
    }

    @GetMapping("/Users/User/{userId}/Notifications")
    List<Notification> allNotificationByUserId(@PathVariable int userId) throws ResourceNotFoundException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);

        if(getUser == null){
            throw new ResourceNotFoundException("No user found!");
        }

        List<Notification> getUserIdNotifications = notificationRepository.findByNotifiedUserId(userId);

        return getUserIdNotifications;
    }
}
