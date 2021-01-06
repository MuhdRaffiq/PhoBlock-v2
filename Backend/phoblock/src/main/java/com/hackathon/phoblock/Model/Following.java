package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "user_following")
public class Following {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(nullable = false)
    String username;
    @Column(nullable = false)
    Date followingDate;
    @Column
    Integer followingId;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "followingImage")
    Image followingDefaultPicture;
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser follower;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getFollowingDate() {
        return followingDate;
    }

    public void setFollowingDate(Date followingDate) {
        this.followingDate = followingDate;
    }

    public Integer getFollowingId() {
        return followingId;
    }

    public void setFollowingId(Integer followingId) {
        this.followingId = followingId;
    }

    public Image getFollowingDefaultPicture() {
        return followingDefaultPicture;
    }

    public void setFollowingDefaultPicture(Image followingDefaultPicture) {
        this.followingDefaultPicture = followingDefaultPicture;
    }

    public PhoBlockUser getFollower() {
        return follower;
    }

    public void setFollower(PhoBlockUser follower) {
        this.follower = follower;
    }
}

