import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/post.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class ProfileGallery extends StatelessWidget {
  List<Post> postList;

  ProfileGallery(this.postList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: postList
                  .map((post) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                          ),
                        ),
                        child: Image.memory(
                          base64.decode(post.postPicture.imageString),
                          height: 140.0,
                          width: 140.0,
                          fit: BoxFit.cover, //BoxFit.fill,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}
