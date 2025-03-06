part of 'trending_movie_bloc.dart';

sealed class TrendingMovieState extends Equatable {
  const TrendingMovieState();

  @override
  List<Object> get props => [];
}

final class TrendingMovieInitial extends TrendingMovieState {}

final class LoadingTrendingMovieState extends TrendingMovieState {}

final class ErrorTrendingMovieState extends TrendingMovieState {
  final String message;

  const ErrorTrendingMovieState({required this.message});
}

final class SuccessTrendingMovieState extends TrendingMovieState {
  final List<FilmEntities> films;

  const SuccessTrendingMovieState({required this.films});
}
