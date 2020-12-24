import 'package:flutter/material.dart';
import 'Widgets/forgot_password.dart';
import 'Widgets/image_banner.dart';
import 'login_button.dart';
import 'Widgets/no_account.dart';
import 'Textbox/password_textbox.dart';
import 'Textbox/text_box.dart';
import 'Widgets/title_section.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final loginCredentialController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    loginCredentialController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
