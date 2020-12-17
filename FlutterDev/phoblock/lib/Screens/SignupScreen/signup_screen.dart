import 'package:flutter/material.dart';
import 'cancel_button.dart';
import 'cfmpwd_textbox.dart';
import 'dob_textbox.dart';
import 'email_textbox.dart';
import 'firstname_textbox.dart';
import 'header_text.dart';
import 'lastname_textbox.dart';
import 'pwd_textbox.dart';
import 'signup_button.dart';
import 'usrname_textbox.dart';
import '../../style.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final dobTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPwdTextController = TextEditingController();

  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final dobFormKey = GlobalKey<FormState>();
  final usernameFormKey = GlobalKey<FormState>();
  final pwdFormKey = GlobalKey<FormState>();
  final cfmPwdFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
    dobTextController.dispose();
    usernameTextController.dispose();
    passwordTextController.dispose();
    confirmPwdTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhoBlock'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderText("Create your account"),
          FirstNameTextBox(firstNameTextController, firstNameFormKey),
          LastNameTextBox(lastNameTextController, lastNameFormKey),
          EmailTextBox(emailTextController, emailFormKey),
          DOBTextBox(dobTextController, dobFormKey),
          UsernameTextBox(usernameTextController),
          PasswordTextBox(passwordTextController, pwdFormKey),
          ConfirmPasswTextBox(
              confirmPwdTextController, passwordTextController, cfmPwdFormKey),
          SignupButton(
              firstNameTextController,
              firstNameFormKey,
              lastNameTextController,
              lastNameFormKey,
              emailTextController,
              emailFormKey,
              dobTextController,
              dobFormKey,
              usernameTextController,
              passwordTextController,
              pwdFormKey,
              cfmPwdFormKey),
          CancelButton(),
        ],
      ),
    );
  }
}
