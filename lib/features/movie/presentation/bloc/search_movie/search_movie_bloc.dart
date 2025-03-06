import 'dart:async';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_search_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies _getSearchMovies;
  int page = 1;
  List<FilmEntities> listFilm = [];

  SearchMovieBloc(this._getSearchMovies) : super(SearchMovieInitial()) {
    on<GenerateSearchMovie>(getSearchMovie);
    on<GeneratePaginationSearchMovie>(generatePaginationSearchMovie);
  }

  FutureOr<void> getSearchMovie(
      GenerateSearchMovie event, Emitter<SearchMovieState> emit) async {
    emit(SearchMovieLoadingState());

    final response = await _getSearchMovies.call(event.keyword);

    response.fold(
      (failure) {
        emit(SearchMovieErrorState(message: failure.toString()));
      },
      (films) {
        listFilm = films.results!;
        emit(SearchMovieSuccesState(films: films));
      },
    );
  }

  FutureOr<void> generatePaginationSearchMovie(
      GeneratePaginationSearchMovie event,
      Emitter<SearchMovieState> emit) async {
    page = page + 1;
    final response =
        await _getSearchMovies.call(event.keyword, page: page.toString());

    response.fold(
      (failure) {
        emit(
          SearchMovieErrorState(
            message: failure.toString(),
          ),
        );
      },
      (films) {
        emit(SearchMovieLoadingState());

        for (var element in films.results!) {
          listFilm.add(element);
        }
        emit(
          SearchMovieSuccesState(
            films: SearchFilmEnities(
              totalResults: films.totalResults,
              results: listFilm,
              totalPages: films.totalPages,
              page: page,
            ),
          ),
        );
      },
    );
  }
}
