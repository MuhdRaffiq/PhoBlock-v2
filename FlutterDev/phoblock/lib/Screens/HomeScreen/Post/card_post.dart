import 'package:flutter/material.dart';
import 'post_body.dart';
import 'post_footer.dart';
import 'post_header.dart';
import '../../../style.dart';

class CardPost extends StatelessWidget {
  final String _imagePath;

  CardPost(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          PostHeader(_imagePath),
          PostBody(_imagePath),
          PostFooter(),
        ],
      ),
    );
  }
}
