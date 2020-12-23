import 'package:phoblock/Model/image.dart';

class LoggedInUser {
  String firstName;
  String lastName;
  String emailAddress;
  String birthday;
  String username;
  String dateCreated;
  String bio;
  ImageFile profilePicture;

  LoggedInUser(this.firstName, this.lastName, this.emailAddress, this.birthday,
      this.username, this.dateCreated, this.bio, this.profilePicture);

  Map toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'birthday': birthday,
        'username': username,
        'bio': bio,
        'profilePicture': profilePicture,
        'dateCreated': dateCreated,
      };
}
