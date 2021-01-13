import 'package:flutter/material.dart';
import 'package:phoblock/Model/notification.dart';

import 'notification_card.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class NotificationBody extends StatefulWidget {
  final List<UserNotification> usernotifications;

  NotificationBody({this.usernotifications});

  @override
  NotificationBodyState createState() => NotificationBodyState();
}

class NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (widget.usernotifications == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return ListView(
        children: widget.usernotifications
            .map((notification) => NotificationCard(
                  notification: notification,
                ))
            .toList(),
      );
    }
  }
}
