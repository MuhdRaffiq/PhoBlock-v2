/*
  Author: Muhammad Khairi Norizan
*/
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phoblock/Model/image.dart';

class UserNotification {
  int notificationId;
  String notificationMessage;
  int notificationFlag;
  String notifierUsername;
  int notifierUserId;
  String notifiedUsername;
  int notifiedUserId;
  int notifiedPostId;
  ImageFile notifierDp;
  ImageFile notifiedDp;
  ImageFile notifiedPost;

  UserNotification({
    this.notificationId,
    this.notificationMessage,
    this.notificationFlag,
    this.notifierUsername,
    this.notifierUserId,
    this.notifiedUsername,
    this.notifiedUserId,
    this.notifiedPostId,
    this.notifierDp,
    this.notifiedDp,
    this.notifiedPost,
  });

  factory UserNotification.fromJson(Map<dynamic, dynamic> json1) {
    ImageFile notifierDp = ImageFile.fromJson(json1['notifierUsrImg']);
    ImageFile notifiedDp = ImageFile.fromJson(json1['notifiedUsrImg']);
    ImageFile notifiedPost = ImageFile.fromJson(json1['notifiedPostImage']);

    return UserNotification(
      notificationId: json1['id'],
      notificationMessage: json1['message'],
      notificationFlag: json1['notificationFlag'],
      notifierUsername: json1['notifierUsername'],
      notifierUserId: json1['notifierUserId'],
      notifiedUsername: json1['notifiedUsername'],
      notifiedUserId: json1['notifiedUserId'],
      notifiedPostId: json1['notifiedPostId'],
      notifierDp: notifierDp,
      notifiedDp: notifiedDp,
      notifiedPost: notifiedPost,
    );
  }

  static Future<List<UserNotification>> getUserNotification(int userId) async {
    ///Users/User/{userId}/Notifications
    final response = await http.get('http://127.0.0.1:8080/Users/User/' +
        userId.toString() +
        '/Notifications');

    if (response.statusCode == 200) {
      List<UserNotification> postList = List<UserNotification>.from(
          jsonDecode(response.body).map((x) => UserNotification.fromJson(x)));

      return postList;
    } else {
      return null;
    }
  }
}
