import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetSearchMovies {
  final MovieRepository _movieRepository;

  GetSearchMovies(this._movieRepository);

  Future<Either<Failure, SearchFilmEnities>> call(String movieName,
      {String page = "1"}) async {
    return await _movieRepository.getSearchMovies(movieName, page: page);
  }
}
