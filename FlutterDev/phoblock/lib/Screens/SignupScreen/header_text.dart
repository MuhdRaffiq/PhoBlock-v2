import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class HeaderText extends StatelessWidget {
  final String _headerString;
  static const double _hPad = 50.0;

  HeaderText(this._headerString);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 50.0, _hPad, 70.0),
          child: Text(
            _headerString,
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontWeight: FontWeight.w400,
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
