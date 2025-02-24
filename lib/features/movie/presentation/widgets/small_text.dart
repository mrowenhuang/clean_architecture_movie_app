import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    this.color = AppColor.secondary,
    required this.text,
    this.fontsize = 12,
    this.fontWeight = FontWeight.normal,
    this.align = TextAlign.center,
  });

  final Color color;
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
