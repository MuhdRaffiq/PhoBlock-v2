import 'package:flutter/material.dart';
import 'image_banner.dart';
import 'Proposal/proposal.dart';
import 'Services/services.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class VoteServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote/Services'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner("assets/images/phoblock_branding-10.png"),
          Proposal(),
          Services(),
        ],
      ),
    );
  }
}
