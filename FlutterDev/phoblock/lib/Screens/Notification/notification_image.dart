import 'package:flutter/material.dart';

class NotificationImage extends StatelessWidget {
  final String _imagePath;

  NotificationImage(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 25.0,
        child: CircleAvatar(
          radius: 24.0,
          backgroundImage: AssetImage(_imagePath),
        ),
      ),
    );
  }
}
