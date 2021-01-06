import 'package:flutter/material.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

class UnfollowButton extends StatelessWidget {
  final int loggedInId;
  final int otherUserId;

  UnfollowButton(this.loggedInId, this.otherUserId);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 180.0,
      child: CustomOutlineButton(
        text: "Unfollow",
        color: hexToColor('#64B6A9'),
        onPressed: () {
          PhoblockUser.unfollowUser(loggedInId, otherUserId).then((response) {
            if (response.statusCode == 200) {
            } else {}
          });
        },
      ),
    );
  }
}
