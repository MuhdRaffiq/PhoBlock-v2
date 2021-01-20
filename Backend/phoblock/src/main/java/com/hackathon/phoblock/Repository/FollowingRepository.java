package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Following;
import com.hackathon.phoblock.Model.PhoBlockUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FollowingRepository extends JpaRepository<Following, Long> {
    Following findByUsernameAndFollower(String username, PhoBlockUser phoBlockUser);
    List<Following> findByFollowingId(int id);
}
