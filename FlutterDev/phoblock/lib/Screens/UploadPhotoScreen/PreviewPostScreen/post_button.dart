import 'dart:async';

import 'custom_outline_button.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import '../../../app.dart';
import '../../../style.dart';
import '../../../Model/image.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class PostButton extends StatelessWidget {
  static const double _hPad = 40.0;
  final int userId;
  final File imageFile;
  final captionController;

  PostButton(this.userId, this.imageFile, this.captionController);

  @override
  Widget build(BuildContext context) {
    return _showButton(context);
  }

  Widget _showButton(context) {
    if (userId == null && imageFile == null && captionController == null) {
      return Spacer();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 0.0),
            child: CustomOutlineButton(
              text: "Post",
              color: hexToColor('#64B6A9'),
              onPressed: () {
                String captionString = captionController.text;

                createPost(captionString).then((response) {
                  if (response.statusCode == 200) {
                    FToast.toast(
                      context,
                      toast: _showToast(
                        context,
                        jsonDecode(response.body)["detailMessage"],
                        hexToColor('#64B6A9'),
                        false,
                      ),
                    );

                    Timer(Duration(seconds: 1), () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AfterLoginRoute,
                        (Route<dynamic> route) => false,
                        arguments: {"usedID": userId},
                      );
                    });
                  } else if (response.statusCode == 406) {
                    FToast.toast(
                      context,
                      toast: _showToast(
                        context,
                        jsonDecode(response.body)["detailMessage"],
                        Colors.red,
                        true,
                      ),
                    );
                  } else {
                    FToast.toast(
                      context,
                      toast: _showToast(
                        context,
                        'Server Error',
                        Colors.red,
                        true,
                      ),
                    );
                  }
                });
              },
            ),
          )
        ],
      );
    }
  }

  Future<http.Response> createPost(String postCaption) async {
    //Get date time now
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    String imageFullName = basename(imageFile.path);
    String imgName = imageFullName.split(".")[0];
    String imgType = imageFullName.split(".")[1];
    //Get image bytes
    Uint8List bytes = await imageFile.readAsBytes();
    //Conver byte to String
    String _img64String = base64Encode(bytes);
    //Convert to Json Object
    ImageFile image = new ImageFile(
      imageName: imgName,
      imageType: imgType,
      imageString: _img64String,
    );
    var parsedJson = json.decode(jsonEncode(image));

    final http.Response response = await http.post(
        'http://127.0.0.1:8080/users/user/' + userId.toString() + '/posts',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'postCaption': postCaption,
          'numberDownload': 0,
          'numberFavorite': 0,
          'numberLiked': 0,
          'dateCreated': formattedDate,
          'postPicture': parsedJson,
        }));

    return response;
  }

  Widget _showToast(
      BuildContext buildContext, String text, Color color, bool isFailed) {
    Widget toast;

    if (isFailed == true) {
      toast = Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 35.0),
            width: MediaQuery.of(buildContext).size.width - 80,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.2, color: Colors.black),
                bottom: BorderSide(width: 0.2, color: Colors.black),
                left: BorderSide(width: 0.2, color: Colors.black),
                right: BorderSide(width: 0.2, color: Colors.black),
              ),
              borderRadius: BorderRadius.circular(5.0),
              color: color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.block_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      toast = Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 35.0),
            width: MediaQuery.of(buildContext).size.width - 80,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.2, color: Colors.black),
                bottom: BorderSide(width: 0.2, color: Colors.black),
                left: BorderSide(width: 0.2, color: Colors.black),
                right: BorderSide(width: 0.2, color: Colors.black),
              ),
              borderRadius: BorderRadius.circular(5.0),
              color: color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return toast;
  }
}
