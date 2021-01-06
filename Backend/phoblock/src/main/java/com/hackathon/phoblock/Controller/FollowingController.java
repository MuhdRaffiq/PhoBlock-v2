package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.Following;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Repository.FollowingRepository;
import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@RestController
public class FollowingController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    FollowingRepository followingRepository;

    static class FollowingSortByDate implements Comparator<Following> {
        @Override
        public int compare(Following following1, Following following2){
            return following1.getFollowingDate().compareTo(following2.getFollowingDate());
        }
    }

    @GetMapping("/Users/Followings")
    List<Following> getAllFollowings(){
        List<Following> getAllFollowings = followingRepository.findAll();

        return getAllFollowings;
    }


    @GetMapping("/Users/User/{username}/Followings")
    List<Following> getUserFollowings(@PathVariable String username){
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        List<Following> followings = new ArrayList<>();

        for(Following following: retrievedUser.getFollowings()){
            followings.add(following);
        }

        Collections.sort(followings, new FollowingController.FollowingSortByDate());

        return followings;
    }

    @GetMapping("/Users/User/{userId}/Following/{otherUserId}")
    boolean isFollowing(@PathVariable int userId, @PathVariable int otherUserId) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(userId);
        PhoBlockUser retrievedOtherUser = phoBlockUserRepository.findById(otherUserId);

        if(retrievedUser == null || retrievedOtherUser == null){
            throw new ResourceNotFoundException("User not found!");
        }

        for(Following following: retrievedUser.getFollowings()){
            if(following.getUsername().equals(retrievedOtherUser.getUserName())){
                return true;
            }
        }

        return false;
    }

}
