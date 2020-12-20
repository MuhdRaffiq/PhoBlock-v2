import 'package:flutter/material.dart';
import 'custom_outline_button.dart';
import '../../../style.dart';

class PostButton extends StatelessWidget {
  static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
          child: CustomOutlineButton(
            text: "Post",
            color: hexToColor('#64B6A9'),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
