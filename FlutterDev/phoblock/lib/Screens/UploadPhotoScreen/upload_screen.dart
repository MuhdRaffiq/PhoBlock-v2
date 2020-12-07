import 'package:flutter/material.dart';
import '../../style.dart';

class UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
        backgroundColor: hexToColor('#64B6A9'),
      ),
    );
  }
}
