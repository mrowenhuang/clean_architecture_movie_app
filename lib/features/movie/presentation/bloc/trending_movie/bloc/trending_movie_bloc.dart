import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_trending_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovies _getTrendingMovies;
  int page = 1;
  List<FilmEntities> filmList = [];

  TrendingMovieBloc(this._getTrendingMovies) : super(TrendingMovieInitial()) {
    on<GenerateTrendingMovieEvent>(generateTrendingMovieEvent);
    on<GeneratePaginationTrendingMovieEvent>(
        generatePaginationTrendingMovieEvent);
  }

  FutureOr<void> generateTrendingMovieEvent(GenerateTrendingMovieEvent event,
      Emitter<TrendingMovieState> emit) async {
    emit(LoadingTrendingMovieState());
    final response = await _getTrendingMovies();

    response.fold(
      (failure) {
        emit(
          ErrorTrendingMovieState(message: failure.message),
        );
      },
      (film) {
        filmList = film;
        emit(SuccessTrendingMovieState(films: film));
      },
    );
  }

  FutureOr<void> generatePaginationTrendingMovieEvent(
      GeneratePaginationTrendingMovieEvent event,
      Emitter<TrendingMovieState> emit) async {
    page = page + 1;
    final response = await _getTrendingMovies(page: page.toString());

    response.fold(
      (failure) {
        emit(
          ErrorTrendingMovieState(message: failure.message),
        );
      },
      (film) {
        emit(LoadingTrendingMovieState());
        for (var element in film) {
          filmList.add(element);
        }
        emit(SuccessTrendingMovieState(films: filmList));
      },
    );
  }
}
