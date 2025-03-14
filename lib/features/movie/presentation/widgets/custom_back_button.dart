import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.ontap,
  });

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: ontap,
      label: const CustomText(
        text: "Back",
        color: AppColor.primary,
      ),
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 20,
        color: AppColor.primary,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        backgroundColor: AppColor.secondary,
        shape: const StadiumBorder(),
      ),
    );
  }
}
