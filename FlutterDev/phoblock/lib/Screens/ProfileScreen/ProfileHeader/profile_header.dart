import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/image.dart';

class ProfileHeader extends StatelessWidget {
  //final String _imagePath;
  ImageFile userDp;
  int postLength;
  //static const double _hPad = 16.0;

  ProfileHeader(this.userDp, this.postLength);

  Widget avatarWidget() {
    if (userDp == null) {
      return Container(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 59.0,
          child: CircleAvatar(
            radius: 58.0,
            backgroundImage: AssetImage("assets/images/doe.jpg"),
          ),
        ),
      );
    } else {
      Uint8List imageBytes = base64.decode(userDp.imageString);

      return Container(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 59.0,
          child: CircleAvatar(
            radius: 58.0,
            backgroundImage: MemoryImage(imageBytes),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
      child: Row(
        children: [
          avatarWidget(),
          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Post',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  postLength.toString(),
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Follower',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '99',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Following',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '99',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
