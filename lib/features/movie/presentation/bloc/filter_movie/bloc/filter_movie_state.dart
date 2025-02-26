part of 'filter_movie_bloc.dart';

sealed class FilterMovieState extends Equatable {
  
}

final class FilterMovieInitial extends FilterMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class FilterMovieLoadingState extends FilterMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class FilterMovieSuccessState extends FilterMovieState {
  final SearchFilmEnities films;
  final String? year;
  final String? language;

  FilterMovieSuccessState(
      {required this.year, required this.language, required this.films});

  @override
  // TODO: implement props
  List<Object?> get props => [films, year, language];
}

final class FilterMovieErrorState extends FilterMovieState {
  final String message;

  FilterMovieErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
