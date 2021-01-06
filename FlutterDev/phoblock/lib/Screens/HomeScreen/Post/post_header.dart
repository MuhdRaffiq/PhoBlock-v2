import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/post.dart';
import 'package:phoblock/app.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostHeader extends StatelessWidget {
  final int loggedInId;
  final Post postFeed;

  PostHeader(this.loggedInId, this.postFeed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Row(
        children: [
          _ownerAvatar(context),
          _ownerUsername(context),
        ],
      ),
    );
  }

  Widget _ownerAvatar(context) {
    if (postFeed.postUserDp == null) {
      return GestureDetector(
        onTap: () => _onAnotherAccountTap(context),
        child: Container(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 21.0,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("assets/images/doe.jpg"),
            ),
          ),
        ),
      );
    } else {
      Uint8List imageBytes = base64.decode(postFeed.postUserDp.imageString);

      return GestureDetector(
        onTap: () => _onAnotherAccountTap(context),
        child: Container(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 21.0,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: MemoryImage(imageBytes),
            ),
          ),
        ),
      );
    }
  }

  Widget _ownerUsername(context) {
    if (postFeed.ownerUsername == null) {
      return SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: new GestureDetector(
          onTap: () => _onAnotherAccountTap(context),
          child: Text(
            postFeed.ownerUsername, //'Post',
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  _onAnotherAccountTap(BuildContext context) {
    Navigator.pushNamed(context, ProfileRoute, arguments: {
      "userId": loggedInId,
      "otherUserId": postFeed.postOwnerUserId
    });
  }
}
