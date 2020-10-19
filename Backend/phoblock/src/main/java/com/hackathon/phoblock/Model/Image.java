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
    @Column(length = 1000)
    byte[] imageByte;
    @ManyToOne
    @JoinColumn(name = "post_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    Post picturePost;

    public Image() {
        super();
    }

    public Image(String imageName, String imageType, byte[] imageByte){
        this.imageName = imageName;
        this.imageType = imageType;
        this.imageByte = imageByte;
    }

    public Integer getId() {
        return id;
    }

    public String getImageName() {
        return imageName;
    }

    public String getImageType() {
        return imageType;
    }

    public byte[] getImageByte() {
        return imageByte;
    }

    public Post getPicturePost() {
        return picturePost;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public void setImageType(String imageType) {
        this.imageType = imageType;
    }

    public void setImageByte(byte[] imageByte) {
        this.imageByte = imageByte;
    }

    public void setPicturePost(Post picturePost) {
        this.picturePost = picturePost;
    }
}
