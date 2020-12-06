import 'package:flutter/material.dart';

class PasswordTextBox extends StatelessWidget {
  static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //padding: EdgeInsets.all(30.0),
      children: [
        //new Padding(padding: EdgeInsets.all(20.0)),
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: new InputDecoration(
              //labelText: 'Email Adress',
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
