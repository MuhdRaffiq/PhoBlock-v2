import 'package:flutter/material.dart';
import 'package:phoblock/Model/post.dart';
import 'Post/card_post.dart';
import '../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class HomeScreen extends StatefulWidget {
  final int loginId;

  HomeScreen(this.loginId);

  @override
  HomeScreenState createState() => HomeScreenState();
}

// ignore: must_be_immutable
class HomeScreenState extends State<HomeScreen> {
  List<Post> listOfPost;

  @override
  void initState() {
    super.initState();
  }

  Future<List<Post>> listAllPost() async {
    List<Post> listPost = await Post.fetchAllPost();

    return listPost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
      body: FutureBuilder(
        future: listAllPost(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> listPost) {
          if (listPost.data == null) {
            return Container(
              width: 0.0,
              height: 0.0,
            );
          } else {
            return ListView(
              children: listPost.data
                  .map((post) => CardPost(widget.loginId, post))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
