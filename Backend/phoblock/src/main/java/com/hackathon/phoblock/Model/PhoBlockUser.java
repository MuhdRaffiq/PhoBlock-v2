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
    @Column
    String walletAddress;
    @Column
    String walletPrivateKey;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "postOwner")
    Set<Post> userPost;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "userImage")
    Image userDefaultPicture;
    @OneToMany(mappedBy = "following")
    Set<Follower> followers;
    @OneToMany(mappedBy = "follower")
    Set<Following> followings;
    @OneToMany(mappedBy = "userNotification")
    Set<Notification> notifications;
    @ManyToMany(targetEntity = Post.class, cascade = CascadeType.ALL)
    Set<Post> favoritePosts;
    @ManyToMany(targetEntity = Post.class, cascade = CascadeType.ALL)
    Set<Post> likedPost;
    @ManyToMany(targetEntity = Post.class, cascade = CascadeType.ALL)
    Set<Post> downloadedPosts;
//    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "walletOwner")
//    Wallet userWallet;

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

    public String getWalletAddress() {
        return walletAddress;
    }

    public void setWalletAddress(String walletAddress) {
        this.walletAddress = walletAddress;
    }

    public String getWalletPrivateKey() {
        return walletPrivateKey;
    }

    public void setWalletPrivateKey(String walletPrivateKey) {
        this.walletPrivateKey = walletPrivateKey;
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

    /*
    * Helper function to remove follower
    * */
    public void removeFollower(Follower follower){
        this.followers.remove(follower);
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

    /*
    * Helper function to remove following
    * */
    public void removeFollowing(Following following){
        this.followings.remove(following);
    }

    public Set<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(Set<Notification> notifications) {
        this.notifications = notifications;
    }

    /*
    * Helper function to add notification
    * */
    public void addNotification(Notification notification){
        this.notifications.add(notification);
    }

    /*
    * Helper function to remove notification
    * */
    public void removeNotification(Notification notification){
        for(Notification currNotification : this.notifications){
            if(currNotification.getId().equals(notification.getId())){
                this.notifications.remove(currNotification);
            }
        }
    }

    public Set<Post> getFavoritePosts() {
        return favoritePosts;
    }

    public void setFavoritePosts(Set<Post> userFavorites) {
        this.favoritePosts = userFavorites;
    }

    /*
    * Helper function to add favorite post
    * */
    public void addFavoritePost(Post userFavorite){
        this.favoritePosts.add(userFavorite);
    }

    /*
    * Helper function to remove favorite post
    * */
    public void removeFavoritePost(Post favoritePost){
        for(Post post: this.favoritePosts){
            if(post.getId().equals(favoritePost.getId())){
                this.favoritePosts.remove(post);
            }
        }
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

    /*
    * Helper function to remove liked post
    * */
    public void removeLikedPost(Post likedPost){
        for(Post post: this.likedPost){
            if(post.getId().equals(likedPost.getId())){
                this.likedPost.remove(likedPost);
            }
        }
    }

    public Set<Post> getDownloadedPosts() {
        return downloadedPosts;
    }

    public void setDownloadedPosts(Set<Post> downloadedPosts) {
        this.downloadedPosts = downloadedPosts;
    }

    /*
     * Helper function to add downloaded post
     * */
    public void addDownloadedPosts(Post downloadedPost){
        this.downloadedPosts.add(downloadedPost);
    }

    /*
    * Helper function to remove downloaded post
    * */
    public void removeDownloadedPost(Post downloadedPost){
        this.downloadedPosts.remove(downloadedPost);
    }

    /*
    * Helper function to check if user has liked a post
    * */
    public boolean isLikedPost(Post checkPost){
        for(Post post: this.getLikedPost()){
            if(post.getId().equals(checkPost.getId())){
                return true;
            }
        }

        return false;
    }

    /*
    * Helper function to check if user has favorite a post
    * */
    public boolean isFavoritePost(Post checkPost){
        for(Post post: this.favoritePosts){
            if(post.getId().equals(checkPost.getId())){
                return true;
            }
        }

        return false;
    }

    /*
    * Helper function to check if user has downloaded a post
    * */
    public boolean isDownloadedPost(Post checkPost){
        for(Post post: this.getDownloadedPosts()){
            if(post.getId().equals(checkPost.getId())){
                return true;
            }
        }

        return false;
    }
}
