import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'image_banner.dart';
import 'login_button.dart';
import 'no_account.dart';
import 'password_textbox.dart';
import 'text_box.dart';
import 'title_section.dart';

class LoginSignupPage extends StatelessWidget {
  final loginCredentialController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("assets/images/phoblock_branding-09.png"),
          TitleSection("The decentralized photography platform"),
          TextBox(loginCredentialController),
          PasswordTextBox(passwordController),
          ForgotPassword(),
          LoginButton(loginCredentialController, passwordController),
          NoAccount(),
        ],
      ),
    );
  }
}
