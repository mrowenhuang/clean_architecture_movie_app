import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';
import 'package:equatable/equatable.dart';

class SearchFilmEnities extends Equatable {
  int? page;
  List<FilmEntities>? results;
  int? totalPages;
  int? totalResults;

  SearchFilmEnities({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [
    page,
    results,
    totalPages,
    totalResults,
  ];
}
