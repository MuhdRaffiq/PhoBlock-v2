import 'package:flutter/material.dart';
import 'notification_card.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  String _imagePath;
  String _usernameString;
  String _notificationMessage;

  NotificationScreen() {
    this._imagePath = "assets/images/postmalone.jpg";
    this._usernameString = "Post Malone";
    this._notificationMessage = "Liked your image";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
          NotificationCard("assets/images/postmalone.jpg", "Post Malone",
              "Liked your image"),
        ],
      ),
    );
  }
}
