package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.OnSuccessException;
import com.hackathon.phoblock.Exceptions.RegistrationFailedException;
import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.*;
import com.hackathon.phoblock.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class PhoBlockUserController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    ImageRepository imageRepository;
    @Autowired
    FollowerRepository followerRepository;
    @Autowired
    FollowingRepository followingRepository;
    @Autowired
    PostRepository postRepository;

    static class FollowerSortByDate implements Comparator<Follower> {
        @Override
        public int compare(Follower follower1, Follower follower2){
            return follower1.getFollowedDate().compareTo(follower2.getFollowedDate());
        }
    }

    static class FollowingSortByDate implements Comparator<Following> {
        @Override
        public int compare(Following following1, Following following2){
            return following1.getFollowingDate().compareTo(following2.getFollowingDate());
        }
    }

    @PostMapping("/Users/User")
    PhoBlockUser createUser(@RequestBody PhoBlockUser phoBlockUser) throws RegistrationFailedException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByEmailAddress(phoBlockUser.getEmailAddress());

        if(retrievedUser != null){
            throw new RegistrationFailedException("Username has been taken. Please choose another username");
        }else{

            phoBlockUserRepository.save(phoBlockUser);

            return phoBlockUser;
        }
    }

    @GetMapping("/Users")
    List<PhoBlockUser> getAllUsers(){
        List<PhoBlockUser> getAllUsers = phoBlockUserRepository.findAll();

        return getAllUsers;
    }

    @GetMapping("/Users/User/{userName}")
    PhoBlockUser getUser(@PathVariable String userName) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(userName);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }

        return retrievedUser;
    }

    @PostMapping("/AuthenticateLogin")
    PhoBlockUser validateLogin(@RequestBody PhoBlockLoginAuthentication loginCredentials)
            throws ResourceNotFoundException, OnSuccessException {

        if(phoBlockUserRepository.findByEmailAddress(loginCredentials.getEmailAddress()) == null &&
                phoBlockUserRepository.findByUserName(loginCredentials.getEmailAddress()) == null){
            throw new ResourceNotFoundException("Invalid Username/Password");
        }else{
            PhoBlockUser retrievedUser = phoBlockUserRepository.findByEmailAddress(loginCredentials.getEmailAddress());

            if(!retrievedUser.getUserPassword().equals(loginCredentials.getPassword())){
                throw new ResourceNotFoundException("Invalid Username/Password");
            }

            throw new OnSuccessException("Login Success!");
        }
    }

    @PutMapping("/Users/User/{userName}")
    PhoBlockUser updateUser(@RequestBody PhoBlockUser phoBlockUser, @PathVariable String userName) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(userName);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{

            retrievedUser.setFirstName(phoBlockUser.getFirstName());
            retrievedUser.setLastName(phoBlockUser.getLastName());
            retrievedUser.setUserName(phoBlockUser.getUserName());
            retrievedUser.setEmailAddress(phoBlockUser.getEmailAddress());
            retrievedUser.setBio(phoBlockUser.getBio());
            retrievedUser.setBirthDate(phoBlockUser.getBirthDate());

            if(phoBlockUser.getUserDefaultPicture() != null){

                if(retrievedUser.getUserDefaultPicture() == null) {
                    retrievedUser.setUserDefaultPicture(phoBlockUser.getUserDefaultPicture());
                    Image updateImage = phoBlockUser.getUserDefaultPicture();
                    imageRepository.save(updateImage);
                }else{
                    Image userCurrDp = retrievedUser.getUserDefaultPicture();
                    imageRepository.delete(userCurrDp);

                    retrievedUser.setUserDefaultPicture(phoBlockUser.getUserDefaultPicture());
                    imageRepository.save(phoBlockUser.getUserDefaultPicture());
                }
            }

            phoBlockUserRepository.save(retrievedUser);

            return retrievedUser;
        }
    }

    @GetMapping("/Users/User/{username}/Followers")
    List<Follower> getUserFollowers(@PathVariable String username){
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        List<Follower> followers = new ArrayList<>();

        for(Follower follower: retrievedUser.getFollowers()){
            followers.add(follower);
        }

        Collections.sort(followers, new PhoBlockUserController.FollowerSortByDate());

        return followers;
    }

    @GetMapping("/Users/User/{username}/Followings")
    List<Following> getUserFollowings(@PathVariable String username){
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        List<Following> followings = new ArrayList<>();

        for(Following following: retrievedUser.getFollowings()){
            followings.add(following);
        }

        Collections.sort(followings, new PhoBlockUserController.FollowingSortByDate());

        return followings;
    }

    @PostMapping("/Users/User/{username}/Follow/{followingUsername}")
    ResponseEntity<?> followUser(@PathVariable String username, @PathVariable String followingUsername)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("User not found!");
        }else{
            PhoBlockUser retrievedFollowingUser = phoBlockUserRepository.findByUserName(followingUsername);

            Follower follower = new Follower();
            follower.setUsername(retrievedUser.getUserName());
            follower.setFollowedDate(new Date());
            follower.setFollowerDefaultPicture(retrievedUser.getUserDefaultPicture());
            follower.setFollowing(retrievedFollowingUser);
            followerRepository.save(follower);

            Following following = new Following();
            following.setUsername(followingUsername);
            following.setFollowingDate(new Date());
            following.setFollowingDefaultPicture(retrievedFollowingUser.getUserDefaultPicture());
            followingRepository.save(following);

            retrievedUser.addFollowing(following);
            retrievedFollowingUser.addFollower(follower);

            phoBlockUserRepository.save(retrievedUser);
            phoBlockUserRepository.save(retrievedFollowingUser);

            return ResponseEntity.ok().build();
        }
    }

    @PostMapping("/Users/User/{username}/Unfollow/{unfollowUsername}")
    ResponseEntity<?> unfollowUser(@PathVariable String username, @PathVariable String unfollowUsername)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("User not found!");
        }else{
            PhoBlockUser retrievedFollowingUser = phoBlockUserRepository.findByUserName(unfollowUsername);

            Following getFollowing;

            for(Following following: retrievedUser.getFollowings()){
                if(following.getUsername().equals(retrievedFollowingUser.getUserName())){
                    getFollowing = following;
                    retrievedUser.getFollowings().remove(following);
                    following.setFollower(null);

                    followingRepository.delete(getFollowing);
                    break;
                }
            }

            Follower getFollower;

            for(Follower follower: retrievedFollowingUser.getFollowers()){
                if(follower.getUsername().equals(retrievedUser.getUserName())){
                    getFollower = follower;
                    retrievedFollowingUser.getFollowers().remove(follower);
                    follower.setFollowing(null);

                    followerRepository.delete(getFollower);
                    break;
                }
            }

            phoBlockUserRepository.save(retrievedFollowingUser);
            phoBlockUserRepository.save(retrievedUser);

            return ResponseEntity.ok().build();
        }
    }

    @GetMapping("/Users/User/{username}/Favorites")
    Set<Post> getUserFavoritePost(@PathVariable String username) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            return retrievedUser.getUserFavorites();
        }
    }

    @PostMapping("/Users/User/{username}/Favorite/{postId}")
    ResponseEntity<?> favoritePost(@PathVariable String username, @PathVariable int postId)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            Post favPost = postRepository.findById(postId);
            favPost.setNumberFavorite(favPost.getNumberFavorite() + 1);
            favPost.setUserFavorites(retrievedUser);
            postRepository.save(favPost);

            retrievedUser.addUserFavorites(favPost);
            phoBlockUserRepository.save(retrievedUser);

            return ResponseEntity.ok().build();
        }
    }

    @PostMapping("/Users/User/{username}/Unfavorite/{postId}")
    ResponseEntity<?> unfavoritePost(@PathVariable String username, @PathVariable int postId)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            Post favPost = postRepository.findById(postId);
            favPost.setNumberFavorite(favPost.getNumberFavorite() - 1);
            favPost.setUserFavorites(null);
            postRepository.save(favPost);

            for(Post post: retrievedUser.getUserFavorites()){
                if(post.getId().equals(favPost.getId())){
                    retrievedUser.getUserFavorites().remove(post);

                    phoBlockUserRepository.save(retrievedUser);
                }
            }

            return ResponseEntity.ok().build();
        }
    }

    @DeleteMapping("/Users/User/{username}/Remove")
    ResponseEntity<?> deleteUser(@PathVariable String username) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            Image userDp = retrievedUser.getUserDefaultPicture();

            imageRepository.delete(userDp);

            Set<Post> userPosts = retrievedUser.getUserPost();

            for(Post post: userPosts){
                Image postImage = post.getPostPicture();
                imageRepository.delete(postImage);

                postRepository.delete(post);
                userPosts.remove(post);
            }

            phoBlockUserRepository.delete(retrievedUser);

            return ResponseEntity.ok().build();
        }
    }

}
