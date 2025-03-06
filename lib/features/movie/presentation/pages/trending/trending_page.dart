import 'package:clean_architecture_movie_app/common/navigator/app_navigator.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/trending_movie/bloc/trending_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/watchlist/bloc/watchlist_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/detail/detail_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_movie_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_scollCall);
  }

  void _scollCall() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          context.read<TrendingMovieBloc>().add(GeneratePaginationTrendingMovieEvent());
        },
      );
    }
  }

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
                  'Popular Movie',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _trendingResult(context),
          ],
        ),
      ),
    );
  }

  Widget _trendingResult(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        builder: (context, state) {
          if (state is LoadingTrendingMovieState) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: AppColor.primary,
              ),
            );
          } else if (state is SuccessTrendingMovieState) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ListView.builder(
                itemCount: state.films.length,
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = state.films[index];
                  return BlocBuilder<WatchlistMovieBloc, WatchlistMovieState>(
                    builder: (context, state) {
                      if (state is SuccesGetWatchlistState) {
                        data.fav =
                            state.film.any((element) => element.id == data.id)
                                ? true
                                : false;
                      }
                      return CustomMovieList(
                        ontap: () {
                          AppNavigator.push(context, DetailPage(film: data));
                        },
                        title: data.title.toString(),
                        overview: data.overview.toString(),
                        date: data.releaseDate.toString(),
                        poster: data.posterPath.toString(),
                        language: data.originalLanguage.toString(),
                        likeTap: () {
                          context
                              .read<WatchlistMovieBloc>()
                              .add(AddFilmToWatchlist(film: data));
                        },
                        status: data.fav!,
                      );
                    },
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
