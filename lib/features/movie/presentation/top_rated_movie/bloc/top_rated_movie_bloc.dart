import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_Top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMovieBloc(this._getTopRatedMovies) : super(MovieInitial()) {
    on<GetTopRatedMovie>(getTopRatedMovie);
  }

  FutureOr<void> getTopRatedMovie(
      GetTopRatedMovie event, Emitter<TopRatedMovieState> emit) async {
    emit(TopRatedMovieLoadingState());

    final response = await _getTopRatedMovies();

    response.fold(
      (failure) {
        emit(
          TopRatedMovieErrorState(
            message: failure.toString(),
          ),
        );
      },
      (films) {
        emit(
          TopRatedMovieSuccessState(films: films),
        );
      },
    );
  }
}
