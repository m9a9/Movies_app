part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final List<Movie> movieDetails;

  const MovieDetailsSuccess(this.movieDetails);
}

class MovieDetailsFailure extends MovieDetailsState {
  final String errrMessage;

  const MovieDetailsFailure(this.errrMessage);
}
