import 'package:flutter/material.dart';

class FirstNameTextBox extends StatelessWidget {
  final textController;
  static const double _hPad = 40.0;

  FirstNameTextBox(this.textController);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            controller: textController,
            validator: (name) {
              if (name.isEmpty) {
                return 'Invalid Username';
              } else {
                return null;
              }
            },
            decoration: new InputDecoration(
              //labelText: 'Email Adress',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.black12, width: 7.0),
              ),
              hintText: 'First Name',
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
