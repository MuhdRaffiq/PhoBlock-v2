import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  final String _imagePath;

  PostBody(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      constraints: BoxConstraints.expand(
        height: 400.0,
      ),
      child: Image.asset(
        _imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
