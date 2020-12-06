import 'package:flutter/material.dart';
import 'Screens/LoginScreen/login_signup_page.dart';
import 'style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignupPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(headline6: AppBarTextStyle),
        ),
        textTheme: TextTheme(bodyText1: SubtitleTextStyle),
      ),
    );
  }
}
