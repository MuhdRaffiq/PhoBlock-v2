package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Exceptions.ResourceNotFoundException;
import com.hackathon.phoblock.Model.PhoBlockUser;
import com.hackathon.phoblock.Model.Picture;
import com.hackathon.phoblock.Model.Post;
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

    @GetMapping("/Posts")
    List<Post> getAllPost() {
        return postRepository.findAll();
    }

    @GetMapping("/users/{email}/posts")
    public List<Post> getAllPostsByEmail(@PathVariable String email){
        return postRepository.findByPostOwner_EmailAddress(email);
    }

    @PostMapping("/users/{email}/posts")
    public Post createPostForUsername(@RequestBody Post post, @PathVariable String email)
            throws ResourceNotFoundException {
        PhoBlockUser retrievedUser = phoBlockUserRepository.findByEmailAddress(email);

        if(retrievedUser == null){
            throw new ResourceNotFoundException("Username not found");
        }else{

            retrievedUser.addUserPost(post);
            post.setPostOwner(retrievedUser);
            post.setOwnerEmailAddress(email);

            phoBlockUserRepository.save(retrievedUser);
            postRepository.save(post);

            return post;
        }
    }

    @PutMapping("/users/{email}/posts/{postId}")
    public Post updatePost(@PathVariable String email, @PathVariable Integer id, @RequestBody Post requestPost)
            throws ResourceNotFoundException {
        if(phoBlockUserRepository.findByEmailAddress(email) == null){
            throw new ResourceNotFoundException("Username not found");
        }else{
            if(postRepository.findById(id) == null){
                throw new ResourceNotFoundException("Post id not found");
            }

            Post retrievedPost = postRepository.findByIdAndPostOwner_EmailAddress(id, email);

            retrievedPost.setPostCaption(requestPost.getPostCaption());
            retrievedPost.setPostTag(requestPost.getPostTag());
            retrievedPost.setPostTheme(requestPost.getPostTheme());
            retrievedPost.setPostPictures(requestPost.getPostPictures());

            postRepository.save(retrievedPost);

            return retrievedPost;
        }
    }

    @DeleteMapping("/users/{email}/posts/{postId}")
    public ResponseEntity<?> deletePost(@PathVariable String email, @PathVariable Integer postId)
    throws ResourceNotFoundException {
        if(phoBlockUserRepository.findByEmailAddress(email) == null){
            throw new ResourceNotFoundException("Username not found");
        }else{
            if(postRepository.findById(postId) == null){
                throw new ResourceNotFoundException("Post id not found");
            }else {
                Post deletePost = postRepository.findByIdAndPostOwner_EmailAddress(postId, email);

                postRepository.delete(deletePost);
                    
                return ResponseEntity.ok().build();
            }
        }
    }
}

