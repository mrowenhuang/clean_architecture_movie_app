import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.defPadding,
        decoration: const BoxDecoration(gradient: AppColor.bgColor),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.secondary,
                border: Border.all(
                  width: 1,
                  color: AppColor.primary,
                ),
              ),
              child: const Text(
                "Wathlist Movie",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
