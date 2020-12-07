import 'package:flutter/material.dart';
import 'package:phoblock/app.dart';
import 'custom_outline_cancelbutton.dart';
import '../../style.dart';

class CancelButton extends StatelessWidget {
  static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
          // child: GestureDetector(
          //   child: CustomOutlineCancelButton(
          //     text: "Cancel",
          //     color: Colors.grey,
          //     onPressed: () {},
          //   ),
          //   onTap: _onCancelButtonTap(context),
          // ),
          child: CustomOutlineCancelButton(
            text: "Cancel",
            color: Colors.grey,
            // color: hexToColor('#64B6A9'),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  _onCancelButtonTap(BuildContext context) {
    Navigator.pushNamed(context, SignInRoute);
  }
}
