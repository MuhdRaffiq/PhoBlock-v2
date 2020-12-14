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
    @Column(nullable = false)
    String postTag;
    @Column (nullable = false)
    Integer numberDownload;
    @Column (nullable = false)
    Integer numberFavorite;
    @JsonFormat(pattern = "yyyy-MM-dd")
    Date dateCreated;
    @Column
    String ownerUsername;
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser postOwner;
    @OneToMany(mappedBy = "picturePost")
    Set<Image> postPictures;

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

    public PhoBlockUser getPostOwner() {
        return postOwner;
    }

    public void setPostOwner(PhoBlockUser postOwner) {
        this.postOwner = postOwner;
    }

    public Set<Image> getPostPictures() {
        return postPictures;
    }

    public void setPostPictures(Set<Image> postPictures) {
        this.postPictures = postPictures;
    }
}
