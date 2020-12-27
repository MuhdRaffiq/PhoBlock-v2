import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/post.dart';

class ProfileGallery extends StatelessWidget {
  //final String _imagePath;
  List<Post> postList;

  // ProfileGallery(this._imagePath);
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
                          fit: BoxFit.fill,
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
