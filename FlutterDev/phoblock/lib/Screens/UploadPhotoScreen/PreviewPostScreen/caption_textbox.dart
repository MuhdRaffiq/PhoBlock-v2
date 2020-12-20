import 'package:flutter/material.dart';

class CaptionTextBox extends StatelessWidget {
  //static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 2,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.black12, width: 7.0),
          ),
          hintText: 'Insert Caption',
          hintStyle: TextStyle(
            fontFamily: 'Lalezar',
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
