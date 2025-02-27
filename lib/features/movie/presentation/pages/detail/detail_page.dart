import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.film});

  final FilmEntities film;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        padding: EdgeInsets.only(top: 10, right: 20, left: 20),
        color: AppColor.secondary,
        panel: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 5,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomText(
              text: film.title.toString(),
              fontsize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
            const SizedBox(height: 5),
            const CustomText(
              text: "Genre",
              color: AppColor.primary,
            ),
            const SizedBox(height: 5),
            CustomText(
              text: film.releaseDate.toString(),
              color: AppColor.primary,
              fontsize: 14,
            ),
            Expanded(
              child: Scrollbar(
                scrollbarOrientation: ScrollbarOrientation.left,
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
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text("Add To Watch List"),
              icon: const Icon(Icons.bookmark_add_outlined),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 40,
                  50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w780${film.posterPath}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
