import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class NotificationImage extends StatefulWidget {
  final ImageFile notifiedImage;

  NotificationImage({this.notifiedImage});

  @override
  NotificationImageState createState() => NotificationImageState();
}

class NotificationImageState extends State<NotificationImage> {
  @override
  Widget build(BuildContext context) {
    return _buildNotifiedImage();
  }

  Widget _buildNotifiedImage() {
    if (widget.notifiedImage == null) {
      return Container(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 25.0,
          child: CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage("assets/images/doe.jpg"),
          ),
        ),
      );
      //return Spacer();
    } else {
      return Container(
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 25.0,
          child: CircleAvatar(
            radius: 24.0,
            backgroundImage:
                MemoryImage(base64.decode(widget.notifiedImage.imageString)),
          ),
        ),
      );
    }
  }
}
