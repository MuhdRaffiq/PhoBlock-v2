import 'package:flutter/material.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import 'Button/submit_button.dart';
import 'EditProfileBody/edit_profile_body.dart';
import 'EditProfileHeader/edit_profile_header.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  PhoblockUser user;
  int userId;

  EditProfile({this.user, this.userId});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<EditProfileHeaderState> _editProfileHeader;

  TextEditingController firstNameTextController;
  TextEditingController lastNameTextController;
  TextEditingController usernameTextController;
  TextEditingController bioTextController;
  TextEditingController emailTextController;
  TextEditingController phoneTextController;
  TextEditingController birthdayTextController;

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
    birthdayTextController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _editProfileHeader = GlobalKey();

    if (widget.user.firstName != null) {
      firstNameTextController = TextEditingController();
      firstNameTextController.text = widget.user.firstName;
    } else {
      firstNameTextController = TextEditingController();
    }

    if (widget.user.lastName != null) {
      lastNameTextController = TextEditingController();
      lastNameTextController.text = widget.user.lastName;
    } else {
      lastNameTextController = TextEditingController();
    }

    if (widget.user.username != null) {
      usernameTextController = TextEditingController();
      usernameTextController.text = widget.user.username;
    } else {
      usernameTextController = TextEditingController();
    }

    if (widget.user.bio != null) {
      bioTextController = TextEditingController();
      bioTextController.text = widget.user.bio;
    } else {
      bioTextController = TextEditingController();
    }

    if (widget.user.emailAddress != null) {
      emailTextController = TextEditingController();
      emailTextController.text = widget.user.emailAddress;
    } else {
      emailTextController = TextEditingController();
    }

    if (widget.user.phone != null) {
      phoneTextController = TextEditingController();
      phoneTextController.text = widget.user.phone;
    } else {
      phoneTextController = TextEditingController();
    }

    if (widget.user.birthday != null) {
      birthdayTextController = TextEditingController();
      birthdayTextController.text = widget.user.birthday;
    } else {
      birthdayTextController = TextEditingController();
    }
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
            userDp: widget.user.profilePicture,
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
            loggedInUser: widget.user,
            userId: widget.userId,
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
