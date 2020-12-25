import 'package:flutter/material.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/app.dart';
import '../custom_outline_button.dart';
import '../../EditProfileScreen/edit_profile.dart';
import '../../VoteServices/vote_services.dart';
import '../../../style.dart';

class Buttons extends StatelessWidget {
  static const double _hPad = 20.0;
  PhoblockUser user;

  Buttons(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40.0,
            width: 180.0,
            child: CustomOutlineButton(
              text: "Vote/Service",
              color: hexToColor('#64B6A9'),
              onPressed: () => _voteServiceButtonTap(context),
            ),
          ),
          Container(
            height: 40.0,
            width: 180.0,
            child: CustomOutlineButton(
              text: "Edit Profile",
              color: Colors.black38,
              onPressed: () => _editProfileButtonTap(context),
            ),
          ),
        ],
      ),
    );
  }

  _voteServiceButtonTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VoteServices()));
  }

  _editProfileButtonTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditProfile(user: user)));
  }
}
