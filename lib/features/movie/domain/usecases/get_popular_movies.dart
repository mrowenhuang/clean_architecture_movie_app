import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovies {
  final MovieRepository _movieRepository;

  GetPopularMovies(this._movieRepository);

  Future<Either<Failure, List<FilmEntities>>> call({String page = "1"}) async {
    return await _movieRepository.getPopularMovies(page: page);
  }
}
