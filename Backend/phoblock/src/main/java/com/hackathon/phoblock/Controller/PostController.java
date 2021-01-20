package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.NotAcceptableException;
import com.hackathon.phoblock.Exceptions.OnSuccessException;
import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.Image;
import com.hackathon.phoblock.Model.Notification;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Model.Post;
import com.hackathon.phoblock.Repository.ImageRepository;
import com.hackathon.phoblock.Repository.NotificationRepository;
import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import com.hackathon.phoblock.Repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
public class PostController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    PostRepository postRepository;
    @Autowired
    ImageRepository imageRepository;
    @Autowired
    NotificationRepository notificationRepository;

    @GetMapping("/Posts")
    List<Post> getAllPost() {
        return postRepository.findAll();
    }

    @GetMapping("/users/{userName}/posts")
    public List<Post> getAllPostsByUsername(@PathVariable String userName){
        return postRepository.findByPostOwner_UserName(userName);
    }

    @GetMapping("/users/{userName}/posts/{id}")
    public Post getPostByUsernameAndID(@PathVariable String userName, @PathVariable int id)
            throws ResourceNotFoundException {

        Post retrievedPost = postRepository.findByIdAndPostOwner_UserName(id, userName);

        if(retrievedPost == null){
            throw new ResourceNotFoundException("Username/Post ID not found");
        }else{
            return retrievedPost;
        }
    }

    @PostMapping("/users/{userName}/posts")
    public Post createPostForUsername(@RequestBody Post post, @PathVariable String userName)
            throws ResourceNotFoundException, OnSuccessException {

        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(userName);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found");
        }else{

            post.setPostOwner(retrievedUser);
            post.setOwnerUsername(userName);
            post.setUserDp(retrievedUser.getUserDefaultPicture());

            Image postImage = post.getPostPicture();
            postImage.setImagePost(post);

            retrievedUser.addUserPost(post);

            //Modify retrievedUser data
            phoBlockUserRepository.save(retrievedUser);
            //Save new post to Post Repository
            postRepository.save(post);
            //Save image post to Image Repository
            imageRepository.save(post.getPostPicture());

            throw new OnSuccessException("New Post Uploaded");
        }
    }

    @PostMapping("/users/user/{id}/posts")
    public Post createPostForId(@RequestBody Post post, @PathVariable int id)
            throws ResourceNotFoundException, OnSuccessException {

        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(id);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found");
        }else{

            retrievedUser.addUserPost(post);
            post.setPostOwner(retrievedUser);
            post.setOwnerUsername(retrievedUser.getUserName());
            post.setOwnerUserId(id);

            Image postImage = post.getPostPicture();
            postImage.setImagePost(post);

            if(retrievedUser.getUserDefaultPicture() != null){
                Image userDp = new Image(retrievedUser.getUserDefaultPicture().getImageName(),
                        retrievedUser.getUserDefaultPicture().getImageType(),
                        retrievedUser.getUserDefaultPicture().getImageString());

                post.setUserDp(userDp);
                userDp.setPostUserDp(post);

            }

            //Modify retrievedUser data
            phoBlockUserRepository.save(retrievedUser);
            //Save new post to Post Repository
            postRepository.save(post);
            //Save image post to Image Repository
            imageRepository.save(post.getPostPicture());

            if(post.getUserDp() != null){
                imageRepository.save(post.getUserDp());
            }

            throw new OnSuccessException("New Post Uploaded");
        }
    }

    @PutMapping("/users/{userName}/posts/{postId}")
    public Post updatePost(@PathVariable String userName, @PathVariable Integer postId, @RequestBody Post requestPost)
            throws ResourceNotFoundException {

        PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(userName);

        Post retrievedPost = postRepository.findByIdAndPostOwner_UserName(postId, userName);

        if(retrievedPost == null){
            throw new ResourceNotFoundException("Username/Post ID not found");
        }else{
            retrievedPost.setPostCaption(requestPost.getPostCaption());
            retrievedPost.setPostTag(requestPost.getPostTag());
            retrievedPost.setPostPicture(requestPost.getPostPicture());

            postRepository.save(retrievedPost);

            return retrievedPost;
        }
    }

    @DeleteMapping("/users/{userName}/posts/{postId}")
    public ResponseEntity<?> deletePost(@PathVariable String userName, @PathVariable Integer postId)
    throws ResourceNotFoundException {

        Post retrievedPost = postRepository.findByIdAndPostOwner_UserName(postId, userName);

        if(retrievedPost == null){
            throw new ResourceNotFoundException("Username/Post ID not found");
        }else{
            PhoBlockUser retrievedUser = phoBlockUserRepository.findByUserName(userName);

            for(Post userPost: retrievedUser.getUserPost()){
                if(userPost == retrievedPost){
                    retrievedUser.getUserPost().remove(userPost);

                    Image postImage = retrievedPost.getPostPicture();

                    imageRepository.delete(postImage);
                    postRepository.delete(retrievedPost);

                    return ResponseEntity.ok().build();
                }
            }
        }

        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/users/{userId}/Likes/Posts/{postId}")
    boolean isLikedByUser(@PathVariable int userId, @PathVariable int postId) throws ResourceNotFoundException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        for(Post post: getUser.getLikedPost()){
            if(post.getId().equals(postId)){
                return true;
            }
        }

        return false;
    }

    @PostMapping("/Users/{userId}/Liked/Post/{postId}")
    ResponseEntity<?> likedPost(@PathVariable int userId, @PathVariable int postId)
            throws ResourceNotFoundException, NotAcceptableException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        //Validation
        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        for(Post post: getUser.getLikedPost()){
            if(post.getId().equals(postId)){
                throw new NotAcceptableException("Post has been liked!");
            }
        }

        //Liking the post
        getPost.addLikedUser(getUser);
        getUser.addLikedPost(getPost);

        PhoBlockUser getOtherUser = phoBlockUserRepository.findById(getPost.getOwnerUserId());

        // Create Notification
        Notification notification = new Notification();
        notification.setMessage("liked your image");
        notification.setNotificationFlag(1);
        notification.setNotifierUsername(getUser.getUserName());
        notification.setNotifierUserId(getUser.getId());
        notification.setNotifiedUsername(getOtherUser.getUserName());
        notification.setNotifiedUserId(getOtherUser.getId());
        notification.setNotifiedPostId(postId);

        if(getUser.getUserDefaultPicture() != null){
            Image notifierDp = new Image(getUser.getUserDefaultPicture().getImageName(),
                    getUser.getUserDefaultPicture().getImageType(),
                    getUser.getUserDefaultPicture().getImageString());

            notifierDp.setNotifierUserImage(notification);
            notification.setNotifierUsrImg(notifierDp);
            //notification.setNotifierImage(notifierDp);

            imageRepository.save(notifierDp);
        }

        if(getOtherUser.getUserDefaultPicture() != null){
            Image notifiedDp = new Image(getOtherUser.getUserDefaultPicture().getImageName(),
                    getOtherUser.getUserDefaultPicture().getImageType(),
                    getOtherUser.getUserDefaultPicture().getImageString());

            notifiedDp.setNotifiedUserImage(notification);
            notification.setNotifiedUsrImg(notifiedDp);

            imageRepository.save(notifiedDp);
        }

        Image notifiedPost = new Image(getPost.getPostPicture().getImageName(),
                getPost.getPostPicture().getImageType(),
                getPost.getPostPicture().getImageString());

        notifiedPost.setNotifiedPost(notification);

        //notification.setNotifiedImage(notifiedPost);
        notification.setNotifiedPostImage(notifiedPost);
        notification.setUserNotification(getOtherUser);

        getOtherUser.addNotification(notification);

        notificationRepository.save(notification);
        postRepository.save(getPost);
        phoBlockUserRepository.save(getUser);

        return ResponseEntity.ok().build();
    }

    @PostMapping("/Users/{userId}/Unliked/Post/{postId}")
    ResponseEntity<?> unlikedPost(@PathVariable int userId, @PathVariable int postId)
            throws ResourceNotFoundException, NotAcceptableException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        if(!getUser.isLikedPost(getPost)){
            throw new NotAcceptableException("Post has not been liked!");
        }

        //Unlike the post
        getPost.removeLikedUser(getUser);
        getUser.removeLikedPost(getPost);

        //Remove the notification
        PhoBlockUser getOtherUser = phoBlockUserRepository.findById(getPost.getOwnerUserId());

        for(Notification notification: getOtherUser.getNotifications()){
            if(notification.getNotifiedPostId() == postId && notification.getNotificationFlag() == 1){
                Notification userNoti = notification;
                //Image notifierDp = userNoti.getNotifierImage();
                Image notifierDp = userNoti.getNotifierUsrImg();
                //Image notifiedPost = userNoti.getNotifiedImage();
                Image notifiedPost = userNoti.getNotifiedPostImage();
                Image notifiedUsrDp = userNoti.getNotifierUsrImg();

                getOtherUser.removeNotification(userNoti);
                userNoti.setUserNotification(null);
                notifiedPost.setNotifiedPost(null);

                if(notifierDp != null) {
                    notifierDp.setNotifierUserImage(null);
                    userNoti.setNotifierUsrImg(null);
                    imageRepository.delete(notifierDp);
                }

                if(notifiedUsrDp != null){
                    notifiedUsrDp.setNotifiedUserImage(null);
                    userNoti.setNotifiedUsrImg(null);
                    imageRepository.delete(notifiedUsrDp);
                }

                imageRepository.delete(notifiedPost);

                notificationRepository.delete(notification);
            }
        }

        postRepository.save(getPost);
        phoBlockUserRepository.save(getUser);

        return ResponseEntity.ok().build();
    }

    @GetMapping("/Users/{userId}/Favorites/Posts/{postId}")
    boolean isFavByUser(@PathVariable int userId, @PathVariable int postId) throws ResourceNotFoundException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        for(Post post: getUser.getFavoritePosts()){
            if(post.getId().equals(postId)){
                return true;
            }
        }

        return false;
    }

    @PostMapping("/Users/{userId}/Favorite/Posts/{postId}")
    ResponseEntity<?> favoritePost(@PathVariable int userId, @PathVariable int postId)
            throws ResourceNotFoundException, NotAcceptableException{
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        if(getUser.isFavoritePost(getPost)){
            throw new NotAcceptableException("User has favorite this post");
        }

        //Favoriting the post
        getPost.addUserFavorites(getUser);
        getUser.addFavoritePost(getPost);

        // Create Notification
        PhoBlockUser getOtherUser = phoBlockUserRepository.findById(getPost.getOwnerUserId());

        Notification notification = new Notification();
        notification.setMessage("favorited your image");
        notification.setNotificationFlag(2);
        notification.setNotifierUsername(getUser.getUserName());
        notification.setNotifierUserId(getUser.getId());
        notification.setNotifiedUsername(getOtherUser.getUserName());
        notification.setNotifiedUserId(getOtherUser.getId());
        notification.setNotifiedPostId(postId);

        if(getUser.getUserDefaultPicture() != null){
            Image notifierDp = new Image(getUser.getUserDefaultPicture().getImageName(),
                    getUser.getUserDefaultPicture().getImageType(),
                    getUser.getUserDefaultPicture().getImageString());

            notifierDp.setNotifierUserImage(notification);
            //notification.setNotifierImage(notifierDp);
            notification.setNotifierUsrImg(notifierDp);

            imageRepository.save(notifierDp);
        }

        if(getOtherUser.getUserDefaultPicture() != null){
            Image notifiedDp = new Image(getOtherUser.getUserDefaultPicture().getImageName(),
                    getOtherUser.getUserDefaultPicture().getImageType(),
                    getOtherUser.getUserDefaultPicture().getImageString());

            notifiedDp.setNotifiedUserImage(notification);
            notification.setNotifiedUsrImg(notifiedDp);

            imageRepository.save(notifiedDp);
        }

        Image notifiedPost = new Image(getPost.getPostPicture().getImageName(),
                getPost.getPostPicture().getImageType(),
                getPost.getPostPicture().getImageString());

        notifiedPost.setNotifiedPost(notification);

        //notification.setNotifiedImage(notifiedPost);
        notification.setNotifiedPostImage(notifiedPost);
        notification.setUserNotification(getOtherUser);

        getOtherUser.addNotification(notification);

        notificationRepository.save(notification);
        postRepository.save(getPost);
        phoBlockUserRepository.save(getUser);

        return ResponseEntity.ok().build();
    }

    @PostMapping("/Users/{userId}/UnFavorite/Post/{postId}")
    ResponseEntity<?> unFavoritePost(@PathVariable int userId, @PathVariable int postId)
            throws ResourceNotFoundException, NotAcceptableException{
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        if(!getUser.isFavoritePost(getPost)){
            throw new NotAcceptableException("User has favorite this post");
        }

        getPost.removeUserFavorites(getUser);
        getUser.removeFavoritePost(getPost);

        //Remove the notification
        PhoBlockUser getOtherUser = phoBlockUserRepository.findById(getPost.getOwnerUserId());

        for(Notification notification: getOtherUser.getNotifications()){
            if(notification.getNotifiedPostId() == postId && notification.getNotificationFlag() == 2){
                Notification userNoti = notification;
                //Image notifierDp = userNoti.getNotifierImage();
                //Image notifiedPost = userNoti.getNotifiedImage();
                Image notifierDp = userNoti.getNotifierUsrImg();
                Image notifiedDp = userNoti.getNotifiedUsrImg();
                Image notifiedPost = userNoti.getNotifiedPostImage();

                getOtherUser.removeNotification(userNoti);
                userNoti.setUserNotification(null);
                notifiedPost.setNotifiedPost(null);

                if(notifierDp != null){
                    notifierDp.setNotifierUserImage(null);
                    userNoti.setNotifierUsrImg(null);
                    imageRepository.delete(notifierDp);
                }

                if(notifiedDp != null){
                    notifiedDp.setNotifiedUserImage(null);
                    userNoti.setNotifiedUsrImg(null);
                    imageRepository.delete(notifiedDp);
                }

                imageRepository.delete(notifiedPost);
                notificationRepository.delete(notification);
            }
        }

        postRepository.save(getPost);
        phoBlockUserRepository.save(getUser);

        return ResponseEntity.ok().build();
    }

    @GetMapping("/users/{userId}/Downloads/Posts/{postId}")
    boolean isDownloadedByUser(@PathVariable int userId, @PathVariable int postId) throws ResourceNotFoundException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        for(Post post: getUser.getDownloadedPosts()){
            if(post.getId().equals(postId)){
                return true;
            }
        }

        return false;
    }

    @PostMapping("/Users/{userId}/Download/Post/{postId}")
    ResponseEntity<?> downloadPost(@PathVariable int userId, @PathVariable int postId)
            throws ResourceNotFoundException, NotAcceptableException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);
        Post getPost = postRepository.findById(postId);

        if(getUser == null || getPost == null){
            throw new ResourceNotFoundException("User ID/Post ID not found");
        }

        if(getUser.isDownloadedPost(getPost)){
            throw new NotAcceptableException("User has downloaded this post!");
        }

        getPost.addDownloadedUsers(getUser);
        getUser.addDownloadedPosts(getPost);

        // Create Notification
        PhoBlockUser getOtherUser = phoBlockUserRepository.findById(getPost.getOwnerUserId());

        Notification notification = new Notification();
        notification.setMessage("downloaded your image");
        notification.setNotificationFlag(3);
        notification.setNotifierUsername(getUser.getUserName());
        notification.setNotifierUserId(getUser.getId());
        notification.setNotifiedUsername(getOtherUser.getUserName());
        notification.setNotifiedUserId(getOtherUser.getId());
        notification.setNotifiedPostId(postId);

        if(getUser.getUserDefaultPicture() != null){
            Image notifierDp = new Image(getUser.getUserDefaultPicture().getImageName(),
                    getUser.getUserDefaultPicture().getImageType(),
                    getUser.getUserDefaultPicture().getImageString());

            notifierDp.setNotifierUserImage(notification);
            //notification.setNotifierImage(notifierDp);
            notification.setNotifierUsrImg(notifierDp);

            imageRepository.save(notifierDp);
        }

        if(getOtherUser.getUserDefaultPicture() != null){
            Image notifiedDp = new Image(getOtherUser.getUserDefaultPicture().getImageName(),
                    getOtherUser.getUserDefaultPicture().getImageType(),
                    getOtherUser.getUserDefaultPicture().getImageString());

            notifiedDp.setNotifiedUserImage(notification);
            notification.setNotifiedUsrImg(notifiedDp);

            imageRepository.save(notifiedDp);
        }

        Image notifiedPost = new Image(getPost.getPostPicture().getImageName(),
                getPost.getPostPicture().getImageType(),
                getPost.getPostPicture().getImageString());

        notifiedPost.setNotifiedPost(notification);

        //notification.setNotifiedImage(notifiedPost);
        notification.setNotifiedPostImage(notifiedPost);
        notification.setUserNotification(getOtherUser);

        getOtherUser.addNotification(notification);

        notificationRepository.save(notification);

        postRepository.save(getPost);
        phoBlockUserRepository.save(getUser);

        return ResponseEntity.ok().build();
    }

    @GetMapping("/Users/User/{userId}/Posts/Liked")
    Set<Post> getUserLikedPosts(@PathVariable int userId) throws ResourceNotFoundException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);

        if(getUser == null){
            throw new ResourceNotFoundException("User not found!");
        }

        return getUser.getLikedPost();
    }

    @GetMapping("/Users/User/{userId}/Posts/Downloaded")
    Set<Post> getUserDownloadedPosts(@PathVariable int userId) throws ResourceNotFoundException {
        PhoBlockUser getUser = phoBlockUserRepository.findById(userId);

        if(getUser == null){
            throw new ResourceNotFoundException("User not found!");
        }

        return getUser.getDownloadedPosts();
    }

    @GetMapping("/Users/User/{userId}/Posts/Favorites")
    Set<Post> getUserFavoritePost(@PathVariable int userId) throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findById(userId);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found!");
        }else{
            return retrievedUser.getFavoritePosts();
        }
    }
}

