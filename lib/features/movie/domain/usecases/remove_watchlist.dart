import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveWatchlist {
  final MovieRepository _movieRepository;

  RemoveWatchlist(this._movieRepository);


  Future<Either<ServerFailure,String>> call (FilmEntities film) async{
    return await _movieRepository.removeFromWatchList(film);
  }


}