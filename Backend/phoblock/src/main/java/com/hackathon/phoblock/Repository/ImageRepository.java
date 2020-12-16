package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {
    Image findById(Integer id);
    List<Image> findByImagePost_id(Integer id);
    Image findByIdAndImagePost_id(Integer id, Integer postId);
}
