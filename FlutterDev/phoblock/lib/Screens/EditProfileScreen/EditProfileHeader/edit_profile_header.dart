import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../style.dart';

class EditProfileHeader extends StatefulWidget {
  final String imagePath;
  Key key;

  EditProfileHeader({this.key, this.imagePath}) : super(key: key);

  @override
  State<EditProfileHeader> createState() => EditProfileHeaderState();
}

class EditProfileHeaderState extends State<EditProfileHeader> {
  File _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = null;
  }

  Future<void> getImage(context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  Widget displayProfilePicture() {
    if (_imageFile == null) {
      return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 66.0,
          child: CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage(widget.imagePath),
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
            backgroundImage: FileImage(_imageFile),
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
