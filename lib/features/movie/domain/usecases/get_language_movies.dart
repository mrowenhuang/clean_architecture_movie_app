import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetLanguageMovies {
  final MovieRepository _movieRepository;

  GetLanguageMovies(this._movieRepository);

  Future<Either<ServerFailure, SearchFilmEnities>> call(
      String language, String year,
      {String page = "1"}) async {
    return await _movieRepository.getlanguageMovies(
      language = language,
      year = year,
      page: page,
    );
  }
}
