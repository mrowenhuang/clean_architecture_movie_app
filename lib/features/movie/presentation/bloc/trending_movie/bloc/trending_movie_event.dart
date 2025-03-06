part of 'trending_movie_bloc.dart';

sealed class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();

  @override
  List<Object> get props => [];
}


final class GenerateTrendingMovieEvent extends TrendingMovieEvent {}

final class GeneratePaginationTrendingMovieEvent extends TrendingMovieEvent {}
