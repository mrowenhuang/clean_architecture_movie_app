import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xff00818A);
  static const Color secondary = Color(0xffDBEDF3);
  static const Color tertiary = Color(0xff404B69);
  static const Color quaternary = Color(0xff283149);
  static const Color def = Color(0xffffffff);

  static const bgColor = LinearGradient(
    colors: [quaternary, tertiary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
