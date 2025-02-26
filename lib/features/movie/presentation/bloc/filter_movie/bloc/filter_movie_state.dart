part of 'filter_movie_bloc.dart';

sealed class FilterMovieState extends Equatable {}

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

  FilterMovieSuccessState({required this.films});

  @override
  // TODO: implement props
  List<Object?> get props => [films];
}

final class FilterMovieLanguageState extends FilterMovieState {
  final String language;

  FilterMovieLanguageState({required this.language});

  @override
  // TODO: implement props
  List<Object?> get props => [language];
}

final class FilterMovieYearState extends FilterMovieState {
  final String year;

  FilterMovieYearState({required this.year});

  @override
  // TODO: implement props
  List<Object?> get props => [year];
}

final class FilterMovieErrorState extends FilterMovieState {
  final String message;

  FilterMovieErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
