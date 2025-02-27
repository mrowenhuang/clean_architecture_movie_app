import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_language_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_movie_event.dart';
part 'filter_movie_state.dart';

class FilterMovieBloc extends Bloc<FilterMovieEvent, FilterMovieState> {
  final GetLanguageMovies _getLanguageMovies;
  String year = DateTime.now().year.toString();
  String language = "id";

  FilterMovieBloc(this._getLanguageMovies) : super(FilterMovieInitial()) {
    on<GetFilterMovieEvent>(getFilterMovie);
    on<GetLanguageMovieEvent>(getLanguageMovieEvent);
    on<GetYearMovieEvent>(getYearMovieEvent);
  }

  FutureOr<void> getFilterMovie(
      GetFilterMovieEvent event, Emitter<FilterMovieState> emit) async {
    emit(FilterMovieLoadingState());

    final response = await _getLanguageMovies.call(
      event.language,
      event.year,
      page: event.page,
    );

    response.fold(
      (failure) {
        emit(FilterMovieErrorState(message: failure.toString()));
      },
      (films) {
        emit(FilterMovieSuccessState(
            films: films, year: event.year, language: event.language));
      },
    );
  }

  FutureOr<void> getYearMovieEvent(
      GetYearMovieEvent event, Emitter<FilterMovieState> emit) {
    year = event.year;
    add(GetFilterMovieEvent(language: language, year: event.year, page: "1"));
  }

  FutureOr<void> getLanguageMovieEvent(
      GetLanguageMovieEvent event, Emitter<FilterMovieState> emit) {
    language = event.language;
    add(GetFilterMovieEvent(language: event.language, year: year, page: "1"));
  }
}
