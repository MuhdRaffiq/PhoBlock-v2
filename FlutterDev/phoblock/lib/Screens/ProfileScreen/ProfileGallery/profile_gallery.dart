import 'package:flutter/material.dart';

class ProfileGallery extends StatelessWidget {
  final String _imagePath;

  ProfileGallery(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Image.asset(
                    _imagePath,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
