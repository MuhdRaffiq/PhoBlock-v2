package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Follower;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowerRepository extends JpaRepository<Follower, Long> {
}
