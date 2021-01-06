import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:phoblock/Model/image.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/app.dart';
import 'custom_outline_button.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class SubmitButton extends StatefulWidget {
  final imageKey;
  PhoblockUser loggedInUser;
  int userId;
  //final lastKey;
  final firstNameTextController;
  final lastNameTextController;
  final usernameTextController;
  final bioTextController;
  final emailTextController;
  final phoneTextController;
  final birthdayTextController;

  final firstNameFormKey;
  final lastNameFormKey;
  final usernameFormKey;
  final bioFormKey;
  final emailFormKey;
  final phoneFormKey;
  final birthdayFormKey;

  SubmitButton({
    this.imageKey,
    this.loggedInUser,
    this.userId,
    //this.lastKey,
    this.firstNameTextController,
    this.firstNameFormKey,
    this.lastNameTextController,
    this.lastNameFormKey,
    this.usernameTextController,
    this.usernameFormKey,
    this.bioTextController,
    this.bioFormKey,
    this.emailTextController,
    this.emailFormKey,
    this.phoneTextController,
    this.phoneFormKey,
    this.birthdayTextController,
    this.birthdayFormKey,
  });

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
          child: CustomOutlineButton(
            text: "SUBMIT",
            color: hexToColor('#64B6A9'),
            onPressed: () {
              bool firstName = widget.firstNameFormKey.currentState.validate();
              bool lastName = widget.lastNameFormKey.currentState.validate();
              bool bio = widget.bioFormKey.currentState.validate();
              bool email = widget.emailFormKey.currentState.validate();
              bool phone = widget.phoneFormKey.currentState.validate();
              bool dob = widget.birthdayFormKey.currentState.validate();

              String firstNameStr = widget.firstNameTextController.text;
              String trimmedFirstName = firstNameStr.trim();
              String lastNameStr = widget.lastNameTextController.text;
              String trimmedLastName = lastNameStr.trim();
              String usernameStr = widget.usernameTextController.text;
              String trimmedUsername = usernameStr.trim();
              String bioStr = widget.bioTextController.text;
              String trimmedBio = bioStr.trim();
              String emailStr = widget.emailTextController.text;
              String trimmedEmail = emailStr.trim();
              String phoneStr = widget.phoneTextController.text;
              String trimmedPhone = phoneStr.trim();
              String birthdayStr = widget.birthdayTextController.text;
              String trimmedBirthday = birthdayStr.trim();

              if (firstName && lastName && bio && email && phone && dob) {
                postEdittedProfile(
                  trimmedFirstName,
                  trimmedLastName,
                  trimmedUsername,
                  trimmedBio,
                  trimmedEmail,
                  trimmedPhone,
                  trimmedBirthday,
                  widget.imageKey.currentState.imageFile,
                ).then((response) async {
                  if (response.statusCode == 200) {
                    FToast.toast(
                      context,
                      toast: _showToast(
                        context,
                        jsonDecode(response.body)["detailMessage"],
                        hexToColor('#64B6A9'),
                        false,
                      ),
                    );

                    Timer(Duration(seconds: 1), () {
                      //Navigator.pop(context, widget.userId);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AfterLoginRoute,
                        (Route<dynamic> route) => false,
                        //arguments: {"loginUser": user},
                        arguments: {"usedID": widget.userId},
                      );
                      // Navigator.popUntil(
                      //     context, ModalRoute.withName(AfterLoginRoute));
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
                        jsonDecode(response.body)["detailMessage"],
                        Colors.red,
                        true,
                      ),
                    );
                  }
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Future<http.Response> postEdittedProfile(
      String firstName,
      String lastName,
      String username,
      String bio,
      String email,
      String phone,
      String birthday,
      File imageFile) async {
    String trimmedFirstName = firstName.trim();
    String trimmedLastName = lastName.trim();
    String trimmedUsername = username.trim();
    String trimmedBio = bio.trim();
    String trimmedEmail = email.trim();
    String trimmedPhone = phone.trim();
    String trimmedBirthday = birthday.trim();

    http.Response response;

    if (imageFile == null) {
      response = await http.put(
          'http://127.0.0.1:8080/Users/User/' + widget.loggedInUser.username,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'firstName': trimmedFirstName,
            'lastName': trimmedLastName,
            'username': trimmedUsername,
            'bio': trimmedBio,
            'email': trimmedEmail,
            'phoneNumber': trimmedPhone,
            'birthday': trimmedBirthday,
          }));
    } else {
      String imageFullName = basename(imageFile.path);
      String imgName = imageFullName.split(".")[0];
      String imgType = imageFullName.split(".")[1];
      //Get image bytes
      Uint8List bytes = await imageFile.readAsBytes();
      //Conver byte to String
      String _img64String = base64Encode(bytes);

      response = await http.put(
          'http://127.0.0.1:8080/Users/User/' + widget.loggedInUser.username,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'firstName': trimmedFirstName,
            'lastName': trimmedLastName,
            'username': trimmedUsername,
            'bio': trimmedBio,
            'email': trimmedEmail,
            'phoneNumber': trimmedPhone,
            'birthday': trimmedBirthday,
            'imageName': imgName,
            'imageType': imgType,
            'imageString': _img64String,
          }));
    }

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
