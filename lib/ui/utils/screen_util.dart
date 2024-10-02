import 'package:flutter/material.dart';

double getTopSafePadding(BuildContext context) {
  var binding = WidgetsBinding.instance;
  return MediaQueryData.fromWindow(binding.window).padding.top;
}

double getBottomSafePadding(BuildContext context) {
  MediaQueryData data = MediaQuery.of(context);
  return data.padding.bottom;
}

Widget spacerVertical(double height) {
  return SizedBox(height: height);
}

Widget spacerHorizontal(double width) {
  return SizedBox(width: width);
}

Widget spacerAdaptive() {
  return Expanded(child: Container());
}

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
