import 'dart:convert';

import 'package:clean_architecture_movie_app/features/movie/data/models/film_models.dart';
import 'package:clean_architecture_movie_app/features/movie/domain/entities/search_film_enities.dart';

class SearchFilmModels extends SearchFilmEnities {
  SearchFilmModels({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results?.map((e) => (e as FilmModels).toMap()).toList(),     'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory SearchFilmModels.fromMap(Map<String, dynamic> map) {
    return SearchFilmModels(
      page: map['page'] != null ? map['page'] as int : null,
      results: map['results'] != null
          ? (map['results'] as List<dynamic>)
              .map((item) => FilmModels.fromMap(item as Map<String, dynamic>))
              .toList()
          : null,
      totalPages: map['total_pages'] != null ? map['total_pages'] as int : null,
      totalResults:
          map['total_results'] != null ? map['total_results'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchFilmModels.fromJson(String source) =>
      SearchFilmModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
