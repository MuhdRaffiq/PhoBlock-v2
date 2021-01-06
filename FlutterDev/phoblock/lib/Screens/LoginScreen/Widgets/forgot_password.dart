import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class ForgotPassword extends StatelessWidget {
  static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 20.0),
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                fontFamily: 'Lalezar',
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}
