part of 'popular_movie_bloc.dart';

sealed class PopularMovieState extends Equatable {
  const PopularMovieState();
  
  @override
  List<Object> get props => [];
}

final class PopularMovieInitial extends PopularMovieState {}
