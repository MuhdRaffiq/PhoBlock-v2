package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.Following;
import com.hackathon.phoblock.Model.PhoBlockUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowingRepository extends JpaRepository<Following, Long> {
    PhoBlockUser findByUsernameAndFollower(String username, PhoBlockUser phoBlockUser);
}
