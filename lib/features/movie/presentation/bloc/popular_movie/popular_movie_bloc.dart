import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_popular_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies _getPopularMovies;

  PopularMovieBloc(this._getPopularMovies) : super(PopularMovieInitial()) {
    on<GetPopularMovie>(getPopularMovie);
  }

  FutureOr<void> getPopularMovie(
      GetPopularMovie event, Emitter<PopularMovieState> emit) async {
    emit(PopularMovieLoadingState());

    final response = await _getPopularMovies.call();

    response.fold(
      (failure) {
        emit(
          PopularMovieErrorState(
            message: failure.toString(),
          ),
        );
      },
      (films) {
        emit(
          PopularMovieSuccessState(films: films),
        );
      },
    );
  }
}
