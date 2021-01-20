package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Follower;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FollowerRepository extends JpaRepository<Follower, Long> {
    List<Follower> findByFollowerId(int id);
}
