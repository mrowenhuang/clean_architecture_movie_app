import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMovieList extends StatelessWidget {
  const CustomMovieList({
    super.key,
    required this.title,
    required this.overview,
    required this.date,
    required this.poster,
    required this.language, required this.ontap,
  });

  final String title;
  final String language;
  final String overview;
  final String date;
  final String poster;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 140,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.only(
                    left: 100,
                    top: 10,
                    bottom: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 220,
                            child: SmallText(
                              text: title,
                              color: AppColor.primary,
                              fontsize: 14,
                              align: TextAlign.left,
                            ),
                          ),
                          SmallText(
                            text: language,
                            color: AppColor.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        overview,
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      const Spacer(),
                      SmallText(
                        text: date,
                        fontsize: 11,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/w780$poster",
                    height: 130,
                    width: 80,
                    fit: BoxFit.fill,
                    placeholder: (context, url) {
                      return const Center(
                        child: CupertinoActivityIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    },
                    errorListener: (value) {},
                  ),
                ),
              ),
              Positioned(
                bottom: 3,
                right: 3,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1, 5),
                          color: AppColor.shadow)
                    ],
                  ),
                  child: const Icon(
                    Icons.bookmark_add_outlined,
                    color: AppColor.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
