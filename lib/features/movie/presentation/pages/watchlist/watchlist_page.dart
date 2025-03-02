import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/watchlist/bloc/watchlist_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

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
            Expanded(
              child: BlocBuilder<WatchlistMovieBloc, WatchlistMovieState>(
                bloc: context.read<WatchlistMovieBloc>()
                  ..add(GenerateWatchListMovies()),
                builder: (context, state) {
                  if (state.runtimeType == SuccesGetWatchlistState) {
                    state as SuccesGetWatchlistState;
                    return ListView.builder(
                      itemCount: state.film.length,
                      itemBuilder: (context, index) {
                        final data = state.film[index];
                        return CustomMovieList(
                          title: data.title.toString(),
                          overview: data.overview.toString(),
                          date: data.releaseDate.toString(),
                          poster: data.posterPath.toString(),
                          language: data.originalLanguage.toString(),
                          ontap: () {},
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text("Something Was Wrong"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
