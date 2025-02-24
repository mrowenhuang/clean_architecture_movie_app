part of 'popular_movie_bloc.dart';

sealed class PopularMovieState extends Equatable {}

final class PopularMovieInitial extends PopularMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PopularMovieLoadingState extends PopularMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class PopularMovieSuccessState extends PopularMovieState {
  final List<FilmEntities> films;

  PopularMovieSuccessState({required this.films});

  @override
  // TODO: implement props
  List<Object?> get props => [films];
}

final class PopularMovieErrorState extends PopularMovieState {
  final String message;

  PopularMovieErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
