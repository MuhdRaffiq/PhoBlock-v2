import 'package:flutter/material.dart';
import '../../style.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
    );
  }
}
