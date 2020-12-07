import 'package:flutter/material.dart';

class UsernameTextSection extends StatelessWidget {
  final String _nameString;
  static const double _hPad = 50.0;

  UsernameTextSection(this._nameString);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 2.0),
          child: Text(
            _nameString,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 2.0,
        ),
      ],
    );
  }
}
