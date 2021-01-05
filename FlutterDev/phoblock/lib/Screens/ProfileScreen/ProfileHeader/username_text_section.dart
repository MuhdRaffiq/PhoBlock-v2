import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
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
        _usernameWidget(context),
        _bioWidget(),
      ],
    );
  }

  Widget _usernameWidget(context) {
    if (_nameString == null) {
      return Spacer();
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
        child: Text(
          _nameString,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
    }
  }

  Widget _bioWidget() {
    if (_bioString == null) {
      return SizedBox.shrink();
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
        child: Text(
          _bioString,
          style: TextStyle(
            fontFamily: 'Lalezar',
            fontSize: 16.0,
          ),
        ),
      );
    }
  }
}
