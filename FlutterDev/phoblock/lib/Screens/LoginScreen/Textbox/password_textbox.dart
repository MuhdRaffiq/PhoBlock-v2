import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PasswordTextBox extends StatelessWidget {
  final textController;
  static const double _hPad = 40.0;

  PasswordTextBox(this.textController);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            controller: textController,
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.black12, width: 7.0),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                fontFamily: 'Lalezar',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }
}
