import 'package:clean_architecture_movie_app/core/failure/server_failure.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSources {
  Future<Either<ServerFailure, List<FilmModels>>> getWatchListMovies();
}

class LocalDataSourcesImpl implements LocalDataSources {
  final Box _box;

  LocalDataSourcesImpl(this._box);

  @override
  Future<Either<ServerFailure, List<FilmModels>>> getWatchListMovies() async {
    print(_box.get("watchlist"));
    if ((_box.get("watchlist")) == null) {
      return left(ServerFailure(message: "No Watchlist"));
    } else {
      final List<FilmModels> filmData =
          (_box.get("watchlist") as List<dynamic>?)
                  ?.map((e) => e as FilmModels)
                  .toList() ??
              [];
      return right(filmData);
    }
  }
}
