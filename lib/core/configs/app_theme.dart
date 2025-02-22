import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
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
}
