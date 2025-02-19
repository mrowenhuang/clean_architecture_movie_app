import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';

abstract class MovieRepository {
  Future<FilmEntities> getTopRatedMovies();
}