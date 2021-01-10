import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostFooter extends StatefulWidget {
  @override
  PostFooterState createState() => PostFooterState();
}

class PostFooterState extends State<PostFooter> {
  GestureDetector likeIcon;
  GestureDetector favIcon;
  GestureDetector downloadIcon;
//GestureDetector
  @override
  void initState() {
    super.initState();
    likeIcon = GestureDetector(
      onTap: () => _onTapLikedIcon(),
      child: Icon(
        Icons.favorite_border,
        color: Colors.black,
        size: 35.0,
      ),
    );
    // Icon(
    //   Icons.favorite_border,
    //   color: Colors.black,
    //   size: 35.0,
    // );

    favIcon = GestureDetector(
      onTap: () => _onTapFavIcon(),
      child: Icon(
        Icons.star_border,
        color: Colors.black,
        size: 35.0,
      ),
    );
    // Icon(
    //   Icons.star_border,
    //   color: Colors.black,
    //   size: 35.0,
    // );

    downloadIcon = GestureDetector(
      onTap: () => _onTapDownloadIcon(),
      child: Icon(
        Icons.arrow_circle_down_outlined,
        color: Colors.black,
        size: 35.0,
      ),
    );
    // Icon(
    //   Icons.arrow_circle_down_outlined,
    //   color: Colors.black,
    //   size: 35.0,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              _buildLikedIcon(),
              _buildFavIcon(),
              _buildDownloadIcon(),
              // Icon(
              //   Icons.favorite_border,
              //   color: Colors.black,
              //   size: 35.0,
              // ),
              // Icon(
              //   Icons.star_border,
              //   color: Colors.black,
              //   size: 35.0,
              // ),
              // Icon(
              //   Icons.arrow_circle_down_outlined,
              //   color: Colors.black,
              //   size: 35.0,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLikedIcon() {
    if (likeIcon == null) {
      return Spacer();
    } else {
      return likeIcon;
    }
  }

  Widget _buildFavIcon() {
    if (favIcon == null) {
      return Spacer();
    } else {
      return favIcon;
    }
  }

  Widget _buildDownloadIcon() {
    if (downloadIcon == null) {
      return Spacer();
    } else {
      return downloadIcon;
    }
  }

  void _onTapLikedIcon() {
    setState(() {
      likeIcon = GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 35.0,
        ),
      );
    });
  }

  void _onTapFavIcon() {
    setState(() {
      favIcon = GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.star_outlined,
          color: Colors.yellow,
          size: 35.0,
        ),
      );
    });
  }

  void _onTapDownloadIcon() {
    setState(() {
      downloadIcon = GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.arrow_circle_down_outlined,
          color: Colors.blue,
          size: 35.0,
        ),
      );
    });
  }
}
