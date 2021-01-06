import 'package:flutter/material.dart';
import './follow_button.dart';
import './unfollow_button.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class MessageFollowButtons extends StatefulWidget {
  final int loggedInId;
  final int otherUserId;
  final String isFollowing;

  MessageFollowButtons(this.loggedInId, this.otherUserId, this.isFollowing);

  @override
  MessageFollowButtonState createState() => MessageFollowButtonState();
}

class MessageFollowButtonState extends State<MessageFollowButtons> {
  static const double _hPad = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getFollowUnfollowButton(),
          getMessageButton(),
          // Container(
          //   height: 40.0,
          //   width: 180.0,
          //   child: CustomOutlineButton(
          //     text: "Follow",
          //     color: hexToColor('#64B6A9'),
          //     onPressed: () {},
          //   ),
          // ),
          // Container(
          //   height: 40.0,
          //   width: 180.0,
          //   child: CustomOutlineButton(
          //     text: "Message",
          //     color: Colors.black38,
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget getFollowUnfollowButton() {
    if (widget.isFollowing == 'True') {
      return UnfollowButton(widget.loggedInId, widget.otherUserId);
    } else if (widget.isFollowing == 'False') {
      return FollowButton(widget.loggedInId, widget.otherUserId);
    } else {
      return Spacer();
    }
  }

  Widget getMessageButton() {
    if (widget.isFollowing == null) {
      return Spacer();
    } else {
      return Container(
        height: 40.0,
        width: 180.0,
        child: CustomOutlineButton(
          text: "Message",
          color: Colors.black38,
          onPressed: () {},
        ),
      );
    }
  }
}
