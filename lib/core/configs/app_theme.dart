import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      fontFamily: GoogleFonts.inter().fontFamily,
      // textTheme: Theme.of(context)
          // .textTheme
          // .apply(bodyColor: AppColor.def, displayColor: AppColor.def),
    );
  }

  static EdgeInsets defPadding = const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 40);
}
