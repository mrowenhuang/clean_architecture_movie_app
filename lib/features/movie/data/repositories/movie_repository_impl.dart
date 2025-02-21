import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/data/datasources/remote/remote_data_sorces.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSorces _remoteDataSorces;

  MovieRepositoryImpl(this._remoteDataSorces);

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
}
