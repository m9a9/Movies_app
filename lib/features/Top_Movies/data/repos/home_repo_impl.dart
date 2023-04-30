import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/Top_Movies/data/model/cast_list_model.dart';
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
  Future<Either<Failures, List<Genre>>> fetchGenreList() async {
    try {
      var data = await apiService.get(endPoint: 'genre/movie/list?');

      List<Genre> genres = [];
      for (var item in data['genres']) {
        genres.add(Genre.fromJson(item));
      }
      return right(genres);
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<Movie>>> fetchMoviesByGenre(int id) async {
    try {
      var data =
          await apiService.get(endPoint: 'discover/movie?with_genres=$id&');
      List<Movie> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(Movie.fromJson(item));
        } catch (e) {
          print(e.toString());
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
  Future<Either<Failures, List<Movie>>> fetchNowPlaying() async {
    try {
      var data = await apiService.get(endPoint: 'movie/now_playing?');
      List<Movie> movies = [];
      for (var item in data['results']) {
        try {
          movies.add(Movie.fromJson(item));
        } catch (e) {
          print(e.toString());
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
  Future<Either<Failures, List<Person>>> fetchTrendingActors() async {
    try {
      var data = await apiService.get(endPoint: 'trending/person/week?');
      List<Person> person = [];
      for (var item in data['results']) {
        try {
          person.add(Person.fromJson(item));
        } catch (e) {
          print(e.toString());
        }
      }
      return Right(person);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<Movie>>> fetchSimilarMovies(
      {required int id}) async {
    try {
      var data = await apiService.get(endPoint: 'movie/$id/similar?');

      List<Movie> movie = [];
      for (var item in data['results']) {
        try {
          movie.add(Movie.fromJson(item));
        } catch (e) {
          print(e.toString());
        }
      }
      return Right(movie);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
