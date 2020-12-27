import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/phoblock_user.dart';

class PostHeader extends StatelessWidget {
  final PhoblockUser phoblockUser;

  PostHeader(this.phoblockUser);

  Widget _showHeader() {
    if (phoblockUser.profilePicture == null) {
      return Container(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 21.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage("assets/images/doe.jpg"),
          ),
        ),
      );
    } else {
      return Container(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 21.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: MemoryImage(
                base64.decode(phoblockUser.profilePicture.imageString)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Row(
        children: [
          _showHeader(),
          Container(
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: new GestureDetector(
              onTap: () {},
              child: Text(
                phoblockUser.username, //usernameLoggedIn, //'Post',
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
