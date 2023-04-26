import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/Top_Movies/data/model/genre_model.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
import 'package:movies_app/features/Top_Movies/data/model/person_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Movie>>> fetchNowPlaying();
  Future<Either<Failures, List<Genre>>> fetchGenreList();
  Future<Either<Failures, List<Person>>> fetchTrendingActors();
  Future<Either<Failures, List<Movie>>> fetchMoviesByGenre();
}
