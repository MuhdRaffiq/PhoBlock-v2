package com.hackathon.phoblock.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity
@Table(name = "Notification")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    @Column
    String message;
    @Column
    int notificationFlag;
    @Column
    String notifierUsername;
    @Column
    int notifierUserId;
    @Column
    String notifiedUsername;
    @Column
    int notifiedUserId;
    @Column
    int notifiedPostId;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "notifierUserImage")
    Image notifierImage;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "notifiedPost")
    Image notifiedImage;
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    PhoBlockUser userNotification;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getNotificationFlag() {
        return notificationFlag;
    }

    public void setNotificationFlag(int flag) {
        notificationFlag = flag;
    }

    public String getNotifierUsername() {
        return notifierUsername;
    }

    public void setNotifierUsername(String notifierUsername) {
        this.notifierUsername = notifierUsername;
    }

    public int getNotifiedUserId() {
        return notifiedUserId;
    }

    public void setNotifiedUserId(int notifiedUserId) {
        this.notifiedUserId = notifiedUserId;
    }

    public String getNotifiedUsername() {
        return notifiedUsername;
    }

    public void setNotifiedUsername(String notifiedUsername) {
        this.notifiedUsername = notifiedUsername;
    }

    public int getNotifierUserId() {
        return notifierUserId;
    }

    public void setNotifierUserId(int notifierUserId) {
        this.notifierUserId = notifierUserId;
    }

    public int getNotifiedPostId() {
        return notifiedPostId;
    }

    public void setNotifiedPostId(int notifiedPostId) {
        this.notifiedPostId = notifiedPostId;
    }

    public Image getNotifierImage() {
        return notifierImage;
    }

    public void setNotifierImage(Image notifierImage) {
        this.notifierImage = notifierImage;
    }

    public Image getNotifiedImage() {
        return notifiedImage;
    }

    public void setNotifiedImage(Image notifiedImage) {
        this.notifiedImage = notifiedImage;
    }

    public PhoBlockUser getUserNotification() {
        return userNotification;
    }

    public void setUserNotification(PhoBlockUser userNotification) {
        this.userNotification = userNotification;
    }
}
