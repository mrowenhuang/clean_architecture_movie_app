import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTrendingMovies {
  final MovieRepository _movieRepository;

  GetTrendingMovies(this._movieRepository);

  Future<Either<ServerFailure, List<FilmEntities>>> call(
      {String page = "1"}) async {
    return await _movieRepository.getTrendingMovies(page: page);
  }
}
