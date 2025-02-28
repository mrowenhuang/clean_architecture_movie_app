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
  Future<Either<ServerFailure, List<FilmEntities>>> addToWatchList(
      FilmEntities film) async {
    print(film.title);

    try {
      await _box.put("watchlist", film);

      print('Ini dari rps imp');

      final List<FilmEntities> data =
          await _localDataSources.getWatchListMovies();

      return right(data);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
