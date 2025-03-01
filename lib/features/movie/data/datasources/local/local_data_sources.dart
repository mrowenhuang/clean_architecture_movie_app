import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSources {
  Future<List<FilmModels>> getWatchListMovies();
}

class LocalDataSourcesImpl implements LocalDataSources {
  final Box _box;

  LocalDataSourcesImpl(this._box);

  @override
  Future<List<FilmModels>> getWatchListMovies() async {
    final List<FilmModels> filmData = await _box.get("watchlist");

    return filmData;
  }
}
