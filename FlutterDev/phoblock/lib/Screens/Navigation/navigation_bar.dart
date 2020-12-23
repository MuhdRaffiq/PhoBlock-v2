import 'package:flutter/material.dart';
import '../DiscoverScreen/discover_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../Notification/notification_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../UploadPhotoScreen/camera_screen.dart';
import '../../style.dart';

class NavigationBar extends StatefulWidget {
  final String usernameLoggedIn;

  NavigationBar({this.usernameLoggedIn});

  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

// ignore: must_be_immutable
class _NavigationState extends State<NavigationBar> {
  int _currentIndex = 0;
  //String usernameLoggedIn = widget.usernameLoggedIn;

  final List<Widget> _children = [
    HomeScreen(),
    DiscoverScreen(),
    CameraScreen(), //UploadScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
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
      setState(() {
        _currentIndex = 0;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CameraScreen(usernameLoggedIn: widget.usernameLoggedIn),
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
    //_currentIndex = index;
  }
}
