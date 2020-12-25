import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phoblock/Model/phoblock_user.dart';
import '../DiscoverScreen/discover_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../Notification/notification_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../UploadPhotoScreen/camera_screen.dart';
import '../../style.dart';

// ignore: must_be_immutable
class NavigationBar extends StatefulWidget {
  //final String usernameLoggedIn;
  PhoblockUser loggedInUser;

  NavigationBar({this.loggedInUser});

  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

// ignore: must_be_immutable
class _NavigationState extends State<NavigationBar> {
  int _currentIndex = 0;

  Widget showWidget = HomeScreen();

  // final List<Widget> _children = [
  //   HomeScreen(),
  //   DiscoverScreen(),
  //   CameraScreen(), //UploadScreen(),
  //   NotificationScreen(),
  //   ProfileScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showWidget, //_children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTapTapped,
        currentIndex: _currentIndex,
        iconSize: 30.0,
        backgroundColor: hexToColor('#64B6A9'),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  _onTapTapped(int index) {
    if (index == 0) {
      setState(() {
        showWidget = HomeScreen();
        _currentIndex = index;
      });
    } else if (index == 1) {
      setState(() {
        showWidget = DiscoverScreen();
        _currentIndex = index;
      });
    } else if (index == 2) {
      setState(() {
        _currentIndex = 0;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CameraScreen(usernameLoggedIn: widget.loggedInUser.username),
        ),
      );
    } else if (index == 3) {
      setState(() {
        showWidget = NotificationScreen();
        _currentIndex = index;
      });
    } else if (index == 4) {
      setState(() {
        showWidget = ProfileScreen(user: widget.loggedInUser);
        _currentIndex = index;
      });
    }
  }
}
