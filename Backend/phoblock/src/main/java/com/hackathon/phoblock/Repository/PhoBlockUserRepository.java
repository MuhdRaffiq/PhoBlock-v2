package com.hackathon.phoblock.Repository;

import com.hackathon.phoblock.Model.PhoBlockUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhoBlockUserRepository extends JpaRepository<PhoBlockUser, Long> {
    PhoBlockUser findById(int id);
    PhoBlockUser findByEmailAddress(String emailAddress);
    PhoBlockUser findByUserName(String username);
}
