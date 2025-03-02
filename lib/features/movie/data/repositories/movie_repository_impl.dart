import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/data/datasources/local/local_data_sources.dart';
import 'package:clean_architecture_movie_app/features/movie/data/datasources/remote/remote_data_sorces.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSorces _remoteDataSorces;
  final LocalDataSources _localDataSources;
  final Box _box;
  List<FilmModels> filmData = [];

  MovieRepositoryImpl(
      this._remoteDataSorces, this._box, this._localDataSources);

  @override
  Future<Either<ServerFailure, List<FilmEntities>>> getTopRatedMovies() async {
    try {
      final List<FilmModels> film = await _remoteDataSorces.getTopRatedMovies();
      return right(film);
    } catch (e) {
      return left(
        ServerFailure(),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<FilmEntities>>> getPopularMovies() async {
    try {
      final List<FilmEntities> film =
          await _remoteDataSorces.getPopularMovies();
      return right(film);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, SearchFilmEnities>> getSearchMovies(
      String movieName,
      {String page = "1"}) async {
    try {
      final SearchFilmEnities film =
          await _remoteDataSorces.getSearchMovies(movieName, page: page);

      return right(film);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, SearchFilmEnities>> getlanguageMovies(
      String language, String year,
      {String page = "1"}) async {
    try {
      final SearchFilmEnities film = await _remoteDataSorces.getLanguageMovies(
          language: language, year: year, page: page);

      return right(film);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, String>> addToWatchList(
      FilmEntities film) async {
    try {
      filmData.add(
        FilmModels(
          backdropPath: film.backdropPath,
          description: film.description,
          fav: film.fav!,
          id: film.id,
          genreIds: film.genreIds,
          originalLanguage: film.originalLanguage,
          originalTitle: film.originalTitle,
          overview: film.overview,
          popularity: film.popularity,
          posterPath: film.posterPath,
          releaseDate: film.releaseDate,
          title: film.title,
          video: film.video,
          voteAverage: film.voteAverage,
          voteCount: film.voteCount,
        ),
      );
      _box.put("watchlist", filmData);

      return right("Already Add To Watchlist");
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<FilmEntities>>> getWatchListMovies() async {
    try {
      final List<FilmModels> film =
          await _localDataSources.getWatchListMovies();

      filmData = film;

      return right(film);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, String>> removeFromWatchList(
      FilmEntities film) async {
    try {
      filmData.removeWhere(
        (element) => element.id == film.id,
      );
      _box.put("watchlist", filmData);
      return right("Remove From Watchlist");
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
