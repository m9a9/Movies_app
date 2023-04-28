part of 'movies_by_genre_cubit.dart';

abstract class MoviesByGenreState extends Equatable {
  const MoviesByGenreState();

  @override
  List<Object> get props => [];
}

class MoviesByGenreInitial extends MoviesByGenreState {}

class MoviesByGenreLoading extends MoviesByGenreState {}

class MoviesByGenreSuccess extends MoviesByGenreState {
  final List<Movie> movies;

  const MoviesByGenreSuccess(this.movies);
}

class MoviesByGenreFailure extends MoviesByGenreState {
  final String errMessage;

  const MoviesByGenreFailure(this.errMessage);
}
