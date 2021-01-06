import 'package:flutter/material.dart';
import 'notification_image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class NotificationCard extends StatelessWidget {
  final String _imagePath;
  final String _usernameString;
  final String _notificationMessage;

  NotificationCard(
      this._imagePath, this._usernameString, this._notificationMessage);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.fromLTRB(1.0, 0.0, 10.0, 0.0),
        child: Column(
          children: [
            ListTile(
              leading: NotificationImage(this._imagePath),
              title: Text(this._usernameString),
              subtitle: Text(this._notificationMessage),
              trailing: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(this._imagePath),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
