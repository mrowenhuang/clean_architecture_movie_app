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
      'backdropPath': backdropPath,
      'genreIds': genreIds?.map((e) => e).toList(),
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'description': description,
      'video': video,
      'fav': fav,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory FilmModels.fromMap(Map<String, dynamic> map) {
    return FilmModels(
      backdropPath:
          map['backdropPath'] != null ? map['backdropPath'] as String : null,
      genreIds: map['genreIds'] != null
          ? List<int>.from(map['genreIds'] as List<dynamic>)
          : null,
      id: map['id'] != null ? map['id'] as int : null,
      originalLanguage: map['originalLanguage'] != null
          ? map['originalLanguage'] as String
          : null,
      originalTitle:
          map['originalTitle'] != null ? map['originalTitle'] as String : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      popularity: map['popularity'] != null ? map['popularity'] as int : null,
      posterPath:
          map['posterPath'] != null ? map['posterPath'] as String : null,
      releaseDate:
          map['releaseDate'] != null ? map['releaseDate'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      video: map['video'] != null ? map['video'] as bool : null,
      fav: map['fav'] != null ? map['fav'] as bool : null,
      voteAverage:
          map['voteAverage'] != null ? map['voteAverage'] as int : null,
      voteCount: map['voteCount'] != null ? map['voteCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmModels.fromJson(String source) =>
      FilmModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
