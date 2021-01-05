import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PasswordTextBox extends StatelessWidget {
  final textController;
  final formKey;
  static const double _hPad = 40.0;

  PasswordTextBox(this.textController, this.formKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: textController,
              validator: (value) {
                if (value.length < 8) {
                  return '8 characters, at least 1 uppercase, at least 1 number';
                }

                Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$';
                RegExp regex = new RegExp(pattern);

                return (!regex.hasMatch(value))
                    ? '8 characters, at least 1 uppercase, at least 1 number'
                    : null;
              },
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
      ),
    );
  }
}
