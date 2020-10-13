package com.hackathon.phoblock.Model;

import javax.persistence.*;

@Entity
@Table(name="picture")
public class Picture {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(nullable = false)
    String pictureCaption;
    @Column(nullable = false)
    PhoBlockUser pictureOwner;
    @Column(nullable = false)
    String pictureTag;
    @Column(nullable = false)
    String pictureTheme; 
    @Column (nullable = true)
    Integer numberDownload;
    @Column (nullable = true)
    Integer numberFavorite;
    @Column (nullable = false);
    String product;
    @JsonFormat(pattern = "yyyy-MM-dd")
    Date dateCreated;

    public Integer getId() {
        return id;
    }

    public String getPictureCaption() {
        return pictureCaption;
    }

    public String getPictureOwner() {
        return pictureOwner;
    }

    public String getPictureTag() {
        return pictureTag;
    }

    public String getPictureTheme() {
        return pictureTheme;
    }

    public Integer getNumberDownload() {
        return numberDownload;
    }

    public Integer getNumberFavorite() {
        return numberFavorite;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setPictureCaption(String pictureCaption) {
        this.pictureCaption = pictureCaption;
    }

    public void setPictureOwner(String pictureOwner) {
        this.pictureOwner = pictureOwner;
    }

    public void setPictureTag(String pictureTag) {
        this.pictureTag = pictureTag;
    }

    public void setPictureTheme(String pictureTheme) {
        this.pictureTheme = pictureTheme;
    }

    public void setNumberDownload(Integer numberDownload) {
        this.numberDownload = numberDownload;
    }

    public void setNumberFavorite(Integer numberFavorite) {
        this.numberFavorite = numberFavorite;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

}
