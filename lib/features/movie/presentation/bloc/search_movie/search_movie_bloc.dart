import 'dart:async';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_search_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies _getSearchMovies;

  SearchMovieBloc(this._getSearchMovies) : super(SearchMovieInitial()) {
    on<GetSearchMovie>(getSearchMovie);
  }

  FutureOr<void> getSearchMovie(
      GetSearchMovie event, Emitter<SearchMovieState> emit) async {
    emit(SearchMovieLoadingState());

    final response = await _getSearchMovies.call(event.keyword);

    response.fold(
      (failure) {
        emit(SearchMovieErrorState(message: failure.toString()));
      },
      (films) {
        emit(SearchMovieSuccesState(films: films));
      },
    );
  }
}
