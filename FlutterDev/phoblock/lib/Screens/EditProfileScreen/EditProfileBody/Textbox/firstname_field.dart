import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class FirstNameField extends StatelessWidget {
  final textController;
  final textFormKey;

  FirstNameField(this.textController, this.textFormKey);

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
              child: Text('First Name: '),
            ),
            Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "", //"Enter First Name",
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
                  if (value.isEmpty || value == ' ') {
                    return 'Invalid name';
                  }

                  if (value.trim().length == 1) {
                    return 'Invalid name';
                  }

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
}
