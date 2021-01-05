import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class LastNameTextBox extends StatelessWidget {
  final textController;
  final formKey;
  static const double _hPad = 40.0;

  LastNameTextBox(this.textController, this.formKey);

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
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              controller: textController,
              validator: (value) {
                if (value.isEmpty || value == ' ') {
                  return 'Invalid name';
                }

                if (value.trim().length == 1) {
                  return 'Invalid name';
                }

                return null;
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black12, width: 7.0),
                ),
                hintText: 'Last Name',
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
