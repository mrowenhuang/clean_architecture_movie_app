part of 'filter_movie_bloc.dart';

sealed class FilterMovieEvent extends Equatable {
  const FilterMovieEvent();

  @override
  List<Object> get props => [];
}

final class GetFilterMovieEvent extends FilterMovieEvent {
  final String language;
  final String year;
  final String page;

  const GetFilterMovieEvent({
    required this.language,
    required this.year,
    required this.page,
  });
}

final class GetLanguageMovieEvent extends FilterMovieEvent {
  final String language;

  const GetLanguageMovieEvent({required this.language});
}

final class GetYearMovieEvent extends FilterMovieEvent {
  final String year;

  const GetYearMovieEvent({required this.year});
}
