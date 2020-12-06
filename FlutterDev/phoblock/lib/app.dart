import 'package:flutter/material.dart';
import 'Screens/LoginScreen/login_signup_page.dart';
import 'Screens/SignupScreen/signup_screen.dart';
import 'style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
      // home: LoginSignupPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: AppBarTextStyle),
        ),
        textTheme: TextTheme(bodyText1: SubtitleTextStyle),
      ),
    );
  }
}
