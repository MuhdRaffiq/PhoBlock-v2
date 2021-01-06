import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PhoneField extends StatelessWidget {
  final textController;
  final textFormKey;

  PhoneField(this.textController, this.textFormKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFormKey,
      child: Container(
        margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
        child: Row(
          children: [
            Container(
              width: 80.0,
              child: Text('Phone: '),
            ),
            Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8.0),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: textController,
                validator: (value) {
                  if (value.isEmpty || value == ' ' || value.length < 10) {
                    return 'Invalid value';
                  }

                  value.runes.forEach((int rune) {
                    var character = new String.fromCharCode(rune);

                    if (!_isNumeric(character)) {
                      return 'Invalid value';
                    }
                  });

                  return null;
                },
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isNumeric(String numStr) {
    if (numStr == null) {
      return false;
    }
    return double.tryParse(numStr) != null;
  }
}
