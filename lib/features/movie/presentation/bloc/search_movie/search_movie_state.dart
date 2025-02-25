part of 'search_movie_bloc.dart';

sealed class SearchMovieState extends Equatable {}

final class SearchMovieInitial extends SearchMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SearchMovieLoadingState extends SearchMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SearchMovieSuccesState extends SearchMovieState {
  final SearchFilmEnities films;

  SearchMovieSuccesState({required this.films});

  @override
  // TODO: implement props
  List<Object?> get props => [films];
}

final class SearchMovieErrorState extends SearchMovieState {
  final String message;

  SearchMovieErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
