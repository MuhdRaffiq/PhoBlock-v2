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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          //padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
          margin: const EdgeInsets.fromLTRB(_hPad, 5.0, _hPad, 5.0),
          height: 170.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                _imagePath,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
