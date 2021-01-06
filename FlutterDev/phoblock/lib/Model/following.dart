import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phoblock/Model/image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class Following {
  String username;
  int followingId;
  ImageFile followingDp;

  Following({this.username, this.followingId, this.followingDp});

  factory Following.fromJson(Map<dynamic, dynamic> json1) {
    ImageFile followingDp =
        ImageFile.fromJson(json1['followingDefaultPicture']);

    return Following(
      username: json1['username'],
      followingId: json1['followingId'],
      followingDp: followingDp,
    );
  }

  static Future<List<Following>> fetchUserFollowings(int id) async {
    final response =
        await http.get('http://127.0.0.1:8080/Users/User/Id/' + id.toString());

    if (response.statusCode == 200) {
      List<Following> followingList = List<Following>.from(
          jsonDecode(response.body).map((x) => Following.fromJson(x)));

      return followingList;
    } else {
      return null;
    }
  }

  static Future<String> isFollowing(int loggedInId, int anotherUserId) async {
    final response = await http.get('http://127.0.0.1:8080/Users/User/' +
        loggedInId.toString() +
        '/Following/' +
        anotherUserId.toString());

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
