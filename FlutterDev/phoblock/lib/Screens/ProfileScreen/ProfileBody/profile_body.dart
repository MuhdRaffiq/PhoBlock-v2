import 'package:flutter/material.dart';
import '../ProfileGallery/profile_gallery.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Posts',
                ),
                Tab(
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          Container(
            height: 475.0,
            child: TabBarView(
              children: [
                ProfileGallery("assets/images/postmalone.jpg"),
                ProfileGallery("assets/images/postmalone.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
