import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phoblock/Model/phoblock_user.dart';
import 'package:phoblock/Model/post.dart';
import '../DiscoverScreen/discover_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../Notification/notification_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../UploadPhotoScreen/camera_screen.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class NavigationBar extends StatefulWidget {
  final int userId;

  NavigationBar(this.userId);

  @override
  State<StatefulWidget> createState() {
    return NavigationState();
  }
}

// ignore: must_be_immutable
class NavigationState extends State<NavigationBar> {
  int _currentIndex = 0;

  List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(widget.userId),
      DiscoverScreen(),
      Spacer(),
      NotificationScreen(
        loggedInId: widget.userId,
      ),
      ProfileScreen(userId: widget.userId, otherUserId: null)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
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
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(userId: widget.userId)),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
