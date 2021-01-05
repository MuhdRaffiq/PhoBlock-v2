import 'dart:async';

import 'package:flutter/material.dart';
import '../../../app.dart';
import 'custom_outline_button.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class CancelButton extends StatelessWidget {
  static const double _hPad = 40.0;
  final int userId;

  CancelButton(this.userId);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          child: CustomOutlineButton(
            text: "Cancel",
            color: Colors.grey,
            onPressed: () {
              Timer(Duration(seconds: 1), () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AfterLoginRoute,
                  (Route<dynamic> route) => false,
                  arguments: {"usedID": userId},
                );
              });
            },
          ),
        )
      ],
    );
  }
}
