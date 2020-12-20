import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class PreviewScreen extends StatefulWidget {
  String imgPath;

  PreviewScreen({this.imgPath});

  @override
  _PreviewScreenState createState() {
    return _PreviewScreenState();
  }
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      getBytes().then((bytes) {
                        Share.file(
                          'Share via',
                          basename(widget.imgPath),
                          bytes.buffer.asInt8List(),
                          'image/path',
                        );
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytes() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;

    return ByteData.view(bytes.buffer);
  }
}
