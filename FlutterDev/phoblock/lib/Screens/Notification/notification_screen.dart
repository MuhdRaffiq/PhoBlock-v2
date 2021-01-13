import 'package:flutter/material.dart';
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/Screens/Notification/notification_body.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class NotificationScreen extends StatefulWidget {
  final int loggedInId;

  NotificationScreen({this.loggedInId});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: FutureBuilder(
        future: PhoblockUser.fetchUser(widget.loggedInId),
        builder:
            (BuildContext context, AsyncSnapshot<PhoblockUser> retrievedUser) {
          if (retrievedUser.data == null) {
            return Container(
              width: 0.0,
              height: 0.0,
            );
          } else {
            return NotificationBody(
              usernotifications: retrievedUser.data.notifications,
            );
          }
        },
      ),
    );
  }
}
