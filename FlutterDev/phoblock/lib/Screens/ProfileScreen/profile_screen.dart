import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/Screens/ProfileScreen/MessageFollowButtons/message_follow_buttons.dart';
import 'ButtonSections/buttons.dart';
import 'ProfileBody/profile_body.dart';
import 'ProfileHeader/profile_header.dart';
import 'ProfileHeader/username_text_section.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class ProfileScreen extends StatefulWidget {
  final int userId;
  final int otherUserId;

  ProfileScreen({this.userId, this.otherUserId});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  PhoblockUser phoblockUser;

  @override
  void initState() {
    super.initState();

    if (widget.otherUserId == null) {
      PhoblockUser.fetchUser(widget.userId).then((user) {
        setState(() {
          phoblockUser = user;
        });
      });
    } else {
      PhoblockUser.fetchUser(widget.otherUserId).then((user) {
        setState(() {
          phoblockUser = user;
        });
      });
    }
  }

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
          _showProfileHeader(),
          _showTextSection(),
          _showButtons(),
          _showProfileBody(),
        ],
      ),
    );
  }

  Widget _showProfileHeader() {
    if (phoblockUser == null) {
      return Spacer();
    } else {
      return ProfileHeader(
        phoblockUser.profilePicture,
        phoblockUser.userPosts.length,
      );
    }
  }

  Widget _showTextSection() {
    if (phoblockUser == null) {
      return Spacer();
    } else {
      return UsernameTextSection(phoblockUser.username, phoblockUser.bio);
    }
  }

  Widget _showButtons() {
    if (widget.otherUserId != null) {
      if (phoblockUser == null) {
        return Spacer();
      } else {
        return MessageFollowButtons();
      }
    } else {
      if (phoblockUser == null) {
        return Spacer();
      } else {
        return Buttons(phoblockUser, widget.userId);
      }
    }
  }

  Widget _showProfileBody() {
    if (phoblockUser == null) {
      return Spacer();
    } else {
      return ProfileBody(phoblockUser.userPosts);
    }
  }
}
