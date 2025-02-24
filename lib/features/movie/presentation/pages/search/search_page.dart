import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/search_field.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(gradient: AppColor.bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const SmallText(
                    text: "Back",
                    color: AppColor.primary,
                  ),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: AppColor.primary,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    backgroundColor: AppColor.secondary,
                    shape: const StadiumBorder(),
                  ),
                ),
                const Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 280,
                height: 40,
                child: SearchField(),
              ),
            ),
            const SizedBox(height: 15),
            const SmallText(
              text: 'Total Results : 200',
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: 100,
                  width: 300,
                  // child: ListView.builder(
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       color: Colors.red,
                  //     );
                  //   },
                  // ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
