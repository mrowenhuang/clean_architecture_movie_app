import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
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
  int page = 1;
  List<FilmEntities> listFilm = [];

  FilterMovieBloc(this._getLanguageMovies) : super(FilterMovieInitial()) {
    on<GetFilterMovieEvent>(getFilterMovie);
    on<GenerateLanguageMovieEvent>(getLanguageMovieEvent);
    on<GenerateYearMovieEvent>(getYearMovieEvent);
    on<GeneratePaginationFilterMovie>(generatePaginationFilterMovie);
  }

  FutureOr<void> getFilterMovie(
      GetFilterMovieEvent event, Emitter<FilterMovieState> emit) async {
    emit(FilterMovieLoadingState());

    final response = await _getLanguageMovies.call(
      event.language,
      event.year,
    );

    response.fold(
      (failure) {
        emit(FilterMovieErrorState(message: failure.toString()));
      },
      (films) {
        listFilm = films.results!;
        emit(FilterMovieSuccessState(
            films: films, year: event.year, language: event.language));
      },
    );
  }

  FutureOr<void> getYearMovieEvent(
      GenerateYearMovieEvent event, Emitter<FilterMovieState> emit) {
    year = event.year;
    add(GetFilterMovieEvent(language: language, year: event.year));
  }

  FutureOr<void> getLanguageMovieEvent(
      GenerateLanguageMovieEvent event, Emitter<FilterMovieState> emit) {
    language = event.language;
    add(GetFilterMovieEvent(language: event.language, year: year));
  }

  FutureOr<void> generatePaginationFilterMovie(
      GeneratePaginationFilterMovie event,
      Emitter<FilterMovieState> emit) async {
    page = page + 1;
    final response = await _getLanguageMovies.call(
      language,
      year,
      page: page.toString(),
    );

    response.fold(
      (failure) {
        emit(FilterMovieErrorState(message: failure.toString()));
      },
      (films) {
        emit(FilterMovieLoadingState());
        for (var element in films.results!) {
          listFilm.add(element);
        }
        emit(
          FilterMovieSuccessState(
            films: SearchFilmEnities(
                page: films.page,
                results: listFilm,
                totalPages: films.totalPages,
                totalResults: films.totalResults),
            year: year,
            language: language,
          ),
        );
      },
    );
  }
}
