import 'package:clean_architecture_movie_app/common/navigator/app_navigator.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/watchlist/bloc/watchlist_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/detail/detail_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_movie_list.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/search_field.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchCont = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(_scrollCall);
  }

  void _scrollCall() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          context.read<SearchMovieBloc>().add(
                GeneratePaginationSearchMovie(keyword: searchCont.text),
              );
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
                "Search",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 280,
                height: 40,
                child: SearchField(
                  textEditingController: searchCont,
                  onSubmmited: (value) {
                    context.read<SearchMovieBloc>().add(
                          GenerateSearchMovie(keyword: value),
                        );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            _result(context),
            const SizedBox(height: 10),
            _resultArea(context),
          ],
        ),
      ),
    );
  }

  // info : Result Area
  Widget _result(BuildContext context) {
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: context.read<SearchMovieBloc>(),
      builder: (context, state) {
        if (state is SearchMovieInitial) {
          return const SizedBox();
        } else if (state is SearchMovieLoadingState) {
          return const CustomText(
            text: 'Total Results : ....',
            fontWeight: FontWeight.bold,
          );
        } else if (state is SearchMovieSuccesState) {
          return CustomText(
            text: 'Total Results : ${state.films.totalResults}',
            fontWeight: FontWeight.bold,
          );
        }
        return const SizedBox();
      },
    );
  }

  // info : Result Area Filter
  Widget _resultArea(BuildContext context) {
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
        builder: (context, watchListState) {
          return BlocBuilder<SearchMovieBloc, SearchMovieState>(
            bloc: context.read<SearchMovieBloc>(),
            builder: (context, state) {
              if (state is SearchMovieInitial) {
                return const Center(
                  child: CustomText(
                    text: "Try Searching",
                    color: AppColor.secondary,
                    fontWeight: FontWeight.bold,
                    fontsize: 14,
                  ),
                );
              } else if (state is SearchMovieLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                );
              } else if (state is SearchMovieSuccesState) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.films.results!.length,
                    itemBuilder: (context, index) {
                      final data = state.films.results![index];
                      if (watchListState is SuccesGetWatchlistState) {
                        data.fav = watchListState.film
                                .any((element) => element.id == data.id)
                            ? true
                            : false;
                      }
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
                        likeTap: () {
                          context
                              .read<WatchlistMovieBloc>()
                              .add(AddFilmToWatchlist(film: data));
                        },
                        status: data.fav!,
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
