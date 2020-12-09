import 'package:flutter/material.dart';

/* 
Author: Muhammad Khairi Norizan
*/
class PageDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(
          color: Colors.black,
          thickness: 2.0,
        ),
      ],
    );
  }
}
