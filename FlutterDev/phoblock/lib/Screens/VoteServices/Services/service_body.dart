import 'package:flutter/material.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class ServiceBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Tokenize your photo into NFT'),
              CustomOutlineButton(
                text: "30 PHO",
                color: hexToColor('#64B6A9'), //hexToColor('#64B6A9'),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              Text('Be on the front page'),
              CustomOutlineButton(
                text: "15 PHO",
                color: hexToColor('#64B6A9'), //hexToColor('#64B6A9'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
