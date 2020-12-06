import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  // use underscore for private variable
  final String _imagePath;
  static const double _hPad = 16.0;

  ImageBanner(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          //padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
          margin: const EdgeInsets.fromLTRB(_hPad, 150.0, _hPad, 10.0),
          constraints: BoxConstraints.expand(
            height: 200.0,
          ),
          child: Image.asset(
            _imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
