package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.OnSuccessException;
import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.Image;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Model.Post;
import com.hackathon.phoblock.Repository.ImageRepository;
import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import com.hackathon.phoblock.Repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PostController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    PostRepository postRepository;
    @Autowired
    ImageRepository imageRepository;

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
            post.setUserDp(retrievedUser.getUserDefaultPicture());

            Image postImage = post.getPostPicture();
            postImage.setImagePost(post);

            //Modify retrievedUser data
            phoBlockUserRepository.save(retrievedUser);
            //Save new post to Post Repository
            postRepository.save(post);
            //Save image post to Image Repository
            imageRepository.save(post.getPostPicture());

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
}

