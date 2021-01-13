import 'package:flutter/material.dart';
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/post.dart';
import 'post_body.dart';
import 'post_header.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class CardPost extends StatefulWidget {
  final int loggedInId;
  final Post postFeed;

  CardPost(this.loggedInId, this.postFeed);

  @override
  CardPostState createState() => CardPostState();
}

class CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _showHeader(),
          _showBody(),
        ],
      ),
    );
  }

  Widget _showHeader() {
    if (widget.postFeed.ownerUsername == null &&
        widget.postFeed.postUserDp == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return PostHeader(widget.loggedInId, widget.postFeed);
    }
  }

  Widget _showBody() {
    if (widget.postFeed.postPicture == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return PostBody(
        loggedInId: widget.loggedInId,
        postFeed: widget.postFeed,
      );
    }
  }
}
