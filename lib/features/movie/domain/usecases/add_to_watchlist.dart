import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class AddToWatchlist {
  final MovieRepository _movieRepository;

  AddToWatchlist(this._movieRepository);

  Future<Either<ServerFailure, List<FilmEntities>>> call(FilmEntities film) async {
    return await _movieRepository.addToWatchList(film);
  }
}
