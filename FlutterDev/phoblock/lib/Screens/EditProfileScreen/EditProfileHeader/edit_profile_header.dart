import 'package:flutter/material.dart';
import '../../../style.dart';

class EditProfileHeader extends StatelessWidget {
  final String _imagePath;

  EditProfileHeader(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 5.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 66.0,
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: AssetImage(_imagePath),
            ),
          ),
        ),
        Container(
          child: Text(
            'Change Profile Picture',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: hexToColor('#64B6A9'),
            ),
          ),
        ),
      ],
    );
  }
}
