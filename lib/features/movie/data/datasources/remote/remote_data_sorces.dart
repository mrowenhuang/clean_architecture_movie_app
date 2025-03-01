import 'package:clean_architecture_movie_app/core/constant/api_network.dart';
import 'package:clean_architecture_movie_app/core/failure/server_exception.dart';
import 'package:clean_architecture_movie_app/core/network/dio_conn.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/search_film_models.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSorces {
  Future<List<FilmModels>> getTopRatedMovies();
  Future<List<FilmModels>> getPopularMovies();
  Future<SearchFilmModels> getSearchMovies(String movieName,
      {String page = "1"});
  Future<SearchFilmModels> getLanguageMovies(
      {String language = "id", String year = "2025", String page = "1"});
}

class RemoteDataSorcesImpl implements RemoteDataSorces {
  final Dio _dioConn = DioConn.dio;

  @override
  Future<List<FilmModels>> getTopRatedMovies() async {
    final response = await _dioConn.get(ApiNetwork.topRated);

    if (response.statusCode == 200) {
      final List<FilmModels> filmData = (response.data['results'] as List).map(
        (film) {
          return FilmModels.fromMap(film);
        },
      ).toList();

      print(filmData);
      return filmData;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FilmModels>> getPopularMovies() async {
    final response = await _dioConn.get(ApiNetwork.popular);
    if (response.statusCode == 200) {
      final List<FilmModels> filmData = (response.data['results'] as List).map(
        (film) {
          return FilmModels.fromMap(film);
        },
      ).toList();
      return filmData;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SearchFilmModels> getSearchMovies(String movieName,
      {String page = "1"}) async {
    final response =
        await _dioConn.get(ApiNetwork.searchMovie(movieName, page: page));

    if (response.statusCode == 200) {
      final SearchFilmModels filmData = SearchFilmModels.fromMap(response.data);

      return filmData;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SearchFilmModels> getLanguageMovies(
      {String language = "id", String year = "2025", String page = "1"}) async {
    final response = await _dioConn
        .get(ApiNetwork.searchByLanguage(language, year, page: page));

    if (response.statusCode == 200) {
      final SearchFilmModels filmData = SearchFilmModels.fromMap(response.data);

      return filmData;
    } else {
      throw ServerException();
    }
  }
}
