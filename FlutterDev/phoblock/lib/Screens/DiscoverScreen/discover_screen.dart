import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 2.0,
          ),
          //child: SearchBar(),
        ),
      ),
    );
  }
}
