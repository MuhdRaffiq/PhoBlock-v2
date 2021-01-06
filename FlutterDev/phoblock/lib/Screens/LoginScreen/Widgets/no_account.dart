import 'package:flutter/material.dart';
import 'package:phoblock/app.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class NoAccount extends StatelessWidget {
  static const double _hPad = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 20.0),
          child: GestureDetector(
            child: Text(
              'No account? Sign up here',
              style: TextStyle(
                fontFamily: 'Lalezar',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            onTap: () => _onNoAccountTap(context),
          ),
        ),
      ],
    );
  }

  _onNoAccountTap(BuildContext context) {
    Navigator.pushNamed(context, SignUpRoute);
  }
}
