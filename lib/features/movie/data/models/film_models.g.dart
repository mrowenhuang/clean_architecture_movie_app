// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilmModelsAdapter extends TypeAdapter<FilmModels> {
  @override
  final int typeId = 1;

  @override
  FilmModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilmModels(
      backdropPath: fields[0] as String?,
      genreIds: (fields[1] as List?)?.cast<int>(),
      id: fields[2] as int?,
      originalLanguage: fields[3] as String?,
      originalTitle: fields[4] as String?,
      overview: fields[5] as String?,
      popularity: fields[6] as double?,
      posterPath: fields[7] as String?,
      releaseDate: fields[8] as String?,
      title: fields[9] as String?,
      description: fields[10] as String?,
      video: fields[11] as bool?,
      fav: fields[12] as bool? ?? false,
      voteAverage: fields[13] as double?,
      voteCount: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FilmModels obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.genreIds)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.fav)
      ..writeByte(13)
      ..write(obj.voteAverage)
      ..writeByte(14)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
