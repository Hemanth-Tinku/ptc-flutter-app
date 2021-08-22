import 'package:flutter/material.dart';

const LargeTextSize = 26.0;
const MediumTextSize = 18.0;
const BodyTextSize = 16.0;
const String FontNameDefault = 'Monsterrat';

var elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ));

class Style {
  static Widget textHeading(String text, Color color) {
    return Text(text,
        style: TextStyle(
            fontSize: MediumTextSize,
            // fontWeight: FontWeight.w600,
            color: color));
  }
}
