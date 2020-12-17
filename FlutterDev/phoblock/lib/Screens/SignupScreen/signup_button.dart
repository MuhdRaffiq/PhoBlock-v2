import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'custom_outline_button.dart';
import '../../style.dart';

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
                  //print(jsonDecode(response.body)["detailMessage"]);
                  if (response.statusCode == 200) {
                    return Fluttertoast.showToast(
                      msg: 'Account Has Successfully Registered',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: hexToColor('#64B6A9'),
                      textColor: Colors.white,
                      fontSize: 14.0,
                    );
                  } else if (response.statusCode == 406) {
                    return Fluttertoast.showToast(
                      msg: jsonDecode(response.body)["detailMessage"],
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 3,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 14.0,
                    );
                  } else {
                    return Fluttertoast.showToast(
                      msg: 'Registration Failed',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 14.0,
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
}
