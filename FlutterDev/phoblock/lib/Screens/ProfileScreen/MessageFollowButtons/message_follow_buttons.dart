import 'package:flutter/material.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/Screens/ProfileScreen/profile_screen.dart';
import './follow_button.dart';
import './unfollow_button.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class MessageFollowButtons extends StatefulWidget {
  final int loggedInId;
  final int otherUserId;
  final PhoblockUser phoblockUser;
  final String isFollowing;

  MessageFollowButtons({
    this.loggedInId,
    this.otherUserId,
    this.phoblockUser,
    this.isFollowing,
  });

  @override
  MessageFollowButtonState createState() => MessageFollowButtonState();
}

class MessageFollowButtonState extends State<MessageFollowButtons> {
  static const double _hPad = 20.0;
  bool isFollowing;

  @override
  void initState() {
    super.initState();

    if (widget.isFollowing == 'true') {
      isFollowing = true;
    } else if (widget.isFollowing == 'false') {
      isFollowing = false;
    } else {
      isFollowing = null;
    }
  }

  void switchIsFollowing(bool val) {
    setState(() {
      isFollowing = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getFollowUnfollowButton(),
          getMessageButton(),
        ],
      ),
    );
  }

  Widget getFollowUnfollowButton() {
    if (isFollowing == true) {
      return UnfollowButton(
        loggedInId: widget.loggedInId,
        otherUserId: widget.otherUserId,
        phoblockUser: widget.phoblockUser,
      );
    } else if (isFollowing == false) {
      return FollowButton(
        loggedInId: widget.loggedInId,
        otherUserId: widget.otherUserId,
        phoblockUser: widget.phoblockUser,
      );
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
