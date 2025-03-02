part of 'watchlist_movie_bloc.dart';

sealed class WatchlistMovieState extends Equatable {}

final class WatchlistMovieInitial extends WatchlistMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SuccessAddToWatchlistState extends WatchlistMovieState {
  // final bool status;
  final String message;

  SuccessAddToWatchlistState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

final class SuccesRemoveWatchlistState extends WatchlistMovieState {
  // final bool status;
  final String message;

  SuccesRemoveWatchlistState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

final class SuccesGetWatchlistState extends WatchlistMovieState {
  final List<FilmEntities> film;

  SuccesGetWatchlistState({required this.film});

  @override
  // TODO: implement props
  List<Object?> get props => [film];
}

final class ErrorGetWatchlistState extends WatchlistMovieState {
  final String message;

  ErrorGetWatchlistState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

final class LoadingAddToWatchlistState extends WatchlistMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class LoadingGenerateWatchlistState extends WatchlistMovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
