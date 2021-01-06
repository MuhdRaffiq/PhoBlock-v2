import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 35.0,
              ),
              Icon(
                Icons.star_border,
                color: Colors.black,
                size: 35.0,
              ),
              Icon(
                Icons.arrow_circle_down_outlined,
                color: Colors.black,
                size: 35.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
