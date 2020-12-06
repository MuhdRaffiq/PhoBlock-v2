import 'package:flutter/material.dart';
import 'custom_outline_button.dart';
import '../../style.dart';

class LoginButton extends StatelessWidget {
  static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          child: CustomOutlineButton(
            text: "Log in",
            color: hexToColor('#64B6A9'),
            onPressed: () {},
          ),
          // child: OutlineButton(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //   ),
          //   color: hexToColor('#64B6A9'),
          //   padding: const EdgeInsets.all(15.0),
          //   onPressed: () {},
          //   child: Text(
          //     'Submit',
          //     style: TextStyle(
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
        )
      ],
    );
  }
}
