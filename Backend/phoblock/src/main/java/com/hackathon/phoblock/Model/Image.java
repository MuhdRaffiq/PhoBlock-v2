package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "Image")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column
    String imageName;
    @Column
    String imageType;
    @Lob
    @Column(columnDefinition="mediumblob")
    String imageString;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "post_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Post imagePost;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser userImage;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "follower_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Follower followerImage;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "following_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Following followingImage;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "post_user_dp_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Post postUserDp;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "notifier_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Notification notifierUserImage;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "notifier_user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Notification notifiedUserImage;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "notified_post_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Notification notifiedPost;

    public Image() {
        super();
    }

    public Image(String imageName, String imageType, String imageString){
        this.imageName = imageName;
        this.imageType = imageType;
        this.imageString = imageString;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImageType() {
        return imageType;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }

    public String getImageString() {
        return imageString;
    }

    public void setImageString(String imageString) {
        this.imageString = imageString;
    }

    public PhoBlockUser getUserImage() {
        return userImage;
    }

    public void setUserImage(PhoBlockUser userImage) {
        this.userImage = userImage;
    }

    public Post getImagePost() {
        return imagePost;
    }

    public void setImagePost(Post imagePost) {
        this.imagePost = imagePost;
    }

    public Follower getFollowerImage() {
        return followerImage;
    }

    public void setFollowerImage(Follower followerImage) {
        this.followerImage = followerImage;
    }

    public Following getFollowingImage() {
        return followingImage;
    }

    public void setFollowingImage(Following followingImage) {
        this.followingImage = followingImage;
    }

    public Post getPostUserDp() {
        return postUserDp;
    }

    public void setPostUserDp(Post postUserDp) {
        this.postUserDp = postUserDp;
    }

    public Notification getNotifiedPost() {
        return notifiedPost;
    }

    public void setNotifiedPost(Notification notifiedPost) {
        this.notifiedPost = notifiedPost;
    }

    public Notification getNotifiedUserImage() {
        return notifiedUserImage;
    }

    public void setNotifiedUserImage(Notification notifiedUserImage) {
        this.notifiedUserImage = notifiedUserImage;
    }

    public Notification getNotifierUserImage() {
        return notifierUserImage;
    }

    public void setNotifierUserImage(Notification notifierUserImage) {
        this.notifierUserImage = notifierUserImage;
    }
}
