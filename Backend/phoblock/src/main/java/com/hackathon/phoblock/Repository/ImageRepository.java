package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {
    Image findById(Integer id);
    List<Image> findByPicturePost_id(Integer id);
    Image findyByIdAndPicturePost_id(Integer id, Integer postId);
}
