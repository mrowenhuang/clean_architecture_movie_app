// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';

class FilmModels extends FilmEntities {
  FilmModels({
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.description,
    super.video,
    super.fav,
    super.voteAverage,
    super.voteCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdropPath,
      'genre_ids': genreIds?.map((e) => e).toList(),
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'description': description,
      'video': video,
      'fav': fav,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory FilmModels.fromMap(Map<String, dynamic> map) {
    return FilmModels(
      backdropPath:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      genreIds: map['genre_ids'] != null
          ? List<int>.from(map['genre_ids'] as List<dynamic>)
          : null,
      id: map['id'] != null ? map['id'] as int : null,
      originalLanguage: map['original_language'] != null
          ? map['original_language'] as String
          : null,
      originalTitle:
          map['original_title'] != null ? map['original_title'] as String : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      popularity: map['popularity'] != null ? map['popularity'] as double : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      releaseDate:
          map['release_date'] != null ? map['release_date'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      video: map['video'] != null ? map['video'] as bool : null,
      fav: map['fav'] != null ? map['fav'] as bool : null,
      voteAverage:
          map['vote_average'] != null ? map['vote_average'] as double : null,
      voteCount: map['vote_count'] != null ? map['vote_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmModels.fromJson(String source) =>
      FilmModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
