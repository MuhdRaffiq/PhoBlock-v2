import 'cancel_button.dart';
import 'caption_textbox.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'PreviewPostBody/post_body.dart';
import 'PreviewPostFooter/post_footer.dart';
import 'PreviewPostHeader/post_header.dart';
import 'post_button.dart';
import '../../../style.dart';

// ignore: must_be_immutable
class PreviewPostScreen extends StatelessWidget {
  File imageFile;
  String usernameLoggedIn;
  final captionController = TextEditingController();

  PreviewPostScreen(this.imageFile, this.usernameLoggedIn);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Post'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                PostHeader(
                  "assets/images/postmalone.jpg",
                  this.usernameLoggedIn,
                ),
                PostBody(this.imageFile),
                PostFooter(),
                CaptionTextBox(captionController),
              ],
            ),
          ),
          PostButton(usernameLoggedIn, imageFile, captionController),
          CancelButton(usernameLoggedIn),
        ],
      ),
    );
  }
}
