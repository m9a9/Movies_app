part of 'top_movies_cubit.dart';

abstract class TopMoviesState extends Equatable {
  const TopMoviesState();

  @override
  List<Object> get props => [];
}

class TopMoviesInitial extends TopMoviesState {}

class TopMoviesLoading extends TopMoviesState {}

class TopMoviesSuccess extends TopMoviesState {
  final List<Movie> movies;

  const TopMoviesSuccess(this.movies);
}

class TopMoviesFailure extends TopMoviesState {
  final String errMessage;

  const TopMoviesFailure(this.errMessage);
}
