part of 'top_rated_movie_bloc.dart';

abstract class TopRatedMovieEvent extends Equatable {
  const TopRatedMovieEvent();

  @override
  List<Object> get props => [];
}

final class GenerateTopRatedMovie extends TopRatedMovieEvent {}

final class GeneratePaginationTopRatedMovie extends TopRatedMovieEvent {}
