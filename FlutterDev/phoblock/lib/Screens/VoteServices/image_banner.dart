import 'package:flutter/material.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class ImageBanner extends StatelessWidget {
  final String _imagePath;

  ImageBanner(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.white10,
                radius: 42.0,
                backgroundImage: AssetImage(_imagePath),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                'PhoBlock',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Token Available: ',
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '200 PHO',
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          'Note: This token(s) can be used to vote for the proposal desired',
          style: TextStyle(
            fontFamily: 'Lalezar',
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
            color: hexToColor('#64B6A9'),
          ),
        ),
        Text(
          'Every quarterly, a proposal will be announced for voting',
          style: TextStyle(
              fontFamily: 'Lalezar',
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
              color: hexToColor('#64B6A9')),
        ),
      ],
    );
  }
}
