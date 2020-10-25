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
    @Column(nullable = false)
    String postTheme;
    @Column (nullable = false)
    Integer numberDownload;
    @Column (nullable = false)
    Integer numberFavorite;
    @JsonFormat(pattern = "yyyy-MM-dd")
    Date dateCreated;
    @Column
    String ownerEmailAddress;
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

    public String getPostCaption() {
        return postCaption;
    }

    public String getPostTag() {
        return postTag;
    }

    public String getPostTheme() {
        return postTheme;
    }

    public Integer getNumberDownload() {
        return numberDownload;
    }

    public Integer getNumberFavorite() {
        return numberFavorite;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public String getOwnerEmailAddress() {
        return ownerEmailAddress;
    }

    public PhoBlockUser getPostOwner() {
        return postOwner;
    }

    public Set<Image> getPostPictures() {
        return postPictures;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPostCaption(String postCaption) {
        this.postCaption = postCaption;
    }

    public void setPostTag(String postTag) {
        this.postTag = postTag;
    }

    public void setPostTheme(String postTheme) {
        this.postTheme = postTheme;
    }

    public void setNumberDownload(Integer numberDownload) {
        this.numberDownload = numberDownload;
    }

    public void setNumberFavorite(Integer numberFavorite) {
        this.numberFavorite = numberFavorite;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public void setOwnerEmailAddress(String ownerEmailAddress) {
        this.ownerEmailAddress = ownerEmailAddress;
    }

    public void setPostOwner(PhoBlockUser postOwner) {
        this.postOwner = postOwner;
    }

    public void setPostPictures(Set<Image> postPictures) {
        this.postPictures = postPictures;
    }

    public void addPicture(Image picture){
        this.postPictures.add(picture);
    }
}
