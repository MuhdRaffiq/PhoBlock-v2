import 'package:flutter/material.dart';

class PostFollowerFollowingSection extends StatelessWidget {
  static const double _hPad = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(85.0, 2.0, 85.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(_hPad, 5.0, _hPad, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Post',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '99',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(_hPad, 5.0, _hPad, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Follower',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '99',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(_hPad, 5.0, _hPad, 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '99',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 4.0,
        ),
      ],
    );
  }
}
