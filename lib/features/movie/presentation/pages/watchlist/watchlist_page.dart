import 'package:clean_architecture_movie_app/common/navigator/app_navigator.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/watchlist/bloc/watchlist_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/detail/detail_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_movie_list.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 15),
            _whistlistResult(context),
          ],
        ),
      ),
    );
  }

  // info : Whistlist Area
  Widget _whistlistResult(BuildContext context) {
    return Expanded(
      child: BlocConsumer<WatchlistMovieBloc, WatchlistMovieState>(
        listener: (context, watchListState) {
          if (watchListState is SuccessAddToWatchlistState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: AppColor.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                content: Text(watchListState.message),
              ),
            );
          } else if (watchListState is SuccesRemoveWatchlistState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                content: Text(watchListState.message),
              ),
            );
          }
        },
        bloc: context.read<WatchlistMovieBloc>()
          ..add(GenerateWatchListMovies()),
        builder: (context, state) {
          if (state is LoadingGenerateWatchlistState) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: AppColor.primary,
              ),
            );
          } else if (state is SuccesGetWatchlistState) {
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
                  ontap: () {
                    AppNavigator.push(context, DetailPage(film: data));
                  },
                  likeTap: () {
                    context
                        .read<WatchlistMovieBloc>()
                        .add(AddFilmToWatchlist(film: data));
                  },
                  status: data.fav!,
                  // status: data.fav!,
                );
              },
            );
          } else if (state is ErrorGetWatchlistState) {
            return Center(
                child: CustomText(
              text: state.message,
              fontWeight: FontWeight.bold,
              fontsize: 12,
            ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
