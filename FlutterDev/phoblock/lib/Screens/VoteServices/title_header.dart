import 'package:flutter/material.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class TitleHeader extends StatelessWidget {
  final String _text;

  TitleHeader(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 20.0),
      child: Text(
        this._text,
        style: TextStyle(
          fontFamily: 'Lalezar',
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
