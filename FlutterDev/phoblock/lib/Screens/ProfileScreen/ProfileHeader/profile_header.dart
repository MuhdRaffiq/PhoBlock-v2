import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String _imagePath;
  //static const double _hPad = 16.0;

  ProfileHeader(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Column(
          //   children: [
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 59.0,
              child: CircleAvatar(
                radius: 58.0,
                backgroundImage: AssetImage(_imagePath),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Post',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '99',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Follower',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '99',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Following',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '99',
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Row(
      //       children: [
      //         Container(
      //           child: CircleAvatar(
      //             backgroundColor: Colors.black,
      //             radius: 71.0,
      //             child: CircleAvatar(
      //               radius: 70.0,
      //               backgroundImage: AssetImage(_imagePath),
      //             ),
      //           ),
      //         ),
      //         Container(
      //           child: Column(
      //             //mainAxisAlignment: MainAxisAlignment.start,
      //             //crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text(
      //                 'Post',
      //                 style: TextStyle(
      //                   fontFamily: 'Lalezar',
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               Text(
      //                 '99',
      //                 style: TextStyle(
      //                   fontFamily: 'Lalezar',
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
