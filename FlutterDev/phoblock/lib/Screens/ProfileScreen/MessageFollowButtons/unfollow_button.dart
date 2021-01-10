import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/app.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

class UnfollowButton extends StatefulWidget {
  final int loggedInId;
  final int otherUserId;
  final PhoblockUser phoblockUser;

  UnfollowButton({
    this.loggedInId,
    this.otherUserId,
    this.phoblockUser,
  });

  @override
  UnfollowButtonState createState() => UnfollowButtonState();
}

class UnfollowButtonState extends State<UnfollowButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 180.0,
      child: CustomOutlineButton(
        text: "Unfollow",
        color: hexToColor('#64B6A9'),
        onPressed: () {
          PhoblockUser.unfollowUser(widget.loggedInId, widget.otherUserId)
              .then((response) {
            if (response.statusCode == 200) {
              FToast.toast(
                context,
                toast: showToast(
                  context,
                  'Unfollowed ' + widget.phoblockUser.username,
                  hexToColor('#00c16a'),
                  false,
                ),
              );

              Navigator.popAndPushNamed(context, ProfileRoute, arguments: {
                "userId": widget.loggedInId,
                "otherUserId": widget.otherUserId
              });
            } else {
              FToast.toast(
                context,
                toast: showToast(
                  context,
                  'Server Error',
                  Colors.red,
                  true,
                ),
              );
            }
          });
        },
      ),
    );
  }
}
