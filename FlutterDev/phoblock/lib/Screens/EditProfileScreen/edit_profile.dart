import 'package:flutter/material.dart';
import 'Button/submit_button.dart';
import 'EditProfileBody/edit_profile_body.dart';
import 'EditProfileHeader/edit_profile_header.dart';
import '../../style.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<EditProfileHeaderState> _editProfileHeader;
  TextEditingController usernameTextController;
  TextEditingController bioTextController;
  TextEditingController emailTextController;
  TextEditingController phoneTextController;
  TextEditingController birthdayTextController;

  GlobalKey<FormState> usernameFormKey;
  GlobalKey<FormState> bioFormKey;
  GlobalKey<FormState> emailFormKey;
  GlobalKey<FormState> phoneFormKey;
  GlobalKey<FormState> birthdayFormKey;

  @override
  void initState() {
    super.initState();
    _editProfileHeader = GlobalKey();

    usernameTextController = TextEditingController();
    bioTextController = TextEditingController();
    emailTextController = TextEditingController();
    phoneTextController = TextEditingController();
    birthdayTextController = TextEditingController();

    usernameFormKey = GlobalKey<FormState>();
    bioFormKey = GlobalKey<FormState>();
    emailFormKey = GlobalKey<FormState>();
    phoneFormKey = GlobalKey<FormState>();
    birthdayFormKey = GlobalKey<FormState>();
  }

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
          EditProfileHeader(
            key: _editProfileHeader,
            imagePath: "assets/images/postmalone.jpg",
          ), //
          EditProfileBody(),
          SubmitButton(),
        ],
      ),
    );
  }
}
