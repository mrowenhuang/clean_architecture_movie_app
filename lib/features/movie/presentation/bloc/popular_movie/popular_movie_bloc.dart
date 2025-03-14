import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_popular_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies _getPopularMovies;
  int page = 1;
  List<FilmEntities> listFilm = [];

  PopularMovieBloc(this._getPopularMovies) : super(PopularMovieInitial()) {
    on<GeneratePopularMovie>(getPopularMovie);
    on<GeneratePaginationPopularMovie>(generatePaginationPopularMovie);
  }

  FutureOr<void> getPopularMovie(
      GeneratePopularMovie event, Emitter<PopularMovieState> emit) async {
    emit(PopularMovieLoadingState());

    final response = await _getPopularMovies();

    response.fold(
      (failure) {
        emit(
          PopularMovieErrorState(
            message: failure.toString(),
          ),
        );
      },
      (films) {
        listFilm = films;
        emit(
          PopularMovieSuccessState(films: films),
        );
      },
    );
  }

  FutureOr<void> generatePaginationPopularMovie(
      GeneratePaginationPopularMovie event,
      Emitter<PopularMovieState> emit) async {
    page = page + 1;
    final response = await _getPopularMovies(page: page.toString());

    response.fold(
      (failure) {
        emit(
          PopularMovieErrorState(
            message: failure.toString(),
          ),
        );
      },
      (films) {
        emit(PopularMovieLoadingState());

        for (var element in films) {
          listFilm.add(element);
        }
        emit(
          PopularMovieSuccessState(films: listFilm),
        );
      },
    );
  }
}
