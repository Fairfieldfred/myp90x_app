import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

const kBottomContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInActiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);

const kWorkoutNameTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
  // decoration: TextDecoration.underline,
);
const kProgramNameTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.underline,
);
const kWorkoutListTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w500,
  color: Colors.black
);
const kWorkoutNameCardTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    color: Colors.black
);
const kPickerViewTextStyle = TextStyle(
  fontSize: 18.0, color: Colors.white,
);
const kPickerViewPickerTextStyle = TextStyle(
  fontSize: 18.0, color: Colors.white,
  decoration: TextDecoration.underline,
);
const kDoneOrNotViewTextStyle = TextStyle(
  fontSize: 22.0, color: Colors.white,
  fontWeight: FontWeight.w700
);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0, color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
fontSize: 50.0,
fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);
const kResultTextStyle = TextStyle(
  fontSize: 22.0,
  color: Color(0xFF1D1E33),
  fontWeight: FontWeight.bold,
);
const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);
const kBodyTextStyle = TextStyle(
  fontSize: 22.0
);
class Screen {
  static double get _ppi => (Platform.isAndroid || Platform.isIOS)? 150 : 96;
  static bool isLandscape(BuildContext c) => MediaQuery.of(c).orientation == Orientation.landscape;
  //PIXELS
  static Size size(BuildContext c) => MediaQuery.of(c).size;
  static double width(BuildContext c) => size(c).width;
  static double height(BuildContext c) => size(c).height;
  static double diagonal(BuildContext c) {
    Size s = size(c);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }
  //INCHES
  static Size inches(BuildContext c) {
    Size pxSize = size(c);
    return Size(pxSize.width / _ppi, pxSize.height/ _ppi);
  }
  static double widthInches(BuildContext c) => inches(c).width;
  static double heightInches(BuildContext c) => inches(c).height;
  static double diagonalInches(BuildContext c) => diagonal(c) / _ppi;
}