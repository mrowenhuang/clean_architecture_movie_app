import 'package:clean_architecture_movie_app/common/navigator/app_navigator.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/detail/detail_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_movie_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.defPadding,
        decoration: const BoxDecoration(gradient: AppColor.bgColor),
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
                  'Top Rated Movie',
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
              child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
                bloc: context.read<TopRatedMovieBloc>(),
                builder: (context, state) {
                  if (state is TopRatedMovieLoadingState) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  } else if (state is TopRatedMovieSuccessState) {
                    return ListView.builder(
                      itemCount: state.films.length,
                      itemBuilder: (context, index) {
                        var data = state.films[index];
                        return CustomMovieList(
                          ontap: () {
                            AppNavigator.push(
                              context,
                              DetailPage(film: data),
                            );
                          },
                          title: data.title.toString(),
                          overview: data.overview.toString(),
                          date: data.releaseDate.toString(),
                          poster: data.posterPath.toString(),
                          language: data.originalLanguage.toString(),
                          likeTap: () {},
                          status: false,
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
