part of 'watchlist_movie_bloc.dart';

sealed class WatchlistMovieEvent extends Equatable {
  const WatchlistMovieEvent();

  @override
  List<Object> get props => [];
}

final class AddFilmToWatchlist extends WatchlistMovieEvent {
  final FilmEntities film;

  const AddFilmToWatchlist({required this.film});
}

final class GenerateWatchListMovies extends WatchlistMovieEvent {}