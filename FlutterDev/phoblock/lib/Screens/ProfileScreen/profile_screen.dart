import 'package:flutter/material.dart';
import 'EditProfileButton/edit_profile_button.dart';
import 'ProfileHeader/page_divider.dart';
import 'ProfileGallery/profile_gallery.dart';
import 'ProfileHeader/profile_header.dart';
import 'ProfileHeader/username_text_section.dart';
import '../../style.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileHeader("assets/images/postmalone.jpg"),
          UsernameTextSection('Post Malone', 'I am Post Malone'),
          EditProfileButton(),
          PageDivider(),
          ProfileGallery("assets/images/postmalone.jpg"),
        ],
      ),
    );
  }
}
