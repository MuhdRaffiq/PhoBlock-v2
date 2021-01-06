import 'package:flutter/material.dart';
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/post.dart';
import 'post_body.dart';
import 'post_footer.dart';
import 'post_header.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class CardPost extends StatelessWidget {
  final int loggedInId;
  final Post postFeed;

  CardPost(this.loggedInId, this.postFeed);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _showHeader(),
          _showBody(),
          _showFooter(),
        ],
      ),
    );
  }

  Widget _showHeader() {
    if (postFeed.ownerUsername == null && postFeed.postUserDp == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return PostHeader(loggedInId, postFeed);
    }
  }

  Widget _showBody() {
    if (postFeed.postPicture == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return PostBody(postFeed);
    }
  }

  Widget _showFooter() {
    if (postFeed == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return PostFooter();
    }
  }
}
