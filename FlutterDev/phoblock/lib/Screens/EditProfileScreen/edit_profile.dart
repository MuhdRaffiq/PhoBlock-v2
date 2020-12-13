import 'package:flutter/material.dart';
import 'Button/submit_button.dart';
import 'EditProfileBody/edit_profile_body.dart';
import 'EditProfileHeader/edit_profile_header.dart';
import '../../style.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EditProfileHeader("assets/images/postmalone.jpg"),
          EditProfileBody(),
          SubmitButton(),
        ],
      ),
    );
  }
}
