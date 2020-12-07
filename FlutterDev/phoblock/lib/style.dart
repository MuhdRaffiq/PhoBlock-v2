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

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
