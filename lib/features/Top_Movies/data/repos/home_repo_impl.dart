import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/Top_Movies/data/model/person_model.dart';
import 'package:movies_app/features/Top_Movies/data/model/movie_model.dart';
import 'package:movies_app/features/Top_Movies/data/model/genre_model.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/Top_Movies/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<Genre>>> fetchGenreList() {
    // TODO: implement fetchGenreList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<Movie>>> fetchMoviesByGenre() {
    // TODO: implement fetchMoviesByGenre
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<Movie>>> fetchNowPlaying() async {
    try {
      var data = await apiService.get(endPoint: 'movie/now_playing');
      List<Movie> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(Movie.fromJson(item));
        } catch (e) {
          movies.add(Movie.fromJson(item));
        }
      }
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<Person>>> fetchTrendingActors() {
    // TODO: implement fetchTrendingActors
    throw UnimplementedError();
  }
}
