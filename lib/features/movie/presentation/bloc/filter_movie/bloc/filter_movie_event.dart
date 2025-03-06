part of 'filter_movie_bloc.dart';

sealed class FilterMovieEvent extends Equatable {
  const FilterMovieEvent();

  @override
  List<Object> get props => [];
}

final class GetFilterMovieEvent extends FilterMovieEvent {
  final String language;
  final String year;

  const GetFilterMovieEvent({
    required this.language,
    required this.year,
  });
}

final class GenerateLanguageMovieEvent extends FilterMovieEvent {
  final String language;

  const GenerateLanguageMovieEvent({required this.language});
}

final class GenerateYearMovieEvent extends FilterMovieEvent {
  final String year;

  const GenerateYearMovieEvent({required this.year});
}

final class GeneratePaginationFilterMovie extends FilterMovieEvent {

}