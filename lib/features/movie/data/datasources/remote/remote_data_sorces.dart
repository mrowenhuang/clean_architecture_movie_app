import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';

abstract class RemoteDataSorces {
  Future <List<FilmModels>> getTopRatedMovies();
}

class RemoteDataSorcesImpl implements RemoteDataSorces{

  
  @override
  Future<List<FilmModels>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

}
