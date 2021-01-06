import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phoblock/Model/image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class Post {
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
}
