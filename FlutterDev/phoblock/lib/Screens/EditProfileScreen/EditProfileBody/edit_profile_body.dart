import 'package:flutter/material.dart';
import 'Textbox/bio_field.dart';
import 'Textbox/birthday_field.dart';
import 'Textbox/email_field.dart';
import 'Textbox/firstname_field.dart';
import 'Textbox/lastname_field.dart';
import 'Textbox/phone_field.dart';
import 'Textbox/username_field.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class EditProfileBody extends StatefulWidget {
  final firstNameTextController;
  final lastNameTextController;
  final usernameTextController;
  final bioTextController;
  final emailTextController;
  final phoneTextController;
  final birthdayTextController;

  final firstNameFormKey;
  final lastNameFormKey;
  final usernameFormKey;
  final bioFormKey;
  final emailFormKey;
  final phoneFormKey;
  final birthdayFormKey;

  EditProfileBody({
    this.firstNameTextController,
    this.firstNameFormKey,
    this.lastNameTextController,
    this.lastNameFormKey,
    this.usernameTextController,
    this.usernameFormKey,
    this.bioTextController,
    this.bioFormKey,
    this.emailTextController,
    this.emailFormKey,
    this.phoneTextController,
    this.phoneFormKey,
    this.birthdayTextController,
    this.birthdayFormKey,
  });

  @override
  _EditProfileBodyState createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 3.0, color: Colors.black45),
          bottom: BorderSide(width: 3.0, color: Colors.black45),
        ),
      ),
      child: Column(
        children: [
          FirstNameField(
              widget.firstNameTextController, widget.firstNameFormKey),
          LastNameField(widget.lastNameTextController, widget.lastNameFormKey),
          UsernameField(widget.usernameTextController, widget.usernameFormKey),
          BioField(widget.bioTextController, widget.bioFormKey),
          EmailField(widget.emailTextController, widget.emailFormKey),
          PhoneField(widget.phoneTextController, widget.phoneFormKey),
          BirthdayField(widget.birthdayTextController, widget.birthdayFormKey),
        ],
      ),
    );
  }
}
