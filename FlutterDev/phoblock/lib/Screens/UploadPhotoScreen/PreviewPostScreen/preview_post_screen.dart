import 'package:phoblock/Model/phoblock_user.dart';

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
class PreviewPostScreen extends StatefulWidget {
  File imageFile;
  int userId;

  PreviewPostScreen(this.imageFile, this.userId);

  @override
  PreviewPostScreenState createState() => PreviewPostScreenState();
}

// ignore: must_be_immutable
class PreviewPostScreenState extends State<PreviewPostScreen> {
  PhoblockUser phoblockUser;
  final captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    PhoblockUser.fetchUser(widget.userId).then((user) {
      setState(() {
        phoblockUser = user;
      });
    });
  }

  Widget _showHeader() {
    if (phoblockUser == null) {
      return Spacer();
    } else {
      return PostHeader(phoblockUser);
    }
  }

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
                _showHeader(),
                PostBody(widget.imageFile), // PostBody(this.imageFile),
                PostFooter(),
                CaptionTextBox(captionController),
              ],
            ),
          ),
          PostButton(widget.userId, widget.imageFile, captionController),
          CancelButton(widget.userId),
        ],
      ),
    );
  }
}
