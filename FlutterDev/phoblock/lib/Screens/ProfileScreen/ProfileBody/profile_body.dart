import 'package:flutter/material.dart';
import 'package:phoblock/Model/post.dart';
import '../ProfileGallery/profile_gallery.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class ProfileBody extends StatelessWidget {
  final List<Post> postList;

  ProfileBody(this.postList);

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
            height: 473.0,
            child: TabBarView(
              children: [
                _buildGallery(),
                _buildGallery(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGallery() {
    if (postList.length == 0) {
      return Text('fdfd');
    } else {
      return ProfileGallery(postList);
    }
  }
}
