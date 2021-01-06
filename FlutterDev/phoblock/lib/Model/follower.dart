import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phoblock/Model/image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class Follower {
  String username;
  int followerId;
  ImageFile followerDp;

  Follower({this.username, this.followerId, this.followerDp});

  factory Follower.fromJson(Map<dynamic, dynamic> json1) {
    ImageFile followerDp = ImageFile.fromJson(json1['followerDefaultPicture']);

    return Follower(
      username: json1['username'],
      followerId: json1['followerId'],
      followerDp: followerDp,
    );
  }

  static Future<List<Follower>> fetchUserFollowers(int id) async {
    final response =
        await http.get('http://127.0.0.1:8080/Users/User/Id/' + id.toString());

    if (response.statusCode == 200) {
      List<Follower> followerList = List<Follower>.from(
          jsonDecode(response.body).map((x) => Follower.fromJson(x)));

      return followerList;
    } else {
      return null;
    }
  }
}
