import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FilmEntities extends Equatable {
  String? backdropPath;
  List? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  int? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? description;
  bool? video;
  bool? fav = false;
  int? voteAverage;
  int? voteCount;

  FilmEntities({
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
    this.fav,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props {
    return [
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      description,
      video,
      fav,
      voteAverage,
      voteCount,
    ];
  }
}
