import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class BioField extends StatelessWidget {
  final textController;
  final textFormKey;

  BioField(this.textController, this.textFormKey);

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
              child: Text('Bio: '),
            ),
            Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "", //"Enter Bio",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8.0),
                ),
                keyboardType: TextInputType.text,
                controller: textController,
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
