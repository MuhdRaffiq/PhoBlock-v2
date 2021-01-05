package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "User_PhoBlock")
public class PhoBlockUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column(nullable = false)
    String firstName;
    @Column(nullable = false)
    String lastName;
    @Column(nullable = false)
    String emailAddress;
    @Column(nullable = false)
    @JsonFormat(pattern = "yyyy-MM-dd")
    Date birthDate;
    @Column(nullable = false)
    String userName;
    @Column(nullable = false)
    String userPassword;
    @Column(nullable = false)
    @JsonFormat(pattern = "yyyy-MM-dd")
    Date dateCreated;
    @Column
    String bio;
    @Column
    String phoneNumber;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "postOwner")
    Set<Post> userPost;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "userImage")
    Image userDefaultPicture;
    @OneToMany(mappedBy = "following")
    Set<Follower> followers;
    @OneToMany(mappedBy = "follower")
    Set<Following> followings;
    @OneToMany(mappedBy = "userFavorites")
    Set<Post> userFavorites;
    @ManyToMany(targetEntity = Post.class, cascade = CascadeType.ALL)
    Set<Post> likedPost;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Set<Post> getUserPost() {
        return userPost;
    }

    public void setUserPost(Set<Post> userPost) {
        this.userPost = userPost;
    }

    /*
    * Helper function to add a Post to a User
    * */
    public void addUserPost(Post post){
        this.userPost.add(post);
    }

    public Image getUserDefaultPicture() {
        return userDefaultPicture;
    }

    public void setUserDefaultPicture(Image userDefaultPicture) {
        this.userDefaultPicture = userDefaultPicture;
    }

    public Set<Follower> getFollowers() {
        return followers;
    }

    public void setFollowers(Set<Follower> followers) {
        this.followers = followers;
    }

    /*
    * Helper function to add follower
    * */
    public void addFollower(Follower follower){
        this.followers.add(follower);
    }

    public Set<Following> getFollowings() {
        return followings;
    }

    public void setFollowings(Set<Following> followings) {
        this.followings = followings;
    }

    /*
     * Helper function to add following
     * */
    public void addFollowing(Following following){
        this.followings.add(following);
    }

    public Set<Post> getUserFavorites() {
        return userFavorites;
    }

    public void setUserFavorites(Set<Post> userFavorites) {
        this.userFavorites = userFavorites;
    }

    public void addUserFavorites(Post userFavorite){
        this.userFavorites.add(userFavorite);
    }

    public Set<Post> getLikedPost() {
        return likedPost;
    }

    public void setLikedPost(Set<Post> likedPost) {
        this.likedPost = likedPost;
    }

    /*
     * Helper function to add liked post
     * */
    public void addLikedPost(Post likedPost){
        this.likedPost.add(likedPost);
    }
}
