import 'package:flutter/material.dart';
import 'package:phoblock/pages/homepage.dart';
import 'package:phoblock/pages/login_signup_page.dart';
import 'package:phoblock/pages/profile_page.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoBlock',
      navigatorKey: navigatorKey,
      //TODO: have ternary operator deciding if there's user token saved,
      // if yes show homepage, or else log in & sign up page
      home: SafeArea(
        child: LogIn_SignUp_Page(),
      ),
      routes: <String, WidgetBuilder>{
        'homepage': (BuildContext context) => HomePage(),
        'profilepage': (BuildContext context) => Profile_Page(),
        // 'homepage':(BuildContext context) => HomePage(),
      },
    );
  }
}
