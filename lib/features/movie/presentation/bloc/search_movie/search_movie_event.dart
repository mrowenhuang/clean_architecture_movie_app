part of 'search_movie_bloc.dart';

sealed class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

final class GenerateSearchMovie extends SearchMovieEvent {
  final String keyword;

  const GenerateSearchMovie({required this.keyword});
}

final class GeneratePaginationSearchMovie extends SearchMovieEvent {
  final String keyword;

  const GeneratePaginationSearchMovie({required this.keyword});
}
