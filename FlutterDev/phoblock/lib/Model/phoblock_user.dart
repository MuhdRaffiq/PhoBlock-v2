import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/post.dart';

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
  });

  factory PhoblockUser.fromJson(Map<dynamic, dynamic> json1) {
    List<Post> postList =
        List<Post>.from(json1['userPost'].map((x) => Post.fromJson(x)));

    List<Post> favList =
        List<Post>.from(json1['userFavorites'].map((x) => Post.fromJson(x)));

    ImageFile userDp = ImageFile.fromJson(json1['userDefaultPicture']);

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
}
