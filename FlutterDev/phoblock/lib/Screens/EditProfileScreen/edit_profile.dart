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

  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final bioTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final birthdayTextController = TextEditingController();

  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();
  final usernameFormKey = GlobalKey<FormState>();
  final bioFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final birthdayFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    usernameTextController.dispose();
    bioTextController.dispose();
    emailTextController.dispose();
    phoneTextController.dispose();
    usernameTextController.dispose();
    birthdayTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _editProfileHeader = GlobalKey();
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
          ),
          EditProfileBody(
            firstNameTextController: firstNameTextController,
            firstNameFormKey: firstNameFormKey,
            lastNameTextController: lastNameTextController,
            lastNameFormKey: lastNameFormKey,
            usernameTextController: usernameTextController,
            usernameFormKey: usernameFormKey,
            bioTextController: bioTextController,
            bioFormKey: bioFormKey,
            emailTextController: emailTextController,
            emailFormKey: emailFormKey,
            phoneTextController: phoneTextController,
            phoneFormKey: phoneFormKey,
            birthdayTextController: birthdayTextController,
            birthdayFormKey: birthdayFormKey,
          ),
          SubmitButton(
            imageKey: _editProfileHeader,
            loggedInUsername: 'johncena',
            firstNameTextController: firstNameTextController,
            firstNameFormKey: firstNameFormKey,
            lastNameTextController: lastNameTextController,
            lastNameFormKey: lastNameFormKey,
            usernameTextController: usernameTextController,
            usernameFormKey: usernameFormKey,
            bioTextController: bioTextController,
            bioFormKey: bioFormKey,
            emailTextController: emailTextController,
            emailFormKey: emailFormKey,
            phoneTextController: phoneTextController,
            phoneFormKey: phoneFormKey,
            birthdayTextController: birthdayTextController,
            birthdayFormKey: birthdayFormKey,
          ),
        ],
      ),
    );
  }
}
