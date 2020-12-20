import 'dart:io';

import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  final File imageFile;

  PostBody(this.imageFile);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      constraints: BoxConstraints.expand(
        height: 400.0,
      ),
      child: Image.file(
        imageFile,
        fit: BoxFit.cover,
      ),
    );
  }
}
