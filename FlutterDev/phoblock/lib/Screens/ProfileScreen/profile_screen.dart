import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'post_follower_following_section.dart';
import 'profile_gallery.dart';
import 'username_text_section.dart';
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
          ImageBanner("assets/images/postmalone.jpg"),
          UsernameTextSection('Post Malone'),
          PostFollowerFollowingSection(),
          ProfileGallery("assets/images/postmalone.jpg"),
          ProfileGallery("assets/images/postmalone.jpg"),
          ProfileGallery("assets/images/postmalone.jpg"),
        ],
      ),
    );
  }
}
