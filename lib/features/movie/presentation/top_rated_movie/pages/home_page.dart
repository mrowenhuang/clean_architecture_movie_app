import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.bgColor,
        ),
        child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
          bloc: sl<TopRatedMovieBloc>()..add(GetTopRatedMovie()),
          builder: (context, state) {
            if (state.runtimeType == TopRatedMovieLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state.runtimeType == TopRatedMovieSuccessState) {
              state as TopRatedMovieSuccessState;
              return ListView.builder(
                itemCount: state.films.length,
                itemBuilder: (context, index) {
                  var data = state.films[index];
                  return ListTile(
                    title: Text(data.originalTitle.toString()),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
