import 'package:flutter/material.dart';

const LargeTextSize = 26.0;
const MediumTextSize = 20.0;
const BodyTextSize = 16.0;

const String SubtitleFontNameDefault = 'YeonSung';
const String AppbarFontNameDefault = 'Lobster';

const SubtitleTextStyle = TextStyle(
  fontFamily: SubtitleFontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: MediumTextSize,
  color: Colors.black,
);

const AppBarTextStyle = TextStyle(
  fontFamily: AppbarFontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: LargeTextSize,
  color: Colors.white,
);

const AppTitleTextStyle = TextStyle(
  fontFamily: AppbarFontNameDefault,
  fontWeight: FontWeight.w400,
  fontSize: LargeTextSize,
  color: Colors.black,
);

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Widget showToast(
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
