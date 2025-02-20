import 'package:clean_architecture_movie_app/core/constant/api_network.dart';
import 'package:dio/dio.dart';

class DioConn {
  static final Dio _dio = Dio(BaseOptions(baseUrl: ApiNetwork.baseUrl));

  static Dio get dio {
    _setUpInterceptor();
    return _dio;
  }

  static void _setUpInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Authorization'] = "Bearer ${ApiNetwork.apiKey}";
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
    ));
  }
}
