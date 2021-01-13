import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phoblock/Model/post.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostBody extends StatefulWidget {
  final int loggedInId;
  final Post postFeed;

  PostBody({this.loggedInId, this.postFeed});

  @override
  PostBodyState createState() => PostBodyState();
}

class PostBodyState extends State<PostBody> {
  Widget likeIcon;
  Widget favIcon;
  Widget downloadIcon;
  bool isLike;

  @override
  void initState() {
    super.initState();

    Post.isPostLiked(widget.loggedInId, widget.postFeed.postId).then((retVal) {
      if (retVal == true) {
        setState(() {
          likeIcon = GestureDetector(
            onTap: () => _onTapLikedIcon(false),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 35.0,
            ),
          );

          isLike = true;
        });
      } else {
        setState(() {
          likeIcon = GestureDetector(
            onTap: () => _onTapLikedIcon(true),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 35.0,
            ),
          );
        });

        isLike = false;
      }
    });

    Post.isFavoritePost(widget.loggedInId, widget.postFeed.postId)
        .then((retVal) {
      if (retVal == true) {
        setState(() {
          favIcon = GestureDetector(
            onTap: () => _onTapFavIcon(false),
            child: Icon(
              Icons.star_outlined,
              color: Colors.yellow,
              size: 35.0,
            ),
          );
        });
      } else {
        setState(() {
          favIcon = GestureDetector(
            onTap: () => _onTapFavIcon(true),
            child: Icon(
              Icons.star_border,
              color: Colors.black,
              size: 35.0,
            ),
          );
        });
      }
    });

    Post.isDownloadPost(widget.loggedInId, widget.postFeed.postId)
        .then((retVal) {
      if (retVal == true) {
        setState(() {
          downloadIcon = GestureDetector(
            onTap: () => _onTapDownloadIcon(false),
            child: Icon(
              Icons.arrow_circle_down_outlined,
              color: Colors.blue,
              size: 35.0,
            ),
          );
        });
      } else {
        setState(() {
          downloadIcon = GestureDetector(
            onTap: () => _onTapDownloadIcon(true),
            child: Icon(
              Icons.arrow_circle_down_outlined,
              color: Colors.black,
              size: 35.0,
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _showPostBody(),
          _showPostFooter(),
          Row(
            children: [
              Text(
                widget.postFeed.ownerUsername + " ",
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.postFeed.postCaption,
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 16.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _showPostBody() {
    if (widget.postFeed.postPicture == null) {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return GestureDetector(
        onDoubleTap: () => _onDoubleTapPost(),
        child: Container(
          //margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          constraints: BoxConstraints.expand(
            height: 400.0,
          ),
          child: Image.memory(
            base64.decode(widget.postFeed.postPicture.imageString),
            fit: BoxFit.cover, //BoxFit.fill,
          ),
        ),
      );
    }
  }

  Widget _showPostFooter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            _buildLikedIcon(),
            _buildFavIcon(),
            _buildDownloadIcon(),
          ],
        ),
      ],
    );
  }

  void _onDoubleTapPost() {
    if (isLike == true) {
      //Unlike the post
      _onTapLikedIcon(false);
    } else {
      //Like the post
      _onTapLikedIcon(true);
    }
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

  /*
  Argument: isLike
    true: Liking the post;
    false: Unliking the post;
  */
  void _onTapLikedIcon(bool isLike) {
    if (isLike == true) {
      Post.likePost(widget.loggedInId, widget.postFeed.postId).then((retVal) {
        if (retVal == true) {
          setState(() {
            likeIcon = GestureDetector(
              onTap: () => _onTapLikedIcon(false),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 35.0,
              ),
            );
          });
        } else {}
      });
    } else {
      Post.unlikePost(widget.loggedInId, widget.postFeed.postId).then((retVal) {
        if (retVal == true) {
          setState(() {
            likeIcon = GestureDetector(
              onTap: () => _onTapLikedIcon(true),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 35.0,
              ),
            );
          });
        }
      });
    }
  }

  /*
  Argument: isFav
    true: Favoriting the post;
    false: Unfavoriting the post;
  */
  void _onTapFavIcon(bool isFav) {
    if (isFav == true) {
      Post.favoritePost(widget.loggedInId, widget.postFeed.postId)
          .then((retVal) {
        if (retVal == true) {
          setState(() {
            favIcon = GestureDetector(
              onTap: () => _onTapFavIcon(false),
              child: Icon(
                Icons.star_outlined,
                color: Colors.yellow,
                size: 35.0,
              ),
            );
          });
        }
      });
    } else {
      Post.unfavoritePost(widget.loggedInId, widget.postFeed.postId)
          .then((retVal) {
        if (retVal == true) {
          setState(() {
            favIcon = GestureDetector(
              onTap: () => _onTapFavIcon(true),
              child: Icon(
                Icons.star_border,
                color: Colors.black,
                size: 35.0,
              ),
            );
          });
        }
      });
    }
  }

  /*
  Argument: isDownload
    true: Downloading the post;
    false: Undownloading the post;
  */
  void _onTapDownloadIcon(bool isDownload) {
    if (isDownload == true) {
      Post.downloadPost(widget.loggedInId, widget.postFeed.postId)
          .then((retVal) {
        if (retVal == true) {
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
      });
    }
  }
}
