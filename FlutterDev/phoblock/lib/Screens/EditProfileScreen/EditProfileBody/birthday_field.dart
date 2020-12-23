import 'package:flutter/material.dart';

class BirthdayField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 20.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            child: Text('Birthday: '),
          ),
          Flexible(
            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Birthday",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(8.0),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
