package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "User_Post")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(nullable = false)
    String postCaption;
    @Column (nullable = false)
    Integer numberDownload;
    @Column (nullable = false)
    Integer numberFavorite;
    @Column(nullable = false)
    Integer numberLiked;
    @Column(nullable = false)
    @JsonFormat(pattern = "yyyy-MM-dd")
    Date dateCreated;
    @Column
    String postTag;
    @Column
    String ownerUsername;
    @Column
    Integer ownerUserId;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "postUserDp")
    Image userDp;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser postOwner;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "imagePost")
    Image postPicture;
    @ManyToOne
    @JoinColumn(name = "user_fav_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser userFavorites;
    @ManyToMany(targetEntity = PhoBlockUser.class, mappedBy = "likedPost", cascade = CascadeType.ALL)
    Set<PhoBlockUser> likedUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPostCaption() {
        return postCaption;
    }

    public void setPostCaption(String postCaption) {
        this.postCaption = postCaption;
    }

    public String getPostTag() {
        return postTag;
    }

    public void setPostTag(String postTag) {
        this.postTag = postTag;
    }

    public Integer getNumberDownload() {
        return numberDownload;
    }

    public void setNumberDownload(Integer numberDownload) {
        this.numberDownload = numberDownload;
    }

    public Integer getNumberFavorite() {
        return numberFavorite;
    }

    public void setNumberFavorite(Integer numberFavorite) {
        this.numberFavorite = numberFavorite;
    }

    public Integer getNumberLiked() {
        return numberLiked;
    }

    public void setNumberLiked(Integer numberLiked) {
        this.numberLiked = numberLiked;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getOwnerUsername() {
        return ownerUsername;
    }

    public void setOwnerUsername(String ownerUsername) {
        this.ownerUsername = ownerUsername;
    }

    public Integer getOwnerUserId() {
        return ownerUserId;
    }

    public void setOwnerUserId(Integer ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public Image getUserDp() {
        return userDp;
    }

    public void setUserDp(Image userDp) {
        this.userDp = userDp;
    }

    public PhoBlockUser getPostOwner() {
        return postOwner;
    }

    public void setPostOwner(PhoBlockUser postOwner) {
        this.postOwner = postOwner;
    }

    public Image getPostPicture() {
        return postPicture;
    }

    public void setPostPicture(Image postPicture) {
        this.postPicture = postPicture;
    }

    public PhoBlockUser getUserFavorites() {
        return userFavorites;
    }

    public void setUserFavorites(PhoBlockUser userFavorites) {
        this.userFavorites = userFavorites;
    }

    public Set<PhoBlockUser> getLikedUser() {
        return likedUser;
    }

    public void setLikedUser(Set<PhoBlockUser> likedUser) {
        this.likedUser = likedUser;
    }

    public void addLikedUser(PhoBlockUser likedUser){
        this.likedUser.add(likedUser);
    }
}
