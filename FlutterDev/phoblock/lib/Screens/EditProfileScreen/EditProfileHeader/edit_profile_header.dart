import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phoblock/Model/image.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
// ignore: must_be_immutable
class EditProfileHeader extends StatefulWidget {
  //final String imagePath;
  ImageFile userDp;
  Key key;

  EditProfileHeader({this.key, this.userDp}) : super(key: key);

  @override
  State<EditProfileHeader> createState() => EditProfileHeaderState();
}

class EditProfileHeaderState extends State<EditProfileHeader> {
  File imageFile;

  @override
  void initState() {
    super.initState();
    imageFile = null;
  }

  Future<void> getImage(context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image;
    });
  }

  Widget displayProfilePicture() {
    if (imageFile == null && widget.userDp == null) {
      return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 66.0,
          child: CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage(
                "assets/images/doe.jpg"), //AssetImage(widget.imagePath),
          ),
        ),
      );
    } else if (imageFile == null && widget.userDp != null) {
      Uint8List imageBytes = base64.decode(widget.userDp.imageString);

      return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 66.0,
          child: CircleAvatar(
            radius: 65.0,
            backgroundImage: MemoryImage(imageBytes),
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 66.0,
          child: CircleAvatar(
            radius: 65.0,
            backgroundImage: FileImage(imageFile),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        displayProfilePicture(),
        Container(
          child: GestureDetector(
            child: Text(
              'Change Profile Picture',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: hexToColor('#64B6A9'),
              ),
            ),
            onTap: () {
              getImage(context);
            },
          ),
        ),
      ],
    );
  }
}
