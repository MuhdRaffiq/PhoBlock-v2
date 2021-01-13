import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/notification.dart';
import 'notification_image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class NotificationCard extends StatefulWidget {
  final UserNotification notification;

  NotificationCard({this.notification});

  @override
  NotificationCardState createState() => NotificationCardState();
}

class NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.fromLTRB(1.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            _buildNoticationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoticationCard() {
    if (widget.notification == null) {
      return Spacer();
    } else {
      return ListTile(
        leading: NotificationImage(
          notifiedImage: widget.notification.notifierDp,
        ),
        title: Text(widget.notification.notifierUsername),
        subtitle: Text(widget.notification.notificationMessage),
        trailing: Container(
          constraints: BoxConstraints.expand(height: 60.0, width: 60.0),
          child: Image.memory(
            base64.decode(widget.notification.notifiedPost.imageString),
            fit: BoxFit.cover, //BoxFit.fill,
          ),
        ),
      );
    }
  }
}
