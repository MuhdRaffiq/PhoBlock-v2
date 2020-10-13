package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    Post findById(Integer id);
    List<Post> findByPostOwner_userName(String username);
    Post findByIdAndPostOwner_userName(Integer id, String username);
}
