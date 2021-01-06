import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:http/http.dart' as http;
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/Screens/Navigation/navigation_bar.dart';
import 'package:phoblock/app.dart';
import 'custom_outline_button.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class LoginButton extends StatefulWidget {
  final loginCredentialController;
  final passwordController;

  LoginButton(
    this.loginCredentialController,
    this.passwordController,
  );

  @override
  LoginButtonState createState() => LoginButtonState();
}

class LoginButtonState extends State<LoginButton> {
  static const double _hPad = 40.0;
  PhoblockUser user;

  @override
  void initState() {
    super.initState();
    user = new PhoblockUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          child: CustomOutlineButton(
            text: "Log in",
            color: hexToColor('#64B6A9'),
            onPressed: () {
              String loginString = widget.loginCredentialController.text;
              String passwordString = widget.passwordController.text;

              login(loginString, passwordString).then((response) {
                if (response.statusCode == 200) {
                  FToast.toast(
                    context,
                    toast: _showToast(
                      context,
                      'Login Successful', //jsonDecode(response.body)["detailMessage"],
                      hexToColor('#00c16a'),
                      false,
                    ),
                  );

                  int userId = int.parse(response.body);

                  Timer(Duration(seconds: 1), () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AfterLoginRoute,
                      (Route<dynamic> route) => false,
                      arguments: {"usedID": userId},
                    );
                  });
                } else if (response.statusCode == 404) {
                  FToast.toast(
                    context,
                    toast: _showToast(
                      context,
                      jsonDecode(response.body)["detailMessage"],
                      Colors.red,
                      true,
                    ),
                  );
                } else {
                  FToast.toast(
                    context,
                    toast: _showToast(
                      context,
                      'Internal Server Error',
                      Colors.red,
                      true,
                    ),
                  );
                }
              });
            },
          ),
        )
      ],
    );
  }

  Future<http.Response> login(String loginCredential, String password) async {
    String trimmedLoginCredential = loginCredential.trim();

    final http.Response response =
        await http.post('http://127.0.0.1:8080/AuthenticateLogin',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'emailAddress': trimmedLoginCredential,
              'password': password,
            }));

    return response;
  }

  Future<void> fetchUser(String usernameLoggedIn) async {
    final response =
        await http.get('http://127.0.0.1:8080/Users/User/' + usernameLoggedIn);

    if (response.statusCode == 200) {
      setState(() {
        user = PhoblockUser.fromJson(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load User');
    }
  }

  Widget _showToast(
      BuildContext buildContext, String text, Color color, bool isFailed) {
    Widget toast;

    if (isFailed == true) {
      toast = Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 35.0),
            width: MediaQuery.of(buildContext).size.width - 80,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.2, color: Colors.black),
                bottom: BorderSide(width: 0.2, color: Colors.black),
                left: BorderSide(width: 0.2, color: Colors.black),
                right: BorderSide(width: 0.2, color: Colors.black),
              ),
              borderRadius: BorderRadius.circular(5.0),
              color: color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.block_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      toast = Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 35.0),
            width: MediaQuery.of(buildContext).size.width - 80,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.2, color: Colors.black),
                bottom: BorderSide(width: 0.2, color: Colors.black),
                left: BorderSide(width: 0.2, color: Colors.black),
                right: BorderSide(width: 0.2, color: Colors.black),
              ),
              borderRadius: BorderRadius.circular(5.0),
              color: color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return toast;
  }
}
