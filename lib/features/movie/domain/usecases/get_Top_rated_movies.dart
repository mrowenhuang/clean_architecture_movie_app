import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedMovies {
  final MovieRepository _movieRepository;

  GetTopRatedMovies(this._movieRepository);

  Future<Either<Failure, List<FilmEntities>>> call() async {
    return await _movieRepository.getTopRatedMovies();
  }
}
