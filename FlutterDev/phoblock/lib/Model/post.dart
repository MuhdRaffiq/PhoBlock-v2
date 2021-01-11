import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phoblock/Model/image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class Post {
  int postId;
  String postCaption;
  int numberDownload;
  int numberFavorite;
  int numberLiked;
  String dateCreated;
  String ownerUsername;
  ImageFile postPicture;
  ImageFile postUserDp;
  int postOwnerUserId;

  Post({
    this.postId,
    this.postCaption,
    this.numberDownload,
    this.numberFavorite,
    this.numberLiked,
    this.dateCreated,
    this.ownerUsername,
    this.postPicture,
    this.postUserDp,
    this.postOwnerUserId,
  });

  factory Post.fromJson(Map<dynamic, dynamic> json) {
    ImageFile postImage = ImageFile.fromJson(json['postPicture']);
    ImageFile owner = ImageFile.fromJson(json['userDp']);

    return Post(
      postId: json['id'],
      postCaption: json['postCaption'],
      numberDownload: json['numberDownload'],
      numberFavorite: json['numberFavorite'],
      numberLiked: json['numberLiked'],
      dateCreated: json['dateCreated'],
      ownerUsername: json['ownerUsername'],
      postPicture: postImage,
      postUserDp: owner,
      postOwnerUserId: json['ownerUserId'],
    );
  }

  Map toJson() => {
        'postCaption': postCaption,
        'numberDownload': numberDownload,
        'numberFavorite': numberFavorite,
        'numberLiked': numberLiked,
        'dateCreated': dateCreated,
      };

  static Future<List<Post>> fetchAllPost() async {
    final response = await http.get('http://127.0.0.1:8080/Posts');

    if (response.statusCode == 200) {
      List<Post> postList = List<Post>.from(
          jsonDecode(response.body).map((x) => Post.fromJson(x)));

      return postList;
    } else {
      return null;
    }
  }

  static Future<bool> isPostLiked(int userId, int postId) async {
    String path =
        "/users/" + userId.toString() + "/Likes/Posts/" + postId.toString();

    final response = await http.get("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      if (response.body == 'true') {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  static Future<bool> likePost(int userId, int postId) async {
    String path =
        "/Users/" + userId.toString() + "/Liked/Post/" + postId.toString();

    final response = await http.post("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> unlikePost(int userId, int postId) async {
    String path =
        "/Users/" + userId.toString() + "/Unliked/Post/" + postId.toString();

    final response = await http.post("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> isFavoritePost(int userId, int postId) async {
    String path =
        "/Users/" + userId.toString() + "/Favorites/Posts/" + postId.toString();

    final response = await http.get("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      if (response.body == 'true') {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  static Future<bool> favoritePost(int userId, int postId) async {
    String path =
        "/Users/" + userId.toString() + "/Favorite/Posts/" + postId.toString();

    final response = await http.post("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> unfavoritePost(int userId, int postId) async {
    String path =
        "/Users/" + userId.toString() + "/UnFavorite/Post/" + postId.toString();

    final response = await http.post("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      return true;
    } else {
      return true;
    }
  }

  static Future<bool> isDownloadPost(int userId, int postId) async {
    String path =
        "/users/" + userId.toString() + "/Downloads/Posts/" + postId.toString();

    final response = await http.get("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      if (response.body == 'true') {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  static Future<bool> downloadPost(int userId, int postId) async {
    String path =
        "/Users/" + userId.toString() + "/Download/Post/" + postId.toString();

    final response = await http.post("http://127.0.0.1:8080" + path);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
