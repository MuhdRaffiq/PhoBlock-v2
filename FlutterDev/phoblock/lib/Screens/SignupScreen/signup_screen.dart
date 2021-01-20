import 'package:flutter/material.dart';
import 'package:phoblock/Screens/SignupScreen/Textbox/wallet_textbox.dart';
import 'Buttons/cancel_button.dart';
import 'Textbox/cfmpwd_textbox.dart';
import 'Textbox/dob_textbox.dart';
import 'Textbox/email_textbox.dart';
import 'Textbox/firstname_textbox.dart';
import 'header_text.dart';
import 'Textbox/lastname_textbox.dart';
import 'Textbox/pwd_textbox.dart';
import 'Buttons/signup_button.dart';
import 'Textbox/usrname_textbox.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
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
  final walletTextController = TextEditingController();

  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final dobFormKey = GlobalKey<FormState>();
  final usernameFormKey = GlobalKey<FormState>();
  final pwdFormKey = GlobalKey<FormState>();
  final cfmPwdFormKey = GlobalKey<FormState>();
  final walletFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
    dobTextController.dispose();
    usernameTextController.dispose();
    passwordTextController.dispose();
    confirmPwdTextController.dispose();
    walletTextController.dispose();
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
          WalletTextBox(walletTextController, walletFormKey),
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
