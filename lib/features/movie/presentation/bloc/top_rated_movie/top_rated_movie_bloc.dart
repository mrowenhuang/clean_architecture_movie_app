import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _getTopRatedMovies;
  int page = 1;
  List<FilmEntities> listFilm = [];

  TopRatedMovieBloc(this._getTopRatedMovies) : super(MovieInitial()) {
    on<GenerateTopRatedMovie>(getTopRatedMovie);
    on<GeneratePaginationTopRatedMovie>(generatePaginationTopRatedMovie);
  }

  FutureOr<void> getTopRatedMovie(
      GenerateTopRatedMovie event, Emitter<TopRatedMovieState> emit) async {
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
        listFilm = films;
        emit(
          TopRatedMovieSuccessState(films: films),
        );
      },
    );
  }

  FutureOr<void> generatePaginationTopRatedMovie(
      GeneratePaginationTopRatedMovie event,
      Emitter<TopRatedMovieState> emit) async {
    page = page + 1;
    final response = await _getTopRatedMovies(page: page.toString());
    response.fold(
      (failure) {
        emit(
          TopRatedMovieErrorState(
            message: failure.toString(),
          ),
        );
      },
      (films) {
        emit(TopRatedMovieLoadingState());

        for (var element in films) {
          listFilm.add(element);
        }
        emit(
          TopRatedMovieSuccessState(films: listFilm),
        );
      },
    );
  }
}
