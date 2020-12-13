import 'package:flutter/material.dart';
import 'custom_outline_button.dart';
import '../../../style.dart';

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
          child: CustomOutlineButton(
            text: "SUBMIT",
            color: hexToColor('#64B6A9'), //hexToColor('#64B6A9'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
