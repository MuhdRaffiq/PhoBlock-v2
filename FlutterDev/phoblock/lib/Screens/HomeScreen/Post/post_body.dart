import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/post.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostBody extends StatelessWidget {
  final Post postFeed;

  PostBody(this.postFeed);

  @override
  Widget build(BuildContext context) {
    return _showPostBody();
  }

  Widget _showPostBody() {
    if (postFeed.postPicture == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
        constraints: BoxConstraints.expand(
          height: 400.0,
        ),
        child: Image.memory(
          base64.decode(postFeed.postPicture.imageString),
          fit: BoxFit.cover, //BoxFit.fill,
        ),
      );
    }
  }
}
