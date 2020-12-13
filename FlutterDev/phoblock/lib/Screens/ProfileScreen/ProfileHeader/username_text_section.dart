import 'package:flutter/material.dart';

class UsernameTextSection extends StatelessWidget {
  final String _nameString;
  final String _bioString;
  static const double _hPad = 30.0;

  UsernameTextSection(this._nameString, this._bioString);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
          child: Text(
            _nameString,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
          child: Text(
            _bioString,
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
