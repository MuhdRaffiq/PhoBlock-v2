import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class TitleSection extends StatelessWidget {
  final String _titleString;
  static const double _hPad = 50.0;

  TitleSection(this._titleString);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 70.0),
          child: Text(
            _titleString,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
