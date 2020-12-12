import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String _imagePath;

  PostHeader(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 21.0,
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(_imagePath),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: new GestureDetector(
              onTap: () {},
              child: Text(
                'Post',
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
