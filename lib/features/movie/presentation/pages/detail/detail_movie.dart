import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({super.key, required this.film});

  final FilmEntities film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.defPadding,
        decoration: const BoxDecoration(
          gradient: AppColor.bgColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomBackButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Detail Movie',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w780${film.posterPath}",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * .5,
                          decoration: BoxDecoration(
                            color: AppColor.secondary.withOpacity(.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(
                                text: film.title.toString(),
                                fontsize: 14,
                                color: AppColor.primary,
                              ),
                              const SizedBox(height: 5),
                              SmallText(
                                text: "Genre",
                                fontsize: 14,
                                color: AppColor.primary,
                              ),
                              SizedBox(height: 10),
                              SmallText(
                                text: film.releaseDate.toString(),
                                fontsize: 14,
                                color: AppColor.primary,
                              ),
                              SizedBox(height: 15),
                              Text(
                                film.overview.toString(),
                                maxLines: 7,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  label: Text("Add Watch List"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
