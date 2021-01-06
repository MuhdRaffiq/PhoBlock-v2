package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Model.Follower;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Model.Post;
import com.hackathon.phoblock.Repository.FollowerRepository;
import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import com.hackathon.phoblock.Repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@RestController
public class FollowerController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    FollowerRepository followerRepository;
    @Autowired
    PostRepository postRepository;

    static class FollowerSortByDate implements Comparator<Follower> {
        @Override
        public int compare(Follower follower1, Follower follower2){
            return follower1.getFollowedDate().compareTo(follower2.getFollowedDate());
        }
    }

    @GetMapping("/Users/Followers")
    List<Follower> getAllFollower(){
        List<Follower> allFollowers = followerRepository.findAll();

        return allFollowers;
    }

    @GetMapping("/Users/User/{username}/Followers")
    List<Follower> getUserFollowers(@PathVariable String username){
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        List<Follower> followers = new ArrayList<>();

        for(Follower follower: retrievedUser.getFollowers()){
            followers.add(follower);
        }

        Collections.sort(followers, new FollowerController.FollowerSortByDate());

        return followers;
    }

    @GetMapping("/Users/User/{userId}/Followers")
    List<Follower> getUserFollowersById(@PathVariable int userId){
        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(userId);

        List<Follower> followers = new ArrayList<>();

        for(Follower follower: retrievedUser.getFollowers()){
            followers.add(follower);
        }

        Collections.sort(followers, new FollowerController.FollowerSortByDate());

        return followers;
    }


}
