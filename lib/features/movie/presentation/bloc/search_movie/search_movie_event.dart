part of 'search_movie_bloc.dart';

sealed class SearchMovieEvent extends Equatable {
  const SearchMovieEvent();

  @override
  List<Object> get props => [];
}

final class GetSearchMovie extends SearchMovieEvent {
  final String keyword;

  const GetSearchMovie({required this.keyword});
}
