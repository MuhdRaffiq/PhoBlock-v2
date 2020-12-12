import 'package:flutter/material.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

class Buttons extends StatelessWidget {
  static const double _hPad = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
            height: 40.0,
            width: 180.0,
            child: CustomOutlineButton(
              text: "Vote/Service",
              color: hexToColor('#64B6A9'), //hexToColor('#64B6A9'),
              onPressed: () {},
            ),
          ),
          Container(
            //margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
            height: 40.0,
            width: 180.0,
            child: CustomOutlineButton(
              text: "Edit Profile",
              color: Colors.black38, //hexToColor('#64B6A9'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     Row(
    //       children: [
    //         Container(
    //           //margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
    //           height: 40.0,
    //           child: CustomOutlineButton(
    //             text: "Edit Profile",
    //             color: Colors.black38, //hexToColor('#64B6A9'),
    //             onPressed: () {},
    //           ),
    //         ),
    //         Container(
    //           //margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
    //           height: 40.0,
    //           child: CustomOutlineButton(
    //             text: "Edit Profile",
    //             color: Colors.black38, //hexToColor('#64B6A9'),
    //             onPressed: () {},
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
