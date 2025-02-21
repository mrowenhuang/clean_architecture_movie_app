import 'package:clean_architecture_movie_app/core/constant/api_network.dart';
import 'package:clean_architecture_movie_app/core/failure/server_exception.dart';
import 'package:clean_architecture_movie_app/core/network/dio_conn.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSorces {
  Future<List<FilmModels>> getTopRatedMovies();
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
      return filmData;
    } else {
      throw ServerException();
    }
  }

}
