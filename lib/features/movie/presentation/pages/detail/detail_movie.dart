import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget {
  DetailMovie({super.key, required this.film});

  final FilmEntities film;
  final ScrollController _scrollController = ScrollController();

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
                          height: MediaQuery.of(context).size.height * .4,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColor.secondary.withOpacity(.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(
                                text: film.title.toString(),
                                fontsize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary,
                              ),
                              const SizedBox(height: 5),
                              const SmallText(
                                text: "Genre",
                                color: AppColor.primary,
                              ),
                              const SizedBox(height: 10),
                              SmallText(
                                text: film.releaseDate.toString(),
                                color: AppColor.primary,
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Scrollbar(
                                  scrollbarOrientation:
                                      ScrollbarOrientation.left,
                                  controller: _scrollController,
                                  thumbVisibility: true,
                                  child: ListView(
                                    controller: _scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    children: [
                                      Text(
                                        film.overview.toString(),
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 11,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {},
                                label: const Text("Add To Watch List"),
                                icon: const Icon(Icons.bookmark_add_outlined),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  fixedSize: Size(
                                    MediaQuery.of(context).size.width,
                                    40,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              )
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
