import 'package:flutter/material.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

class MessageFollowButtons extends StatefulWidget {
  @override
  MessageFollowButtonState createState() => MessageFollowButtonState();
}

class MessageFollowButtonState extends State<MessageFollowButtons> {
  static const double _hPad = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40.0,
            width: 180.0,
            child: CustomOutlineButton(
              text: "Follow",
              color: hexToColor('#64B6A9'),
              onPressed: () {},
            ),
          ),
          Container(
            height: 40.0,
            width: 180.0,
            child: CustomOutlineButton(
              text: "Message",
              color: Colors.black38,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
