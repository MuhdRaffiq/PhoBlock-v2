package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Model.Picture;
import com.hackathon.phoblock.Model.Post;
import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import com.hackathon.phoblock.Repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PostController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;
    @Autowired
    PostRepository postRepository;

    @GetMapping("/Posts")
    List<Post> getAllPost() {
        return postRepository.findAll();
    }

    @GetMapping("/users/{username}/posts")
    public List<Post> getAllPostsByUsername(@PathVariable String username){
        return postRepository.findByPostOwner_userName(username);
    }

    @PostMapping("/users/{username}/posts")
    public Post createPostForUsername(@RequestBody Post post, @PathVariable String username)
            throws ResourceNotFoundException {
        if(phoBlockUserRepository.findByuserName(username) == null){
            throw new ResourceNotFoundException("Username not found");
        }else{
            PhoBlockUser user = phoBlockUserRepository.findByuserName(username);

            user.addUserPost(post);
            post.setPostOwner(user);
            post.setOwnerUsername(username);

            postRepository.save(post);

            return post;
        }
    }

    @PutMapping("/users/{username}/posts/{postId}")
    public Post updatePost(@PathVariable String username, @PathVariable Integer id, @RequestBody Post requestPost)
            throws ResourceNotFoundException {
        if(phoBlockUserRepository.findByuserName(username) == null){
            throw new ResourceNotFoundException("Username not found");
        }else{
            if(postRepository.findById(id) == null){
                throw new ResourceNotFoundException("Post id not found");
            }

            Post retrievedPost = postRepository.findByIdAndPostOwner_userName(id, username);

            retrievedPost.setPostCaption(requestPost.getPostCaption());
            retrievedPost.setPostTag(requestPost.getPostTag());
            retrievedPost.setPostTheme(requestPost.getPostTheme());
            retrievedPost.setPostPictures(requestPost.getPostPictures());

            postRepository.save(retrievedPost);

            return retrievedPost;
        }
    }


}
