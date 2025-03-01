import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/add_to_watchlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc
    extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final AddToWatchlist _addToWatchlist;

  WatchlistMovieBloc(this._addToWatchlist) : super(WatchlistMovieInitial()) {
    on<AddFilmToWatchlist>(addFilmToWatchlist);
  }

  FutureOr<void> addFilmToWatchlist(
      AddFilmToWatchlist event, Emitter<WatchlistMovieState> emit) async {
    final response = await _addToWatchlist.call(event.film);
    response.fold(
      (failure) {},
      (film) {
        print(film);
      },
    );
  }
}
