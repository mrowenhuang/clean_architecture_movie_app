import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/search_field.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMoviePage extends StatelessWidget {
  const HomeMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.bgColor,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 40,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome\n19-03-2025',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _search(context),
                    const SizedBox(height: 15),
                    const Text.rich(
                      TextSpan(
                        text: "Watch List ",
                        style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "- 19-03-2025",
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    _watchList(context, constraints),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: "Top Rated",
                          fontsize: 16,
                        ),
                        Text(
                          "See More",
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    _topRated(context, constraints),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          text: "Popular",
                          fontsize: 16,
                        ),
                        Text(
                          "See More",
                          style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _popular(context, constraints),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _search(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 200,
        height: 40,
        child: SearchField(),
      ),
    );
  }

  Widget _watchList(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: 150,
      width: constraints.maxWidth,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: "https://picsum.photos/id/24$index/200/300",
                          placeholder: (context, url) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                color: AppColor.primary,
                              ),
                            );
                          },
                          height: 100,
                          width: 180,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: 60,
                            height: 25,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: AppColor.shadow,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              color: AppColor.primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "9:00",
                              style: TextStyle(
                                color: AppColor.secondary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SmallText(text: "Movie Name"),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _topRated(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: 170,
      width: constraints.maxWidth,
      child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
        bloc: sl<TopRatedMovieBloc>()..add(GetTopRatedMovie()),
        builder: (context, state) {
          if (state.runtimeType == TopRatedMovieLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: AppColor.primary,
              ),
            );
          } else if (state.runtimeType == TopRatedMovieSuccessState) {
            state as TopRatedMovieSuccessState;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.films.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var data = state.films[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://image.tmdb.org/t/p/w780${data.posterPath}",
                            placeholder: (context, url) {
                              return const Center(
                                child: CupertinoActivityIndicator(
                                  color: AppColor.primary,
                                ),
                              );
                            },
                            fit: BoxFit.fill,
                            height: 130,
                            width: 100,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 100,
                        child: SmallText(
                          text: data.title.toString(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _popular(BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      height: 280,
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
        bloc: sl<PopularMovieBloc>()..add(GetPopularMovie()),
        builder: (context, state) {
          if (state.runtimeType == PopularMovieLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: AppColor.primary,
              ),
            );
          } else if (state.runtimeType == PopularMovieSuccessState) {
            state as PopularMovieSuccessState;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.films.length,
              itemBuilder: (context, index) {
                var data = state.films[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: constraints.maxWidth,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.secondary,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.shadow,
                                  blurRadius: 10,
                                  offset: Offset(-10, 10),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w780${data.posterPath}",
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CupertinoActivityIndicator(
                                      color: AppColor.primary,
                                    ),
                                  );
                                },
                                fit: BoxFit.fill,
                                width: 100,
                                height: 160,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 15, top: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: data.title.toString(),
                                      fontsize: 14,
                                      color: AppColor.primary,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: AppColor.primary,
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.more_horiz_outlined,
                                        color: AppColor.secondary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const SmallText(
                                  text: "Genre",
                                  color: AppColor.primary,
                                  fontsize: 11,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  data.overview.toString(),
                                  maxLines: 7,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
