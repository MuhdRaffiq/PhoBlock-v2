import 'package:phoblock/Model/image.dart';

class Post {
  String postCaption;
  int numberDownload;
  int numberFavorite;
  int numberLiked;
  String dateCreated;
  String ownerUsername;
  ImageFile postPicture;

  Post({
    this.postCaption,
    this.numberDownload,
    this.numberFavorite,
    this.numberLiked,
    this.dateCreated,
    this.ownerUsername,
    this.postPicture,
  });

  factory Post.fromJson(Map<dynamic, dynamic> json) {
    ImageFile postImage = ImageFile.fromJson(json['postPicture']);

    return Post(
      postCaption: json['postCaption'],
      numberDownload: json['numberDownload'],
      numberFavorite: json['numberFavorite'],
      numberLiked: json['numberLiked'],
      dateCreated: json['dateCreated'],
      ownerUsername: json['ownerUsername'],
      postPicture: postImage,
    );
  }

  Map toJson() => {
        'postCaption': postCaption,
        'numberDownload': numberDownload,
        'numberFavorite': numberFavorite,
        'numberLiked': numberLiked,
        'dateCreated': dateCreated,
      };
}
