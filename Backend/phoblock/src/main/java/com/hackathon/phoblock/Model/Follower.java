package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "user_follower")
public class Follower {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(nullable = false)
    String username;
    @Column(nullable = false)
    Date followedDate;
    @Column
    Integer followerId;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "followerImage")
    Image followerDefaultPicture;
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser following;

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

    public Date getFollowedDate() {
        return followedDate;
    }

    public Integer getFollowerId() {
        return followerId;
    }

    public void setFollowerId(Integer followerId) {
        this.followerId = followerId;
    }

    public void setFollowedDate(Date followedDate) {
        this.followedDate = followedDate;
    }

    public Image getFollowerDefaultPicture() {
        return followerDefaultPicture;
    }

    public void setFollowerDefaultPicture(Image followerDefaultPicture) {
        this.followerDefaultPicture = followerDefaultPicture;
    }

    public PhoBlockUser getFollowing() {
        return following;
    }

    public void setFollowing(PhoBlockUser following) {
        this.following = following;
    }
}
