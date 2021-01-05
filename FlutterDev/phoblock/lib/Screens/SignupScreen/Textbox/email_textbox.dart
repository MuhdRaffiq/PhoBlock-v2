import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class EmailTextBox extends StatelessWidget {
  final textController;
  final formKey;
  static const double _hPad = 40.0;

  EmailTextBox(this.textController, this.formKey);

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
              keyboardType: TextInputType.emailAddress,
              controller: textController,
              validator: (value) {
                Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);

                return (!regex.hasMatch(value.trim())) ? 'Invalid Email' : null;
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black12, width: 7.0),
                ),
                hintText: 'Email Address',
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
