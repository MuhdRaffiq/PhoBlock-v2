package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.OnSuccessException;
import com.hackathon.phoblock.Exceptions.RegistrationFailedException;
import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.*;
import com.hackathon.phoblock.Repository.*;
import com.hackathon.phoblock.ResponseBodyModel.EditProfileBody;
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

    static class PostSortByDate implements Comparator<Post> {
        @Override
        public int compare(Post post1, Post post2){
            return post1.getDateCreated().compareTo(post2.getDateCreated());
        }
    }

    @PostMapping("/Users/NewUser")
    PhoBlockUser createUser(@RequestBody PhoBlockUser phoBlockUser) throws RegistrationFailedException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByEmailAddress(phoBlockUser.getEmailAddress());

        if(retrievedUser != null){
            throw new RegistrationFailedException("Email has been used previously");
        }else{
            if(phoBlockUserRepository.findByUserName(phoBlockUser.getUserName()) != null){
                throw new RegistrationFailedException("Username is taken. Try a different username");
            }

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
            PhoBlockUser retrievedUserByEmail = phoBlockUserRepository.findByEmailAddress(loginCredentials.getEmailAddress());
            PhoBlockUser retrievedUserByUsername = phoBlockUserRepository.findByUserName(loginCredentials.getEmailAddress());

            if(retrievedUserByEmail != null && retrievedUserByUsername == null){
                if(!retrievedUserByEmail.getUserPassword().equals(loginCredentials.getPassword())){
                    throw new ResourceNotFoundException("Invalid Username/Password");
                }

                throw new OnSuccessException("Logging in as " + retrievedUserByEmail.getUserName());
            }else{
                if(!retrievedUserByUsername.getUserPassword().equals(loginCredentials.getPassword())){
                    throw new ResourceNotFoundException("Invalid Username/Password");
                }

                throw new OnSuccessException("Logging in as " + retrievedUserByUsername.getUserName());
            }


        }
    }

    @PutMapping("/Users/User/{userName}")
    PhoBlockUser updateUser(@RequestBody EditProfileBody phoBlockUser, @PathVariable String userName)
            throws ResourceNotFoundException, OnSuccessException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(userName);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            retrievedUser.setFirstName(phoBlockUser.getFirstName());
            retrievedUser.setLastName(phoBlockUser.getLastName());
            retrievedUser.setUserName(phoBlockUser.getUsername());
            retrievedUser.setBio(phoBlockUser.getBio());
            retrievedUser.setEmailAddress(phoBlockUser.getEmail());
            retrievedUser.setPhoneNumber(phoBlockUser.getPhoneNumber());
            retrievedUser.setBirthDate(phoBlockUser.getBirthday());

            if(phoBlockUser.getImageName() != null &&
                    phoBlockUser.getImageType() != null &&
                    phoBlockUser.getImageString() != null){
                Image newImage = new Image(phoBlockUser.getImageName(), phoBlockUser.getImageType(), phoBlockUser.getImageString());
                newImage.setUserImage(retrievedUser);

                if(retrievedUser.getUserDefaultPicture() != null){
                    Image oldDp = retrievedUser.getUserDefaultPicture();
                    oldDp.setUserImage(null);

                    retrievedUser.setUserDefaultPicture(null);
                    imageRepository.delete(retrievedUser.getUserDefaultPicture());
                }

                retrievedUser.setUserDefaultPicture(newImage);
                imageRepository.save(newImage);
            }

            phoBlockUserRepository.save(retrievedUser);

            throw new OnSuccessException("Profile has successfully update!");
        }
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

    @GetMapping("/Users/User/{username}/Feed")
    List<Post> userFeed(@PathVariable String username) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(username);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            List<Post> allFollowingPost = new ArrayList<>();

            for(Following following: retrievedUser.getFollowings()){
                PhoBlockUser getFollowingUser = phoBlockUserRepository.findByUserName(following.getUsername());

                Set<Post> followingPosts = getFollowingUser.getUserPost();

                allFollowingPost.addAll(new ArrayList<Post>(followingPosts));
            }

            Collections.sort(allFollowingPost, new PhoBlockUserController.PostSortByDate());

            return allFollowingPost;
        }
    }

}
