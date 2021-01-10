import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import '../../../app.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

class FollowButton extends StatefulWidget {
  final int loggedInId;
  final int otherUserId;
  final PhoblockUser phoblockUser;

  FollowButton({this.loggedInId, this.otherUserId, this.phoblockUser});

  @override
  FollowButtonState createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton> {
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
        text: "Follow",
        color: hexToColor('#64B6A9'),
        onPressed: () {
          PhoblockUser.followUser(widget.loggedInId, widget.otherUserId)
              .then((response) {
            if (response.statusCode == 200) {
              FToast.toast(
                context,
                toast: showToast(
                  context,
                  'Following ' + widget.phoblockUser.username,
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
