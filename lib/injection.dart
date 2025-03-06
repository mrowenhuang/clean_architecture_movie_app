import 'package:clean_architecture_movie_app/features/movie/data/datasources/local/local_data_sources.dart';
import 'package:clean_architecture_movie_app/features/movie/data/datasources/remote/remote_data_sorces.dart';
import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:clean_architecture_movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/add_to_watchlist.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_language_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_search_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_trending_movies.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/get_watchlist_movie.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/usecases/remove_watchlist.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/filter_movie/bloc/filter_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/page_control/cubit/page_control_cubit.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/trending_movie/bloc/trending_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/watchlist/bloc/watchlist_movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  Hive.registerAdapter(FilmModelsAdapter());
  var box = await Hive.openBox("watchlist_box");

  sl.registerLazySingleton(
    () => box,
  );

  // TODO : BLOC

  sl.registerFactory(
    () => TopRatedMovieBloc(sl()),
  );
  sl.registerFactory(
    () => PopularMovieBloc(sl()),
  );
  sl.registerFactory(
    () => SearchMovieBloc(sl()),
  );
  sl.registerFactory(
    () => FilterMovieBloc(sl()),
  );
  sl.registerFactory(
    () => WatchlistMovieBloc(sl(), sl(), sl()),
  );
  sl.registerFactory(
    () => TrendingMovieBloc(sl()),
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
  sl.registerLazySingleton(
    () => GetSearchMovies(sl()),
  );
  sl.registerLazySingleton(
    () => GetLanguageMovies(sl()),
  );
  sl.registerLazySingleton(
    () => AddToWatchlist(sl()),
  );
  sl.registerLazySingleton(
    () => GetWatchlistMovie(sl()),
  );
  sl.registerLazySingleton(
    () => RemoveWatchlist(sl()),
  );
  sl.registerLazySingleton(
    () => GetTrendingMovies(sl()),
  );

  // TODO : REPOSITORIES

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl(), sl(), sl()),
  );

  // TODO : DATA SOURCES
  sl.registerLazySingleton<RemoteDataSorces>(
    () => RemoteDataSorcesImpl(),
  );

  sl.registerLazySingleton<LocalDataSources>(
    () => LocalDataSourcesImpl(sl()),
  );
}
