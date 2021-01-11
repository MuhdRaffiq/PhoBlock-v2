import 'package:flutter/material.dart';
import 'package:phoblock/Model/post.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostFooter extends StatefulWidget {
  final int loggedInId;
  final Post postFeed;

  PostFooter({this.loggedInId, this.postFeed});

  @override
  PostFooterState createState() => PostFooterState();
}

class PostFooterState extends State<PostFooter> {
  Widget likeIcon;
  Widget favIcon;
  Widget downloadIcon;

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
