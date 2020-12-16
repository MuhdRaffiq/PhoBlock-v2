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
  static const double _hPad = 40.0;

  SignupButton(
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.dobController,
    this.usernameController,
    this.passwController,
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
              createUser(
                      firstNameController.text,
                      lastNameController.text,
                      emailController.text,
                      dobController.text,
                      usernameController.text,
                      passwController.text)
                  .then((response) {
                if (response.statusCode == 200) {
                  return Fluttertoast.showToast(
                    msg: 'Account Registered',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: hexToColor('#64B6A9'),
                    textColor: Colors.white,
                  );
                } else {
                  return Fluttertoast.showToast(
                    msg: 'Registration Failed',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                  );
                }
              });
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

    final http.Response response =
        await http.post('http://127.0.0.1:8080/Users/NewUser',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'firstName': firstName,
              'lastName': lastName,
              'emailAddress': emailAddress,
              'birthDate': birthdate,
              'userName': userName,
              'userPassword': userPassword,
              'dateCreated': formattedDate,
            }));

    return response;
  }
}
