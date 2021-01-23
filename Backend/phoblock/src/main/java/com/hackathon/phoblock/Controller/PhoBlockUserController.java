package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.OnSuccessException;
import com.hackathon.phoblock.Exceptions.RegistrationFailedException;
import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.*;
import com.hackathon.phoblock.Repository.*;
import com.hackathon.phoblock.ResponseBodyModel.EditProfileBody;
import com.hackathon.phoblock.Utilities.EtherWeb3j;
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
    @Autowired
    NotificationRepository notificationRepository;

    static class PostSortByDate implements Comparator<Post> {
        @Override
        public int compare(Post post1, Post post2){
            return post1.getDateCreated().compareTo(post2.getDateCreated());
        }
    }

    @GetMapping("/EtherTesting")
    void  etherTesting() throws Exception {
        EtherWeb3j etherWeb3j = new EtherWeb3j();

//        String senderPrivateKey = "16e56711dbdaf5e20b2c41be43216c2f8bc1a312f557f2c7b5cedfd104c26e0f";
//        String recipientWallet = "0xe283b7D9E72572EbcFe53A2B85E6B9677e0A4A44";
//        etherWeb3j.makeTransaction(senderPrivateKey, recipientWallet);

        //etherWeb3j.createWallet("Test1234");
        etherWeb3j.getEtherBalance("0xcD637F1c737C3100c762eea347496EdC229b99c8");

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

            if(phoBlockUser.getWalletAddress() == null || phoBlockUser.getWalletAddress().isEmpty()){

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

    @GetMapping("/Users/User/Id/{id}")
    PhoBlockUser getUserbyId(@PathVariable int id) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(id);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("User not found");
        }

        return retrievedUser;
    }

    @PostMapping("/AuthenticateLogin")
    Integer validateLogin(@RequestBody PhoBlockLoginAuthentication loginCredentials)
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

                return retrievedUserByEmail.getId();
            }else{
                if(!retrievedUserByUsername.getUserPassword().equals(loginCredentials.getPassword())){
                    throw new ResourceNotFoundException("Invalid Username/Password");
                }

                return retrievedUserByUsername.getId();
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
            //Update user details
            retrievedUser.setFirstName(phoBlockUser.getFirstName());
            retrievedUser.setLastName(phoBlockUser.getLastName());
            retrievedUser.setUserName(phoBlockUser.getUsername());
            retrievedUser.setBio(phoBlockUser.getBio());
            retrievedUser.setEmailAddress(phoBlockUser.getEmail());
            retrievedUser.setPhoneNumber(phoBlockUser.getPhoneNumber());
            retrievedUser.setBirthDate(phoBlockUser.getBirthday());

            //Update user profile picture
            if(phoBlockUser.getImageName() != null &&
                    phoBlockUser.getImageType() != null &&
                    phoBlockUser.getImageString() != null){
                Image newImage = new Image(phoBlockUser.getImageName(), phoBlockUser.getImageType(), phoBlockUser.getImageString());
                newImage.setUserImage(retrievedUser);

                // Update user old DP
                if(retrievedUser.getUserDefaultPicture() != null){
                    Image oldDp = retrievedUser.getUserDefaultPicture();
                    oldDp.setUserImage(null);

                    retrievedUser.setUserDefaultPicture(null);
                    imageRepository.delete(oldDp);
                }

                retrievedUser.setUserDefaultPicture(newImage);

                // Update all the user's post
                for(Post userPost: retrievedUser.getUserPost()){
                    Image idk = new Image(retrievedUser.getUserDefaultPicture().getImageName(),
                            retrievedUser.getUserDefaultPicture().getImageType(),
                            retrievedUser.getUserDefaultPicture().getImageString());

                    userPost.setUserDp(idk);
                    idk.setPostUserDp(userPost);

                    imageRepository.save(idk);
                    postRepository.save(userPost);
                }

                // update all notifierUser == user
                List<Notification> notifierList = notificationRepository.findByNotifierUserId(retrievedUser.getId());

                for(Notification notification: notifierList){
                    notification.setNotifierUsername(phoBlockUser.getUsername());

                    if(notification.getNotifierUsrImg() != null){
                        Image notifierDp = notification.getNotifierUsrImg();
                        notifierDp.setImageName(phoBlockUser.getImageName());
                        notifierDp.setImageType(phoBlockUser.getImageType());
                        notifierDp.setImageString(phoBlockUser.getImageString());

                        notification.setNotifierUsrImg(notifierDp);

                        imageRepository.save(notifierDp);
                    }else{
                        Image notifierDp = new Image(phoBlockUser.getImageName(),
                                phoBlockUser.getImageType(), phoBlockUser.getImageString());

                        notification.setNotifierUsrImg(notifierDp);

                        imageRepository.save(notifierDp);
                    }
                    notificationRepository.save(notification);

                    PhoBlockUser user = phoBlockUserRepository.findById(notification.getNotifiedUserId());

                    for(Notification userNotification: user.getNotifications()){
                        if(userNotification.getNotifierUsrImg() != null){
                            Image notifierDp = userNotification.getNotifierUsrImg();
                            notifierDp.setImageName(phoBlockUser.getImageName());
                            notifierDp.setImageType(phoBlockUser.getImageType());
                            notifierDp.setImageString(phoBlockUser.getImageString());

                            notification.setNotifierUsrImg(notifierDp);

                            imageRepository.save(notifierDp);
                        }else{
                            Image notifierDp = new Image(phoBlockUser.getImageName(),
                                    phoBlockUser.getImageType(), phoBlockUser.getImageString());

                            userNotification.setNotifierUsrImg(notifierDp);
                            notifierDp.setNotifierUserImage(userNotification);

                            imageRepository.save(notifierDp);
                        }
                        notificationRepository.save(userNotification);
                    }

                    phoBlockUserRepository.save(user);
                }

                // update all notifiedUser == user
                List<Notification> notifiedList = notificationRepository.findByNotifiedUserId(retrievedUser.getId());

                for(Notification notification: notifiedList){
                    notification.setNotifiedUsername(phoBlockUser.getUsername());

                    if(notification.getNotifiedUsrImg() != null){
                        Image notifiedDp = notification.getNotifiedUsrImg();
                        notifiedDp.setImageName(phoBlockUser.getImageName());
                        notifiedDp.setImageType(phoBlockUser.getImageType());
                        notifiedDp.setImageString(phoBlockUser.getImageString());

                        notification.setNotifiedUsrImg(notifiedDp);

                        imageRepository.save(notifiedDp);
                    }else{
                        Image notifiedDp = new Image(phoBlockUser.getImageName(),
                                phoBlockUser.getImageType(), phoBlockUser.getImageString());

                        notification.setNotifiedUsrImg(notifiedDp);

                        imageRepository.save(notifiedDp);
                    }

                    notificationRepository.save(notification);

                    PhoBlockUser user = phoBlockUserRepository.findById(notification.getNotifierUserId());

                    for(Notification userNotification: user.getNotifications()){
                        if(userNotification.getNotifiedUsrImg() != null){
                            Image notifiedDp = userNotification.getNotifiedUsrImg();
                            notifiedDp.setImageName(phoBlockUser.getImageName());
                            notifiedDp.setImageType(phoBlockUser.getImageType());
                            notifiedDp.setImageString(phoBlockUser.getImageString());

                            userNotification.setNotifiedUsrImg(notifiedDp);

                            imageRepository.save(notifiedDp);
                        }else{
                            Image notifiedDp = new Image(phoBlockUser.getImageName(),
                                    phoBlockUser.getImageType(), phoBlockUser.getImageString());

                            userNotification.setNotifiedUsrImg(notifiedDp);
                            notifiedDp.setNotifiedUserImage(userNotification);

                            imageRepository.save(notifiedDp);
                        }
                        notificationRepository.save(userNotification);
                    }
                    phoBlockUserRepository.save(user);
                }

                // update all follower == user
                List<Follower> followerList = followerRepository.findByFollowerId(retrievedUser.getId());

                for(Follower follower: followerList){
                    follower.setUsername(phoBlockUser.getUsername());
                    Image followerDp = follower.getFollowerDefaultPicture();
                    followerDp.setImageName(phoBlockUser.getImageName());
                    followerDp.setImageType(phoBlockUser.getImageType());
                    followerDp.setImageString(phoBlockUser.getImageString());

                    imageRepository.save(followerDp);
                    followerRepository.save(follower);
                }

                // update all following == user
                List<Following> followingList = followingRepository.findByFollowingId(retrievedUser.getId());

                for(Following following: followingList){
                    following.setUsername(phoBlockUser.getUsername());
                    Image followingDp = following.getFollowingDefaultPicture();
                    followingDp.setImageName(phoBlockUser.getImageName());
                    followingDp.setImageType(phoBlockUser.getImageType());
                    followingDp.setImageString(phoBlockUser.getImageString());

                    imageRepository.save(followingDp);
                    followingRepository.save(following);
                }

                imageRepository.save(newImage);
            }

            phoBlockUserRepository.save(retrievedUser);

            throw new OnSuccessException("Profile has successfully update!");
        }
    }

    @PostMapping("/Users/User/{userId}/Follow/{followingUserId}")
    ResponseEntity<?> followUser(@PathVariable int userId, @PathVariable int followingUserId)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(userId);
        PhoBlockUser retrievedFollowingUser = phoBlockUserRepository.findById(followingUserId);

        if(retrievedUser == null && retrievedFollowingUser == null){
            throw new ResourceNotFoundException("User not found!");
        }else{
            //Check if user has followed the other username
            for(Following following: retrievedUser.getFollowings()){
                if(following.getUsername().equals(retrievedFollowingUser.getUserName())){
                    return ResponseEntity.status(406).build();
                }
            }

            //create a following
            Following following = new Following();
            following.setUsername(retrievedFollowingUser.getUserName());
            following.setFollowingDate(new Date());
            following.setFollowingId(retrievedFollowingUser.getId());

            if(retrievedFollowingUser.getUserDefaultPicture() != null){
                Image followingUserDp = new Image(retrievedFollowingUser.getUserDefaultPicture().getImageName(),
                        retrievedFollowingUser.getUserDefaultPicture().getImageType(),
                        retrievedFollowingUser.getUserDefaultPicture().getImageString());
                following.setFollowingDefaultPicture(followingUserDp);
                following.setFollower(retrievedUser);
                followingUserDp.setFollowingImage(following);
            }

            //Create a follower
            Follower follower = new Follower();
            follower.setUsername(retrievedUser.getUserName());
            follower.setFollowedDate(new Date());
            follower.setFollowerId(retrievedUser.getId());

            if(retrievedUser.getUserDefaultPicture() != null){
                Image followerUserDp = new Image(retrievedUser.getUserDefaultPicture().getImageName(),
                        retrievedUser.getUserDefaultPicture().getImageType(),
                        retrievedUser.getUserDefaultPicture().getImageString());
                follower.setFollowerDefaultPicture(followerUserDp);
                follower.setFollowing(retrievedFollowingUser);
                followerUserDp.setFollowerImage(follower);
            }

            retrievedUser.addFollowing(following);
            retrievedFollowingUser.addFollower(follower);

            phoBlockUserRepository.save(retrievedUser);
            phoBlockUserRepository.save(retrievedFollowingUser);

            followingRepository.save(following);
            followerRepository.save(follower);

            if(following.getFollowingDefaultPicture() != null){
                imageRepository.save(following.getFollowingDefaultPicture());
            }

            if(follower.getFollowerDefaultPicture() != null){
                imageRepository.save(follower.getFollowerDefaultPicture());
            }

            return ResponseEntity.ok().build();
        }
    }

    @PostMapping("/Users/User/{userId}/Unfollow/{unfollowUserId}")
    ResponseEntity<?> unfollowUser(@PathVariable int userId, @PathVariable int unfollowUserId)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(userId);
        PhoBlockUser retrievedFollowingUser = phoBlockUserRepository.findById(unfollowUserId);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("User not found!");
        }else{

            Following findFollowing = followingRepository.findByUsernameAndFollower(retrievedFollowingUser.getUserName(), retrievedUser);

            if(findFollowing == null){
                return ResponseEntity.status(406).build();
            }

            //Removing following from userId
            for(Following following: retrievedUser.getFollowings()){
                if(following.getFollowingId() == findFollowing.getId()){
                    Image followingDp = following.getFollowingDefaultPicture();

                    if(followingDp != null){
                        following.setFollowingDefaultPicture(null);
                        imageRepository.delete(followingDp);
                    }

                    retrievedUser.removeFollowing(following);
                    following.setFollower(null);
                    followingRepository.delete(following);

                    break;
                }
            }

            //Removing follower from unfollowUsername
            for(Follower follower: retrievedFollowingUser.getFollowers()){
                if(follower.getFollowerId() == retrievedUser.getId()){
                    Image followerDp = follower.getFollowerDefaultPicture();

                    if(followerDp != null){
                        follower.setFollowerDefaultPicture(null);
                        imageRepository.delete(followerDp);
                    }

                    retrievedFollowingUser.removeFollower(follower);
                    follower.setFollowing(null);
                    followerRepository.delete(follower);

                    break;
                }
            }

            phoBlockUserRepository.save(retrievedFollowingUser);
            phoBlockUserRepository.save(retrievedUser);

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
