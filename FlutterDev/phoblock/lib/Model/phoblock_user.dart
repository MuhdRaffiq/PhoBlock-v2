import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phoblock/Model/follower.dart';
import 'package:phoblock/Model/following.dart';
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/notification.dart';
import 'package:phoblock/Model/post.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PhoblockUser {
  int userId;
  String firstName;
  String lastName;
  String emailAddress;
  String birthday;
  String username;
  String dateCreated;
  String bio;
  String phone;
  ImageFile profilePicture;
  List<Post> userPosts;
  List<Post> userFavs;
  List<Post> userLikes;
  List<Post> userDownloads;
  List<Follower> followers;
  List<Following> followings;
  List<UserNotification> notifications;

  PhoblockUser({
    this.userId,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.birthday,
    this.username,
    this.dateCreated,
    this.bio,
    this.phone,
    this.profilePicture,
    this.userPosts,
    this.userFavs,
    this.userLikes,
    this.userDownloads,
    this.followers,
    this.followings,
    this.notifications,
  });

  factory PhoblockUser.fromJson(Map<dynamic, dynamic> json1) {
    List<Post> postList =
        List<Post>.from(json1['userPost'].map((x) => Post.fromJson(x)));

    List<Post> favList =
        List<Post>.from(json1['favoritePosts'].map((x) => Post.fromJson(x)));

    List<Post> likedList =
        List<Post>.from(json1['likedPost'].map((x) => Post.fromJson(x)));

    List<Post> downloadedList =
        List<Post>.from(json1['downloadedPosts'].map((x) => Post.fromJson(x)));

    ImageFile userDp = ImageFile.fromJson(json1['userDefaultPicture']);

    List<Follower> followersList = List<Follower>.from(
        json1['followers'].map((x) => Follower.fromJson(x)));

    List<Following> followingsList = List<Following>.from(
        json1['followings'].map((x) => Following.fromJson(x)));

    List<UserNotification> notificationList = List<UserNotification>.from(
        json1['notifications'].map((x) => UserNotification.fromJson(x)));

    return PhoblockUser(
      userId: json1['id'],
      firstName: json1['firstName'],
      lastName: json1['lastName'],
      emailAddress: json1['emailAddress'],
      birthday: json1['birthDate'],
      username: json1['userName'],
      dateCreated: json1['dateCreated'],
      bio: json1['bio'],
      phone: json1['phoneNumber'],
      profilePicture: userDp,
      userPosts: postList,
      userFavs: favList,
      userLikes: likedList,
      userDownloads: downloadedList,
      followers: followersList,
      followings: followingsList,
      notifications: notificationList,
    );
  }

  Map toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'birthDate': birthday,
        'userName': username,
        'bio': bio,
        'profilePicture': profilePicture,
        'dateCreated': dateCreated,
      };

  static Future<PhoblockUser> fetchUser(int id) async {
    final response =
        await http.get('http://127.0.0.1:8080/Users/User/Id/' + id.toString());

    if (response.statusCode == 200) {
      return PhoblockUser.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<http.Response> followUser(
      int loggedInId, int otherUserId) async {
    final response = await http.post('http://127.0.0.1:8080/Users/User/' +
        loggedInId.toString() +
        '/Follow/' +
        otherUserId.toString());

    return response;
  }

  static Future<http.Response> unfollowUser(
      int loggedInId, int otherUserId) async {
    final response = await http.post('http://127.0.0.1:8080/Users/User/' +
        loggedInId.toString() +
        '/Unfollow/' +
        otherUserId.toString());

    return response;
  }
}
