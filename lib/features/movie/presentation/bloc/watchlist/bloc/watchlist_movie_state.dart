part of 'watchlist_movie_bloc.dart';

sealed class WatchlistMovieState extends Equatable {
  const WatchlistMovieState();
  
  @override
  List<Object> get props => [];
}

final class WatchlistMovieInitial extends WatchlistMovieState {}

final class SuccessAddToWatchlistState extends WatchlistMovieState {
  final bool status;

  const SuccessAddToWatchlistState({required this.status});
}
