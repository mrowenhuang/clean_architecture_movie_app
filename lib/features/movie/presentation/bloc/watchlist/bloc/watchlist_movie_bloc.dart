import 'dart:async';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/add_to_watchlist.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_watchlist_movie.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/remove_watchlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc
    extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final AddToWatchlist _addToWatchlist;
  final GetWatchlistMovie _getWatchlistMovie;
  final RemoveWatchlist _removeWatchlist;

  WatchlistMovieBloc(
      this._addToWatchlist, this._getWatchlistMovie, this._removeWatchlist)
      : super(WatchlistMovieInitial()) {
    on<AddFilmToWatchlist>(addFilmToWatchlist);
    on<GenerateWatchListMovies>(generateWatchListMovies);
  }

  FutureOr<void> addFilmToWatchlist(
      AddFilmToWatchlist event, Emitter<WatchlistMovieState> emit) async {
    emit(LoadingAddToWatchlistState());
    if (event.film.fav!) {
      event.film.fav = !event.film.fav!;
      final response = await _removeWatchlist.call(event.film);
      response.fold(
        (failure) {
          emit(ErrorGetWatchlistState(message: failure.toString()));
        },
        (data) {
          _removeWatchlist.call(event.film);
          emit(SuccesRemoveWatchlistState(message: data));
          add(GenerateWatchListMovies());
        },
      );
    } else {
      event.film.fav = !event.film.fav!;
      final response = await _addToWatchlist.call(event.film);
      response.fold(
        (failure) {
          emit(ErrorGetWatchlistState(message: failure.toString()));
        },
        (data) {
          emit(SuccessAddToWatchlistState(message: data));
          add(GenerateWatchListMovies());
        },
      );
    }
  }

  FutureOr<void> generateWatchListMovies(
      GenerateWatchListMovies event, Emitter<WatchlistMovieState> emit) async {
    emit(LoadingGenerateWatchlistState());
    final response = await _getWatchlistMovie.call();
    response.fold(
      (failure) {
        emit(ErrorGetWatchlistState(message: failure.message));
      },
      (film) {
        emit(SuccesGetWatchlistState(film: film));
      },
    );
  }
}
