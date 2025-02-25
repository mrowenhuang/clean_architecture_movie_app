import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_movie_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(gradient: AppColor.bgColor),
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
          const SizedBox(height: 15),
          Expanded(
            child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
              bloc: context.read<PopularMovieBloc>(),
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
                    itemCount: state.films.length,
                    itemBuilder: (context, index) {
                      var data = state.films[index];
                      return CustomMovieList(
                        title: data.title.toString(),
                        overview: data.overview.toString(),
                        date: data.releaseDate.toString(),
                        poster: data.posterPath.toString(),
                        language: data.originalLanguage.toString(),
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
    );
  }
}
