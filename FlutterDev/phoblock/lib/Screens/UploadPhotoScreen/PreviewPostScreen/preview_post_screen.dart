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

/*
  Author: Muhammad Khairi Norizan
*/
class PreviewPostScreen extends StatefulWidget {
  final File imageFile;
  final int userId;

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
                _showBody(),
                _showFooter(),
                _showCaptionTextBox(),
              ],
            ),
          ),
          _showPostButton(),
          _showCancelButton(),
        ],
      ),
    );
  }

  Widget _showHeader() {
    if (phoblockUser == null) {
      return Spacer();
    } else {
      return PostHeader(phoblockUser);
    }
  }

  Widget _showBody() {
    if (widget.imageFile == null) {
      return Spacer();
    } else {
      return PostBody(widget.imageFile);
    }
  }

  Widget _showFooter() {
    if (_showBody() != Spacer() && _showHeader() != Spacer()) {
      return PostFooter();
    } else {
      return Spacer();
    }
  }

  Widget _showCaptionTextBox() {
    if (_showBody() != Spacer() && _showHeader() != Spacer()) {
      return CaptionTextBox(captionController);
    } else {
      return Spacer();
    }
  }

  Widget _showPostButton() {
    if (widget.imageFile == null && widget.userId == null) {
      return Spacer();
    } else {
      return PostButton(widget.userId, widget.imageFile, captionController);
    }
  }

  Widget _showCancelButton() {
    if (widget.userId == null) {
      return Spacer();
    } else {
      return CancelButton(widget.userId);
    }
  }
}
