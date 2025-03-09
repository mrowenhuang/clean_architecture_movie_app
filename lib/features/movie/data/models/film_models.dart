// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_architecture_movie_app/core/change/genre.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:clean_architecture_movie_app/features/movie/domain/entities/film_entities.dart';

part 'film_models.g.dart';

@HiveType(typeId: 1)
class FilmModels extends FilmEntities {
  @override
  @HiveField(0)
  final String? backdropPath;

  @override
  @HiveField(1)
  final List<String>? genreIds;

  @override
  @HiveField(2)
  final int? id;

  @override
  @HiveField(3)
  final String? originalLanguage;

  @override
  @HiveField(4)
  final String? originalTitle;

  @override
  @HiveField(5)
  final String? overview;

  @override
  @HiveField(6)
  final double? popularity;

  @override
  @HiveField(7)
  final String? posterPath;

  @override
  @HiveField(8)
  final String? releaseDate;

  @override
  @HiveField(9)
  final String? title;

  @override
  @HiveField(10)
  final String? description;

  @override
  @HiveField(11)
  final bool? video;

  @override
  @HiveField(12)
  bool? fav;

  @override
  @HiveField(13)
  final double? voteAverage;

  @override
  @HiveField(14)
  final int? voteCount;

  FilmModels({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.description,
    this.video,
    this.fav = false,
    this.voteAverage,
    this.voteCount,
  }) : super(
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          description: description,
          video: video,
          fav: fav,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
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
          ? Genre().genreConverter(
              (map['genre_ids'] as List).map((e) => e.toString()).toList())
          : null,
      id: map['id'] != null ? map['id'] as int : null,
      originalLanguage: map['original_language'] != null
          ? map['original_language'] as String
          : null,
      originalTitle: map['original_title'] != null
          ? map['original_title'] as String
          : null,
      overview: map['overview'] != null ? map['overview'] as String : null,
      popularity:
          map['popularity'] != null ? map['popularity'] as double : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      releaseDate:
          map['release_date'] != null ? map['release_date'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      video: map['video'] != null ? map['video'] as bool : null,
      fav: map['fav'] is bool ? map['fav'] : false,
      voteAverage:
          map['vote_average'] != null ? map['vote_average'] as double : null,
      voteCount: map['vote_count'] != null ? map['vote_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmModels.fromJson(String source) =>
      FilmModels.fromMap(json.decode(source) as Map<String, dynamic>);

  FilmModels toggleFav() {
    return FilmModels(
      fav: !fav!, // Toggle nilai fav
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      description: description,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
