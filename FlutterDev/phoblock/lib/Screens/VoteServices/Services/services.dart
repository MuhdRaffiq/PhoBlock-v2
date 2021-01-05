import 'package:flutter/material.dart';
import 'service_body.dart';
import '../custom_outline_button.dart';
import '../title_header.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleHeader('Services'),
          ServiceBody(),
        ],
      ),
    );
  }
}
