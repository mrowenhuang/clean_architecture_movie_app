import 'package:clean_architecture_movie_app/features/movie/data/datasources/remote/remote_data_sorces.dart';
import 'package:clean_architecture_movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/page_control/cubit/page_control_cubit.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // TODO : BLOC

  sl.registerFactory(
    () => TopRatedMovieBloc(sl()),
  );
  sl.registerFactory(
    () => PopularMovieBloc(sl()),
  );
  sl.registerFactory(
    () => PageControlCubit(),
  );

  // TODO : USE CASES
  sl.registerLazySingleton(
    () => GetTopRatedMovies(sl()),
  );
  sl.registerLazySingleton(
    () => GetPopularMovies(sl()),
  );

  // TODO : REPOSITORIES

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl()),
  );

  // TODO : DATA SOURCES
  sl.registerLazySingleton<RemoteDataSorces>(
    () => RemoteDataSorcesImpl(),
  );
}
