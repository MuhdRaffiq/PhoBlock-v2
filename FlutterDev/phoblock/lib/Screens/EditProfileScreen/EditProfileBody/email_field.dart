import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            child: Text('Email: '),
          ),
          Flexible(
            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Email",
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
