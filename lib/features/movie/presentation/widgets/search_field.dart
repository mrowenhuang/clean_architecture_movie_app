import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: AppColor.primary),
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 2,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: "Search",
        hintStyle: const TextStyle(
          color: AppColor.primary,
          fontSize: 14,
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
