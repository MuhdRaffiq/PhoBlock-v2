import 'package:flutter/material.dart';

class ProfileGallery extends StatelessWidget {
  final String _imagePath;

  ProfileGallery(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Image.asset(
                      _imagePath,
                      height: 130.0,
                      width: 130.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Image.asset(
                      _imagePath,
                      height: 130.0,
                      width: 130.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                      ),
                    ),
                    child: Image.asset(
                      _imagePath,
                      height: 130.0,
                      width: 130.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
