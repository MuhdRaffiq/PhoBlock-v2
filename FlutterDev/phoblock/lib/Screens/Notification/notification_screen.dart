import 'package:flutter/material.dart';
import '../../style.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
    );
  }
}
