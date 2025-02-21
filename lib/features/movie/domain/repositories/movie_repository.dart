import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure,List<FilmEntities>>> getTopRatedMovies();
}