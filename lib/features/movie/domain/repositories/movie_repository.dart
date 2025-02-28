import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure, List<FilmEntities>>> getTopRatedMovies();
  Future<Either<ServerFailure, List<FilmEntities>>> getPopularMovies();
  Future<Either<ServerFailure, SearchFilmEnities>> getSearchMovies(
      String movieName,
      {String page = "1"});
  Future<Either<ServerFailure, SearchFilmEnities>> getlanguageMovies(
      String language, String year,
      {String page = "1"});
  Future<Either<ServerFailure, List<FilmEntities>>> addToWatchList(
      FilmEntities film);
}
