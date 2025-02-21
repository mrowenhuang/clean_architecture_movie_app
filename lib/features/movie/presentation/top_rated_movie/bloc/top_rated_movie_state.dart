part of 'top_rated_movie_bloc.dart';

abstract class TopRatedMovieState extends Equatable {}

class MovieInitial extends TopRatedMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TopRatedMovieLoadingState extends TopRatedMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TopRatedMovieErrorState extends TopRatedMovieState {
  final String message;

  TopRatedMovieErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [
    message
  ];
}

class TopRatedMovieSuccessState extends TopRatedMovieState {
  final List<FilmEntities> films;

  TopRatedMovieSuccessState({required this.films});

  @override
  // TODO: implement props
  List<Object?> get props => [films];
}
