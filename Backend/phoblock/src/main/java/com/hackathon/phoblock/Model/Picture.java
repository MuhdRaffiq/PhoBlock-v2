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
    PhoBlockUser picture_owner;
}
