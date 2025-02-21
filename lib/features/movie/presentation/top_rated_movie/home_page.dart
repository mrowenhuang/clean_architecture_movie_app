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
      body: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
        bloc: sl<TopRatedMovieBloc>()..add(GetTopRatedMovie()),
        builder: (context, state) {
          if (state.runtimeType == TopRatedMovieLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state.runtimeType == TopRatedMovieSuccessState) {
            return const Center(
              child: Text("succes"),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
