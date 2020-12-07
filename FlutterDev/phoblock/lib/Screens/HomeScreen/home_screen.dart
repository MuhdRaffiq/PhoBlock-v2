import 'package:flutter/material.dart';
import '../DiscoverScreen/discover_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../UploadPhotoScreen/upload_screen.dart';
import '../../style.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  // int _currentIndex = 0;
  // final List<Widget> _children = [
  //   HomeScreen(),
  //   DiscoverScreen(),
  //   ProfileScreen(),
  //   UploadScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      // body: _children[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   onTap: _onTapTapped(_currentIndex),
      //   currentIndex: _currentIndex,
      //   iconSize: 30.0,
      //   backgroundColor: hexToColor('#64B6A9'),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: new Icon(
      //         Icons.home,
      //         color: Colors.white,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(
      //         Icons.search,
      //         color: Colors.white,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(
      //         Icons.add_a_photo,
      //         color: Colors.white,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: new Icon(
      //         Icons.person_rounded,
      //         color: Colors.white,
      //       ),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }

  // _onTapTapped(int index) {
  //   _currentIndex = index;
  // }
}
