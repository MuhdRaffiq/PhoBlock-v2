class ImageFile {
  String imageName;
  String imageType;
  String imageString;

  ImageFile(this.imageName, this.imageType, this.imageString);

  Map toJson() => {
        'imageName': imageName,
        'imageType': imageType,
        'imageString': imageString,
      };
}
