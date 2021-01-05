import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class SignupButton extends StatelessWidget {
  final firstNameController;
  final lastNameController;
  final emailController;
  final dobController;
  final usernameController;
  final passwController;

  final firstNameFormKey;
  final lastNameFormKey;
  final emailFormKey;
  final dobFormKey;
  final pwdFormKey;
  final cfmPwdFormKey;
  static const double _hPad = 40.0;

  SignupButton(
    this.firstNameController,
    this.firstNameFormKey,
    this.lastNameController,
    this.lastNameFormKey,
    this.emailController,
    this.emailFormKey,
    this.dobController,
    this.dobFormKey,
    this.usernameController,
    this.passwController,
    this.pwdFormKey,
    this.cfmPwdFormKey,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.2),
          child: CustomOutlineButton(
            text: "Create Account",
            color: hexToColor('#64B6A9'),
            onPressed: () {
              bool firstName = firstNameFormKey.currentState.validate();
              bool lastName = lastNameFormKey.currentState.validate();
              bool email = emailFormKey.currentState.validate();
              bool dob = dobFormKey.currentState.validate();
              bool pwd = pwdFormKey.currentState.validate();
              bool cfmPwd = cfmPwdFormKey.currentState.validate();

              String firstNameStr = firstNameController.text;
              String lastNameStr = lastNameController.text;
              String emailStr = emailController.text;
              String dobStr = dobController.text;
              String usrnameStr = usernameController.text;
              String pwdStr = passwController.text;

              if (firstName && lastName && email && dob && pwd && cfmPwd) {
                createUser(firstNameStr, lastNameStr, emailStr, dobStr,
                        usrnameStr, pwdStr)
                    .then((response) {
                  if (response.statusCode == 200) {
                    FToast.toast(
                      context,
                      toast: _showToast(
                        context,
                        'Your Account is Successfully Registered',
                        hexToColor('#00c16a'), //hexToColor('#64B6A9'),
                        false,
                      ),
                    );

                    Timer(Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  } else if (response.statusCode == 406) {
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
                        'Server Failed',
                        Colors.red,
                        true,
                      ),
                    );
                  }
                });
              }
            },
          ),
        )
      ],
    );
  }

  Future<http.Response> createUser(
      String firstName,
      String lastName,
      String emailAddress,
      String birthdate,
      String userName,
      String userPassword) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    String trimmedFirstName = firstName.trim();
    String trimmedLastName = lastName.trim();
    String trimmedEmail = emailAddress.trim();

    final http.Response response =
        await http.post('http://127.0.0.1:8080/Users/NewUser',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'firstName': trimmedFirstName,
              'lastName': trimmedLastName,
              'emailAddress': trimmedEmail,
              'birthDate': birthdate,
              'userName': userName,
              'userPassword': userPassword,
              'dateCreated': formattedDate,
            }));

    return response;
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
